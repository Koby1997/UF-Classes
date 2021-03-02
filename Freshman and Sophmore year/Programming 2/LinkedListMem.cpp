/*
Name: Koby Miller
UF ID: 51714009
Project 2
Short description: Creating a Linked list in order to alocate and keep track of memory

P.S. I know I have a lot of if statements that take care of if a pointer is
pointing to NULL and some of them are probably pointless, but I kepts betting
segmentation errors so I was being super careful. and when something worked I kept it.*/




#include <iostream>
#include <string>
using namespace std;

#include "Pa2.h"







LinkedList::LinkedList()
{
    head = new Node();
    head = NULL;
}








void LinkedList::insert(string value)   //only used to create first list of 32 Free pages
{
   if(head == NULL)
   {
       head = new Node(value);
       return;
   }
   Node *temp = head;
   while(temp->next!=NULL)
   {
       temp = temp->next;
   }
   temp->next = new Node(value);
}







void LinkedList::printList()        //used to print the 32 pages
{
    int x = 1;
    Node *temp = head;
    Node *temp2 = temp;
    cout<<temp->value<<"\t";
    while(temp->next!=NULL)
    {
        if(x>7 && x%8 == 0)         //this just seperates into 8 collumns to make it look nice
        {
            cout<<"\n";
            
        }
        temp2 = temp->next;
        cout<<temp2->value<<"\t";
        temp = temp->next;
        x++;
    }
    return;
}









int LinkedList::removeNode(string valueToDelete, string resetFree)        //used to delete the named program and reclaim it's memmory
{
    Node *p; p = head;          //used to move through list  
    Node *q; q = head;
    int pagesRecovered = 0;
    
    while(q != NULL)
    {
        while(q -> value != valueToDelete) // while the node is not the value you are looking to delete
        {
            p = q;                      //move throught the list
            q = q->next;
            if(q == NULL)               //if you get to the end and didn't find it, stop
            {
                break;
            }
        }
        if(q != NULL)                   //if you found your value
        {
            q -> value = resetFree;     //only have because it wouldn't work if I just put == "Free";
            q -> kb = 0;
            pagesRecovered++;
            q = q->next;
        }
        else if(pagesRecovered == 0)
        {
            cout<<"data not found\n";
        }
    }
    
    return pagesRecovered;
}








int LinkedList::fragments()
{
    Node *p; p = head;      //used to move through list
    Node *q; q = head;
    int z = 0;
    int fragment = 0;
    int check = 0;
    
    while(q != NULL)
    {
        if(q->next == NULL)
        {
            break;
        }
        while(q->value != "Free")
        {
            if(q->next == NULL)
            {
                fragment--;         //if the end of the list has values then this loop will be cut off but fragments will count up one, so we have to take one off
                break;
            }
            p = q;
            q = q->next;
            if(q == NULL && z == 0)
            {
                cout<<"The list is full. ";
                return fragment;
            }
            if(q == NULL)
            {
                break;
            }
        }
        while(q-> value == "Free")
        {
            z++;
            check++;
            p = q;
            q = q->next;
            if(q == NULL)
            {
                break;
            }
        }
        fragment++;
    }
    if(fragment == 1 && check == 0)     //it goes through the while loop at least one time.
    {                                   //if the list is filled then there are no fragments
        fragment = 0;                   //if check > 0 then there has to be at least 1 fragment
    }                                   //so the fragment counter will be right now
    return fragment;
}










