#include <iostream>
#include <unistd.h>
#include <stdio.h>
#include <string>

using namespace std;

int main(int argc, char *argv[])
{
    string lineInput;
    int count = 1;
    while(getline(cin, lineInput))
    {
        //cout<<lineInput<<endl;
        if(lineInput == "Operation successful.")
            count++;
    }
    cout<<"Program failed on operation "<< count << endl;
    return 0;
}