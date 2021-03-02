#include <iostream>
#include <unistd.h>
#include <stdio.h>
#include <string>
#include <fstream>

using namespace std;

int main(int argc, char *argv[])
{
    if(argc != 6)
    {
        cout<<"ERROR: more or less than 5 arguments"<<endl;
        return 1;
    }
    int numbers[5];
    int median = 0;

    int p1[2]; //from parent to child1
    int p2[2]; //from child1 to parent
    int p3[2]; //from child1 to child2
    int p4[2]; //form child2 to parent

    if(pipe(p1) == -1 || pipe(p2) == -1 || pipe(p3) == -1 || pipe(p4) == -1)
    {
        cout<<"Failed to create pipe"<<endl;
        return 1;
    }

    pid_t f1,f2;

    f1 = fork();
    if(f1 == 0)
    {
        //we are in the child1
        close(p1[1]);//only reading from parent
        read(p1[0], &numbers, sizeof(numbers));
        close(p1[0]);

        //now sort. I use bubble sort because its
        //easy/short and I have implemented it multiple times
        for(int i = 0; i < 5; i++)
        {
            for(int j = 0; j < 4; j++)
            {
                if(numbers[j] > numbers[j+1])
                {
                    int tmp = numbers[j+1];
                    numbers[j+1] = numbers[j];
                    numbers[j] = tmp;
                }
            }
        }
        //numbers is now sorted, send to parent and other child
        close(p2[0]);
        close(p3[0]);
        write(p2[1], &numbers, sizeof(numbers));
        write(p3[1], &numbers, sizeof(numbers));
    }
    else
    {
        //we are in the parent
        f2 = fork();
        if(f2 == 0)
        {
            //we are in child2
            //read numbers from child1, p3
            close(p3[1]);
            read(p3[0], &numbers, sizeof(numbers));

            median = numbers[2];

            close(p4[0]);
            write(p4[1], &median, sizeof(median));
        }
        else
        {
            //we are in the parent
            close(p1[0]); //we need to close the read-descritor for first pipe
            for(int i = 0; i < 5; i++)
            {
                numbers[i] = atoi(argv[i+1]);
            }
            write(p1[1], &numbers, sizeof(numbers)); //send numbers to child1
            close(p1[1]);

            close(p2[1]); //only reading from second pipe, child1
            read(p2[0], &numbers, sizeof(numbers));
            close(p2[0]);

            //print numbers
            cout<<"Here are the numbers sorted: ";
            for(int i = 0; i < 5; i++)
            {
                cout<<numbers[i]<<" ";
            }
            cout<<endl;

            close(p4[1]); //reading from child2
            read(p4[0], &median, sizeof(median));
            cout<<"The median is: "<<median<<endl;
        }
    }
    return 0;
}