/*
Name: Koby Miller
UF ID: 51714009
Project 2
Short description: 
*/




#include <iostream>
#include <string>
using namespace std;





class Node
{
    friend class LinkedList;
    
    private:
        string value;
        int kb = 0;
        Node *next;
        
    public:
        Node();
        Node(string& n);

    
};


Node::Node(){}

Node::Node(string& n)
{
    value = n;
}









class LinkedList
{
    private:
        Node *head;
        Node *tail;
    
    
    public:
    LinkedList();
    
    
    
    void insert(string);
    void printList();
    int removeNode(string, string);
    void updateBest(string, int, int);
    void updateWorst(string, int, int);
    int fragments();
    
    
    
};