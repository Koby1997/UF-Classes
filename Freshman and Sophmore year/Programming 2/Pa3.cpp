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

#include "Pa3.h"





stack::stack(int size)
{
     storage = new string[size];
     for(int i = 0; i < size; i++)
     {
          storage[i] = "empty";
     }
     this->size = size;
     top = 0;
}

void stack::push(string i)
{
     top++;
     storage[top] = i;
}

void stack::pop()
{
     
     
     if((top == 0) && (storage[top] == "empty"))
     {
          negatives++;
          top = 0;
     }
     else if((top == 0) && (storage[top] != "empty"))
     {
          storage[top] = "";
     }
     else if(top != 0)
     {
          storage[top] = "empty";
          top--;
     }
}

bool stack::isEmpty()
{
     if(top == 0)
     {
          return true;
     }
     else if(top != 0)
     {
          return false;
     }
}

int stack::getTop()
{
     return top;
}

int stack::getNeg()
{
     return negatives;
}

















int main()
{
     stack loops(20);         //Creating my stacks
     stack paren(20);
     stack forAndEnd(20);
     stack forAndBegin(20);
     stack beginAndEnd(20);
     
     string line;
     string fileName;

     
     
     
     cout<<" Please enter the name of the input file: ";
     cin>>fileName;
     
     ifstream inputFile (fileName);
     if (!inputFile)          //checking if the file opened
     {
          cerr << "Input file could not be opened" << endl;
          exit(0);
     }
     
     
     
     
     
     
     
     
     //These are all the arrays I made in order to keep track of the keywords and delimeters and stuff like that
     
     
     
     string identifiers[20];  //lowercase words
     for(int i = 0;i<20;i++)
     {
          identifiers[i] = "empty";
     }
     int n = 0;               //going to keep track of next free array space
     
     
     string delimeters[2]; // , or ;
     for(int i = 0;i<2;i++)
     {
          delimeters[i] = "empty";
     }
     int d = 0;
     
     
     string constants[20];    //numbers
     for(int i = 0;i<20;i++)
     {
          constants[i] = "empty";
     }
     int c = 0;               
     
     
     string oporators[6];     //+,-,*,/,++,==
     for(int i = 0;i<6;i++)
     {
          oporators[i] = "empty";
     }
     int o = 0;               
     
     
     string spellingErrors[20]; //Mispelled words
     for(int i = 0;i<20;i++)
     {
          spellingErrors[i] = "empty";
     }
     int s = 0;               
     
     
     string keywords[3];      //FOR, BEGIN, END
     for(int i = 0;i<3;i++)
     {
          keywords[i] = "empty";
     }
     int k = 0;               
     
     
     string wordArray[100];   //the whole text file will be put into this array
     for(int i = 0;i<100;i++)
     {
          wordArray[i] = "empty";
     }
     int w = 0;   
     
     string syntax[20];
     for(int i = 0; i<20; i++)
     {
          syntax[i] = "empty";
     }
     int ax;
     
     
     
     
     
     
     
     /*In this next part, I basically read the text file and put it in one big array while also splitting it up into different arrays.
     first I read the file and split it up by spaces, then read each new line I made and separated it into capitalized words, lowercase, 
     and symbols by using the ascii values. I read by each char, which I know is not the most efficient, and the arrays are not the best
     either, but I was having trouble trying other things. Anyways, I read char by char untill a different kind of char comes up, then I
     keep the same chars together and put them into a string*/
     
     
     
     
     while(!inputFile.eof())
     {
          string temp;
          
          (getline(inputFile,line,' '));

          for(int i = 0;i < line.size(); i++)
          {
               if(line.at(i) > 64 && line.at(i) < 91)    //capital letter
               {
                    for(i; (i<line.size()) && (line.at(i) > 64 && line.at(i) < 91); i++)
                    {
                       temp += line.at(i);
                    }
                    wordArray[w] = temp;
                    w++;
                    if((temp!="FOR") && (temp!="BEGIN") && (temp!="END"))       //if any capital letter word is not one of these, it is spelled wrong
                    {
                         spellingErrors[k] = temp;
                         s++;
                    }
                    temp.clear();
                       
                    if(i == line.size())
                    {
                            continue;
                    }
               }
                  

                  
                  
               if(line.at(i) > 96 && line.at(i) < 123)    //lowercase letter
               {
                    for(i;(i<line.size()) && (line.at(i) > 96 && line.at(i) < 123); i++)
                    {
                         temp += line.at(i);
                    }
                    wordArray[w] = temp;
                    w++;
                    
                    bool checkUnique = true;                //this whole checkUniqu I use a couple times so I don't repeat my outputs in the end
                    for(int z = 0; z < 20; z++)
                    {
                         if(identifiers[z] == temp)
                         {
                              checkUnique = false;
                         }
                    }
                    if(checkUnique == true)
                    {
                         identifiers[n] = temp;
                         n++;
                    }
                    
                    temp.clear();
                       
                    if(i == line.size())
                    {
                            continue;
                    }
               }
                  
               if(line.at(i) > 47 && line.at(i) < 58)    //numbers
               {
                    for(i;(i<line.size()) && (line.at(i) > 47 && line.at(i) < 58); i++)
                    {
                         temp += line.at(i);
                    }
                    wordArray[w] = temp;
                    w++;
                    
                    bool checkUnique = true;
                    for(int z = 0; z < 20; z++)
                    {
                         if(constants[z] == temp)
                         {
                              checkUnique = false;
                         }
                    }
                    if(checkUnique == true)
                    {
                         constants[c] = temp;
                         c++;
                    }
                    temp.clear();
                       
                    if(i == line.size())
                    {
                         continue;
                    }
               }
               
               if((line.at(i) == 44) || (line.at(i) == 59)) //delimeters
               {
                    temp += line.at(i);
                    wordArray[w] = temp;
                    w++;
                    bool checkUnique = true;
                    for(int z = 0; z < 2; z++)
                    {
                         if(delimeters[z] == temp)
                         {
                              checkUnique = false;
                         }
                    }
                    if(checkUnique == true)
                    {
                         delimeters[d] = temp;
                         d++;
                    }
                    temp.clear();
                    if(i == line.size())
                    {
                         continue;
                    }
               }
                  
               
               if((i+1<line.size()) && ((line.at(i) == 43) && (line.at(i+1) == 43)))      //taking acount for the ++
               {
                    temp += line.at(i);
                    i++;
                    temp += line.at(i);
                    wordArray[w] = temp;
                    w++;
                    
                    bool checkUnique = true;
                    for(int z = 0; z < 6; z++)
                    {
                         if(oporators[z] == temp)
                         {
                              checkUnique = false;
                         }
                    }
                    if(checkUnique == true)
                    {
                         oporators[o] = temp;
                         o++;
                    }
                    
                    
                    temp.clear();
                       
                    if(i == line.size())
                    {
                         continue;
                    }
               }
               
               if((i+1<line.size()) && ((line.at(i) == 61) && (line.at(i+1) == 61)))      //taking acount for the ==
               {
                    temp += line.at(i);
                    i++;
                    temp += line.at(i);
                    wordArray[w] = temp;
                    w++;
                    bool checkUnique = true;
                    for(int z = 0; z < 6; z++)
                    {
                         if(oporators[z] == temp)
                         {
                              checkUnique = false;
                         }
                    }
                    if(checkUnique == true)
                    {
                         oporators[o] = temp;
                         o++;
                    }
                    temp.clear();
                    if(i == line.size())
                    {
                         continue;
                    }
               }
                  
               if((line.at(i) == 42) || (line.at(i) == 43) ||(line.at(i) == 45) || (line.at(i) == 47) || (line.at(i) == 61))  //oporators
               {
                    temp += line.at(i);
                    wordArray[w] = temp;
                    w++;
                    bool checkUnique = true;
                    for(int z = 0; z < 6; z++)
                    {
                         if(oporators[z] == temp)
                         {
                              checkUnique = false;
                         }
                    }
                    if(checkUnique == true)
                    {
                         oporators[o] = temp;
                         o++;
                    }
                    temp.clear();
                    if(i == line.size())
                    {
                         continue;
                    }
               }
               
               if((line.at(i) == 40) || (line.at(i) == 41))      //keeping parenthesis separate to know if they all match
               {
                    temp += line.at(i);
                    wordArray[w] = temp;
                    w++;
                    temp.clear();
                    if(i == line.size())
                    {
                         continue;
                    }
               }
          }
     }
     
     
     
     int i = 0;
     int howManyF = 0;        //keeping track of if any for/begin/end keywords are gone. I know the stacks are supposed to do that, but if you have and extra end
     int howManyB = 0;        //does that mean you are missing a for? missing a begin? or just have an extra end? so I did this to help keep track
     int howManyE = 0;
     int loopDepthMax = 0;
     int loopDepthCurrent = 0;
     
     
     bool fMissing = true;
     bool bMissing = true;
     bool eMissing = true;
     
     for(i; i < 100 && wordArray[i] != "empty";i++)
     {
          if(wordArray[i] == "FOR")
          {
              /* for(i; (i < 100) && (wordArray[i] != "empty"); i++)                 //come back to, trying differnt idea
               {
                    if(wordArray[i] == "BEGIN")
                    {
                         bMissing = false;
                    }
                    if(wordArray[i] == "END")
                    {
                         eMissing = false;
                    }
               }*/
               
               howManyF++;                                       //here Im trying to make seperate stacks to find which of the three keywords is missing or has an extra by comparing each to teh other two
               forAndBegin.push("FOR");
               forAndEnd.push("FOR");
               loopDepthCurrent++;
          }
          
          if(wordArray[i] == "BEGIN")
          {
               howManyB++;
               beginAndEnd.push("BEGIN");
               forAndBegin.pop();
               
          }
          if(wordArray[i] == "END")               //using the stacks I find the leght of the biggest nested loop by keeping one counting how deep it is and if it is the deepest it has gone before
          {
               howManyE++;
               forAndEnd.pop();
               beginAndEnd.pop();
               if(loopDepthCurrent > loopDepthMax)
               {
                    loopDepthMax = loopDepthCurrent;
                    loopDepthCurrent--;
               }
          }
          
          
          
          if(wordArray[i] == "(")
          {
               paren.push("(");
          }
          if(wordArray[i] == ")")
          {
               paren.pop();
          }
          
          
          
         // if(paren.getTop() > 0)             //to many opening parenthesis (or not enough end parenthesis??)
         // {
        //       for(int i = 0; i<paren.getTop(); i++)
        //       {
         //           syntax[ax] = "(";
          //          ax++;
          //     }
         // }
          
         // if(paren.getNeg() > 0 )            //too many end parenthesis (or not enough begining parenthesis??)
        //  { int x = paren.getNeg();
          //     for(int i = 0; i < x;i++)
           //   {
           //        syntax[ax] = ")";
             //      //ax++;
             //      cout<<paren.getNeg();
         //      }
         // }                                          did something wrong with these lines.... paren.getNeg() is a super long number......
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
     }    
          /*the next couple of lines just print out the stuff that we were
          supposed to keep track of, I basicaly just prin the arrays*/
     
     
     
          cout<<"The depth of nested loop(s) is "<<loopDepthMax;
          
          
          
          
          cout<<"Keywords:\t";
          for(i = 0; (i<3) && (keywords[i] != "empty"); i++)
          {
               cout<<keywords[i]<<"\t";
          }
          
          cout<<"Identifiers:\t";
          for(i = 0; (i<20) && (identifiers[i]!= "empty"); i++)
          {
               cout<<identifiers[i]<<"\t";
          }
          
          cout<<"Operators:\t";
          for(i = 0; (i<6) && (oporators[i] != "empty"); i++)
          {
               cout<<oporators[i]<<"\t";
          }
          
          cout<<"Delimiters:\t";
          for(i = 0;(i<2) && (delimeters[i] != "empty");i++)
          {
               cout<<delimeters[i]<<"\t";
          }
          
          
          
          
          
          cout<<"Syntax Errors(s):\t";
          if(spellingErrors[1] == "empty")               //if there was never an error
          {
               cout<<"NA";
          }
          else if(spellingErrors[1] != "empty")
          {
               for(i = 0; (i<20) && (spellingErrors[i] != "empty"); i++)
               {
                    cout<<spellingErrors[i]<<"\t";
               }
          }
          
     
     
     
     
     
     
     
}