void LinkedList::updateBest(string newValue, int pages, int partialMemory)
{
/*
This is how I did the best algorithm. I moved through my list and noted when I found a fragment.
I kept track of how big the fragment was untill it hit memory that was being used. I would then 
find the next fragment and also find it's size. I would compare the size to the one I already had.
The smaller one was kept (if big enough) and you would keep searching through the list and comparing
fragments untill you reached the end.*/


    Node *p; p = head;          //the nodes p and q are to move through the list
    Node *q; q = head;          //the nodes a and b are to remember specific positions
    Node *a;                    //a will stay with the int x and b will stay with the int b
    Node *b;                    
    int totalFreePages = 0;     //These two are used for specific cases explained below
    int continuousFreePages = 0;
    int x = 0;                  //x can be thought of as finding the fragments
    int y = 0;                  //y can be thought of as comparing the fragments and keeping the better one
    int z = 0;                  //z is made for a specific case explained below
    
    while(q != NULL)
    {
        if(q->next == NULL)
        {
            break;
        }
        while(q->value != "Free")
        {
            if(q->value == newValue)        //if it finds the program you are already running
            {
                cout<<"Error, Program "<<newValue<<" already running";
                return;
            }
            if(q->next == NULL)
            {
                break;//////
            }
            p = q;
            q = q->next;
            if(q == NULL && z == 0)     //since z = 0 it has not gotten to any fragments
            {
                cout<<"The list is full. There is no more memory";
                return;
            }
            else if(q == NULL)
            {
                break;
            }
        }
        if(q != NULL)
        {
           a = q; 
        }
        continuousFreePages = 0;        //reset each time while loop starts
        while(q->value == "Free")
        {
            continuousFreePages++;
            totalFreePages++;
            p = q;
            q = q->next;
            x++;
            if(q == NULL)
            {
                break;
            }
        }
    
        
        if(x < pages)           //if the fragment isn't big enough for the memory needed
        {
            x = 0;
        }
        else if(x >= pages)      //if it is big enough
        {
            if(y == 0)           //if this is the first fragment big enough
            {
                y = x;          //y is saved in order to compare in the future and x is reset to find the next fragment size
                x = 0;
                b = a;          //b is set here to remember where the start of the fragment is, will be used when putting in the programs
            }
            else if(y>0)
            {
                if(y>x)         //because this is the best algorithm, you want the smalles fragment possible. So if x finds a smaller one it saves it to y.
                {
                    y = x;
                    x = 0;
                    b = a;
                }
                else if(x>y)
                {
                    x = 0;
                }
            }
        }
        z++;
    }
    if((y == 0 && z > 1) || (totalFreePages < pages)) //if there is more than one fragment(z is greater than 1) yet no fragment is big enough (y == 0) for the program.
    {                                                   // or if the total amount of pages is not enough for the whole program.
        cout<<"Not enough memory";
        return;
    }
    if((y == 0 && continuousFreePages > pages) || (y > 0))  //can happen when the list only has one fragment, but it is big enough for the program.
    {                                                       //example could be the very beginning when every value is Free.
        q = b;
        p = b;
        for(int i = pages; i > 0; i--)
        {
            if(partialMemory > 0)
            {
                if(i == 1)
                {
                    q->value = newValue;
                    q->kb = partialMemory;
                } 
            }
                
            q->value = newValue;
            q->kb = 4;
            p = q;
            q = q->next;
                
        }
    }
    cout<<"\nProgram "<<newValue<<" added successfully: "<<pages<<" page(s) used.";
    return;
}









void LinkedList::updateWorst(string newValue, int pages, int partialMemory)
{
/*
This is how I did the worst algorithm. I moved through my list and noted when I found a fragment.
I kept track of how big the fragment was untill it hit memory that was being used. I would then 
find the next fragment and also find it's size. I would compare the size to the one I already had.
The bigger one was kept and you would keep searching through the list and comparing fragments untill
you reached the end.*/


    Node *p; p = head;          //the nodes p and q are to move through the list
    Node *q; q = head;          //the nodes a and b are to remember specific positions
    Node *a;                    //a will stay with the int x and b will stay with the int b
    Node *b;                    
    int totalFreePages = 0;     //These two are used for specific cases explained below
    int continuousFreePages = 0;
    int x = 0;                  //x can be thought of as finding the fragments
    int y = 0;                  //y can be thought of as comparing the fragments and keeping the better one
    int z = 0;                  //z is made for a specific case explained below
    
    while(q != NULL)
    {
        if(q->next == NULL)
        {
            break;
        }
        while(q->value != "Free")
        {
            if(q->value == newValue)        //if it finds the program you are already running
            {
                cout<<"Error, Program "<<newValue<<" already running";
                return;
            }
            if(q->next == NULL)
            {
                break;
            }
            p = q;
            q = q->next;
            if(q == NULL && z == 0)
            {
                cout<<"The list is full. There is no more memory";
                return;
            }
            else if(q == NULL)
            {
                break;
            }
        }
        if(q != NULL)
        {
           a = q; 
        }
        continuousFreePages = 0;        //reset each time while loop starts
        while(q->value == "Free")
        {
            continuousFreePages++;
            totalFreePages++;
            p = q;
            q = q->next;
            x++;
            if(q == NULL)
            {
                break;
            }
        }
    
        
        if(x < pages)           //if the fragment isn't big enough for the memory needed
        {
            x = 0;
        }
        else if(x >= pages)      //if it is big enough
        {
            if(y == 0)           //if this is the first fragment big enough
            {
                y = x;          //y is saved in order to compare in the future and x is reset to find the next fragment size
                x = 0;
                b = a;          //b is set here to remember where the start of the fragment is, will be used when putting in the programs
            }
            else if(y>0)        //if it is not the first fragment
            {
                if(y>x) 
                {
                    x = 0;
                }
                else if(x>y)    //because this is the worst algorithm, you want the biggest fragment, so if x finds a bigger one, it saves it to y
                {   
                    y = x;
                    x = 0;
                    b = a;
                }
            }
        }
        z++;
    }
    if((y == 0 && z > 1) || (totalFreePages < pages)) //if there is more than one fragment(z is greater than 1) yet no fragment is big enough (y == 0) for the program.
    {                                           // or if the total amount of pages is not enough for the whole program.
        cout<<"Not enough memory";
        return;
    }
    if((y == 0 && continuousFreePages > pages) || (y > 0))  //can happen when the list only has one fragment, but it is big enough for the program.
    {                                                       //example could be the very beginning when every value is Free.
        q = b;
        p = b;
        for(int i = pages; i > 0; i--)
        {
            if(partialMemory > 0)
            {
                if(i == 1)
                {
                    q->value = newValue;
                    q->kb = partialMemory;
                } 
            }
                
            q->value = newValue;
            q->kb = 4;
            p = q;
            q = q->next;
                
        }
    }
    cout<<"\nProgram "<<newValue<<" added successfully: "<<pages<<" page(s) used.";
    return;
}
    
 
 
 
 
 
int numPages(int size)  //determines the number of pages that the program needs
{
    int pages;
    if(size <= 0)       //program can't have 0 or negative memory
    {
        cout<<"Impossible";
        return 0;
    }
    else if(size > 0 && size <= 4)
    {
        pages = 1;
    }
    else if(size>4)
    {
        pages = size/4;         //finds how many full pages the program needs
        if(size%4 != 0)         //finds if it needs another page for the memmory that doesn't fill a whole page
        {
			pages += 1;
        }
    }
        return pages;
}






