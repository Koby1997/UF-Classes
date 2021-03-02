#include <iostream>
#include <unistd.h>
#include <stdio.h>
#include <string>
#include <fstream>

using namespace std;

int main(int argc, char *argv[])
{
    int count = 1;
    string Operation, successful;
    ifstream mypipe;
    mypipe.open(argv[1]);
    while(mypipe >> Operation >> successful)
    {
        //cout<<Operation<<successful<<endl;
        if(successful == "successful.")
            count++;
    }
    mypipe.close();

    cout<<"Program failed on operation "<< count << endl;

    return 0;
}