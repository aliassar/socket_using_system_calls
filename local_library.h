//
// Created by Assar on 10/23/2019.
//

#ifndef OS_LOCAL_LIBRARY_H

#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/syscall.h>
#include <stdbool.h>

void handle_error(msg) {
    write(2, msg, sizeof(msg));
    exit(EXIT_FAILURE);
}

struct linux_dirent {
    long d_ino;
    off_t d_off;
    unsigned short d_reclen;
    char d_name[];
};

#define buffer_SIZE 1024

bool check_file_presence(char *filename, char *filepath) {
    int fd, nread;
    char buffer[buffer_SIZE];
    struct linux_dirent *d;
    int bpos;
    const char *a[30];
    fd = open(filepath, O_RDONLY | O_DIRECTORY);

    if (fd == -1)
        handle_error("open command failed");

    for (;;) {
        nread = syscall(SYS_getdents, fd, buffer, buffer_SIZE);

        if (nread == -1)
            handle_error("unable to show directory or directory is empty");

        if (nread == 0)
            break;

        for (bpos = 0; bpos < nread;) {
            d = (struct linux_dirent *) (buffer + bpos);
            if (strcmp(d->d_name, filename) == 0) return true;
        }
        bpos += d->d_reclen;
    }
    return false;
}

char *read_file(char *filepath) {

    int fd, size;
    char content[buffer_SIZE];

    fd = open(filepath, O_RDONLY);

    if (fd < 0) {
        handle_error("File could not be opened");
    } else {
        size = read(fd, content, sizeof(content));
        return content;
    }

    return 0;
}

void create_file(char *content, char *filename) {
    int fd = open(filename, O_RDONLY | O_CREAT);
    if (fd == -1)
        handle_error("open command failed");
    write(fd, content, strlen(content));
    return;
}

#define OS_LOCAL_LIBRARY_H
#endif //OS_LOCAL_LIBRARY_H
