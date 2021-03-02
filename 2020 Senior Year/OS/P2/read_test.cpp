#include <unistd.h>
#include <stdio.h>
#include <iostream>
#include <string.h>

#include "displayfile/read_file.h"

using namespace std;

int main(int argc, char *argv[])
{
    char *ptr;
    //call the function read_file
    ptr = read_file("test.txt");
    cout<< ptr;
    free(ptr);
    return 0;
}