
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include "local_library.h"


// get sockaddr, IPv4 or IPv6:
void *get_in_addr(struct sockaddr *sa)
{
    if (sa->sa_family == AF_INET) {
        return &(((struct sockaddr_in*)sa)->sin_addr);
    }

    return &(((struct sockaddr_in6*)sa)->sin6_addr);
}

int main(int argc, char** argv)
{
    fd_set fd_list;    // fd_list file descriptor list
    fd_set fd_list_copy;  // temp file descriptor list for select()
    int maximum_fd_length;        // maximum file descriptor number
    int listener;     // listening socket descriptor
    int newsd;        // newly accept()ed socket descriptor
    struct sockaddr_storage client_address; // client address
    socklen_t address_length;
    char buffer[256];    // bufferfer for client data
    int received_bytes_size;
    char remote_IP[INET6_ADDRSTRLEN];
    int optval=1;        // for setsockopt() SO_REUSEADDR, below
    int fd_it, get_info_status;
    struct addrinfo host_address_info, *address_info, *ai_it;
    const int port=argv[1];
    
    if(argc<1){
        handle_error("Port not entered");
    }
    
    FD_ZERO(&fd_list);    // clear the fd_list and temp sets
    FD_ZERO(&fd_list_copy);

    // get us a socket and bind it
    memset(&host_address_info, 0, sizeof host_address_info);
    host_address_info.ai_family = AF_UNSPEC;
    host_address_info.ai_socktype = SOCK_STREAM;
    host_address_info.ai_flags = AI_PASSIVE;
    if ((get_info_status = getaddrinfo(NULL, &port, &host_address_info, &address_info)) != 0) {
        write(2, "selectserver: ", sizeof("selectserver: "));
        write(2, gai_strerror(get_info_status), gai_strerror(get_info_status));
        exit(1);
    }

    for(ai_it = address_info; ai_it != NULL; ai_it = ai_it->ai_next) {
        listener = socket(ai_it->ai_family, ai_it->ai_socktype, ai_it->ai_protocol);
        if (listener < 0) {
            continue;
        }

        // lose the pesky "address already in use" error message
        setsockopt(listener, SOL_SOCKET, SO_REUSEADDR, &optval, sizeof(int));

        if (bind(listener, ai_it->ai_addr, ai_it->ai_addrlen) < 0) {
            close(listener);
            continue;
        }

        break;
    }

    // if we got here, it means we didn't get bound
    if (ai_it == NULL) {
        fprintf(stderr, "selectserver: failed to bind\n");
        exit(2);
    }

    freeaddrinfo(address_info); // all done with this

    // listen
    if (listen(listener, 10) == -1) {
        perror("listen");
        exit(3);
    }

    // add the listener to the fd_list set
    FD_SET(listener, &fd_list);

    // keep track of the biggest file descriptor
    maximum_fd_length = listener; // so far, it's this one

    // main loop
    for(;;) {
        fd_list_copy = fd_list; // copy it
        if (select(maximum_fd_length+1, &fd_list_copy, NULL, NULL, NULL) == -1) {
            perror("select");
            exit(4);
        }

        // run through the existing connections looking for data to read
        for(fd_it = 0; fd_it <= maximum_fd_length; fd_it++) {
            if (FD_ISSET(fd_it, &fd_list_copy)) { // we got one!!
                if (fd_it == listener) {
                    // handle new connections
                    address_length = sizeof client_address;
                    newsd = accept(listener,
                                   (struct sockaddr *)&client_address,
                                   &address_length);

                    if (newsd == -1) {
                        perror("accept");
                    } else {
                        FD_SET(newsd, &fd_list); // add to fd_list set
                        if (newsd > maximum_fd_length) {    // keep track of the max
                            maximum_fd_length = newsd;
                        }
                        printf("selectserver: new connection from %s on "
                               "socket %d\n",
                               inet_ntop(client_address.ss_family,
                                         get_in_addr((struct sockaddr*)&client_address),
                                         remote_IP, INET6_ADDRSTRLEN),
                               newsd);
                    }
                } else {
                    // handle data from a client
                    if ((received_bytes_size = recv(fd_it, buffer, sizeof buffer, 0)) <= 0) {
                        // got error or connection closed by client
                        if (received_bytes_size == 0) {
                            // connection closed
                            printf("selectserver: socket %d hung up\n", fd_it);
                        } else {
                            perror("recv");
                        }
                        close(fd_it); // bye!
                        FD_CLR(fd_it, &fd_list); // remove from fd_list set
                    } else {
                        // we got some data from a client
//                        for(j = 0; j <= maximum_fd_length; j++) {
//                            // send to everyone!
//                            if (FD_ISSET(j, &fd_list)) {
//                                // except the listener and ourselves
//                                if (j != listener && j != fd_it) {
//                                    if (send(j, buffer, received_bytes_size, 0) == -1) {
//                                        perror("send");
//                                    }
//                                }
//                            }
//                        }
                    }
                } // END handle data from client
            } // END got new incoming connection
        } // END looping through file descriptors
    } // END for(;;)--and you thought it would never end!

    return 0;
}

