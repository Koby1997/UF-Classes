/*
Name: Koby Miller
UF ID: 51714009
Project 3

*/


#include <iostream>
#include <string>
#include <vector>
#include <sstream>
#include <fstream>
using namespace std;




class stack
{
     private:
          string *storage;
          int top;
          int size;
          int negatives;
          
     public:
          stack(int);
          void push(string);
          void pop();
          bool isEmpty();
          int getTop();
          int getNeg();
};
