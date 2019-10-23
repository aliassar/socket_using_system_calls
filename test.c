#include <fcntl.h>
#include "local_library.h"

int main() {

    int fd, size;
    char content[1024];

    fd = open("./a.txt", O_RDONLY);

    if (fd > 0) {
        size = read(fd, content, sizeof(content));
        printf("%s", content);
    }
}