int numMemory(int size)         //didn't need to do but wanted to try to do it
{                               //finds the amount of kb a non-filled page has
    int partialMemory;
    partialMemory = size%4;     
    return partialMemory;
}








int main(int argc, char ** argv)
{
    
    std::string *cppArgs = new std::string[argc];           //need to change in order to read strings
    
    for (int i = 0; i < argc; i++)
    {
        cppArgs[i] = std::string(argv[i]);
    }
    bool algo;
    
    if(cppArgs[1] == "best" || cppArgs[1] == "Best" || cppArgs[1] == "BEST")        //didn't know how to get rid of capitalization
    {
        algo = true;
    }
    else if(cppArgs[1] == "worst" || cppArgs[1] == "Worst" || cppArgs[1] == "WORST")
    {
        algo = false;
    }
    else if(cppArgs[1] != "best" && cppArgs[1] != "worst")
    {
        cout<<"Sorry cannot run program. Best or Worst algorithm not indicated. Terminating program";
        return 0;
    }
    
    LinkedList ll;              //creates the LinkedList object named ll
    
    for(int i = 0; i<32;i++)    //fills list with "Free spaces"
    {
       ll.insert("Free");
    }

    int choice = 1;
    string value;                   //name of program that will be run
    string resetToFree = "Free";    //used in remove method, it was being difficult
    int size;                       //amount of kb the program needs
    int pages;                      //how many pages of memory the program needs to run
    int partialMemory;              //how many kb are on a page that is not full. I know we didn't need to do this but I figured it would be more practice  
    
    while(choice != 5)
    {
    
        
        cout<<"\n1. Add program\n";
        cout<<"2. Kill program\n";
        cout<<"3. Fragmentation\n";
        cout<<"4. Print memory\n";
        cout<<"5. Exit\n";
        
        cin>>choice;
        
        if(choice == 1)
        {
            cout<<"\nProgram name - ";
            cin>>value;
            cout<<"Program size (KB) - ";
            if(size > 1000)
            {
                break;
            }
            cin>>size;
            pages = numPages(size);
            if(pages == 0)
            {
                continue;
            }
            partialMemory = numMemory(size);

            if(algo == true)
            {
                ll.updateBest(value,pages,partialMemory);
            }
            else if(algo == false)
            {
                ll.updateWorst(value,pages,partialMemory);
            }
        }
        else if(choice == 2)
        {
            int temp;
            cout<<"Program name - ";
            cin>>value;
            temp = ll.removeNode(value,resetToFree);
            
            if(temp > 0)
            {
                cout<< "\nProgram "<<value <<" successfully killed, "<<temp<<" page(s) reclaimed.\n";
            }
            
            
        }
        else if(choice == 3)
        {
            cout<<"There are "<<ll.fragments()<<" fragment(s)";
        }
        else if(choice == 4)
        {
            ll.printList();
        }
        else if(choice == 5)        //ends program
        {
            break;
        }else if(choice <= 0 || choice > 5)
        {
            cout<<"Not an option, please try again";
        }
    }
    return 0;
}