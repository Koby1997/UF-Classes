#include <iostream>
#include <unistd.h>
#include <stdio.h>
#include <string>
#include "read_file.h"

using namespace std;

int main(int argc, char *argv[])
{
    const char *filename = argv[1];

    string output = displayfile(filename);
    return 0;
}

string displayfile(const char *filename)
{
    char *ptr = read_file(filename);
    if(ptr == nullptr)
    {
        string output = "Error: File Not Found\n";
        cout<<output;
        free(ptr);
        return output;
    }
    cout<<ptr;
    string output = ptr;
    free(ptr);
    return output;
}