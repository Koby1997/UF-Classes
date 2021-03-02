#include <unistd.h>
#include <stdio.h>
#include "read_file.h"

using namespace std;

int main(int argc, char *argv[])
{
    const char *filename = argv[1];

    displayfile(filename);
    return 0;
}