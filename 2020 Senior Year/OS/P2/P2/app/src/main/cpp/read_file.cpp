#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
#include "read_file.h"

char *read_file(const char *filename)
{
    int fd = open(filename, O_RDONLY);
    if(fd == -1)
    {
        //printf("just checking, in bad file");
        return nullptr;
    }

    off_t file_size = lseek(fd, 0, SEEK_END);//find size
    lseek(fd, 0, SEEK_SET); //go back to start
    char *buff = (char*)malloc(file_size + 1);//+1 for null at end

    ssize_t bytes_read = 0;

    while((bytes_read = read(fd, buff, file_size + 1))>0)
    {}

    close(fd);
    return buff;
}