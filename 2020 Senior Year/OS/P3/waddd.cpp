#include <iostream>
#include <ifstream>
#include <unistd>
#include <stdio>
#include <fcntl>
#include <string>
#include <vector>


descriptor *newDescriptor(int offset, int length, int name, int level) //try to add parent when things start to work
{
    Node *temp = new Node;
    temp->offset = offset;
    temp->length = length;
    temp->name = name;
    temp->level = level;

    return temp;
}


class Wad
{

    private:
        struct Descriptor
        {
            int offset;
            int length;
            string name;
            bool isDirectory;
            int level;
            vector<Descriptor *> children;
            //Node *parent;
        };
        Descriptor root = {0, 0, "/", true, 0, null};

        

    public:

        int level;
        //File Header:
        string magic;
        int *numDescriptors;
        int *offset;
        //Descriptors:

        //  std::vector<
        //  element offset
        //  element length
        //  name(ascii)


        //Lump = the rest

        Descriptor *root;

    Wad()
    {
        level = 0;
        magic = "";
        numDescriptors = 0;
        offset = 0;
    }

    Descriptor *newDescriptor(int offset, int length, int name, int level) //try to add parent when things start to work
    {
        descriptor *temp = new Descriptor;
        temp->offset = offset;
        temp->length = length;
        temp->name = name;
        temp->level = level;

        return temp;
    }




    public static Wad *loadWad(const string &path)
    {
        Wad *myWad = new Wad;



        int fd = open(path, O_RDONLY);
        if(fd == -1)
        {
            //printf("Just checking, in bad file");
            return nullptr;
        }
 
        myWad.magic = (string)malloc(4); // may not need
        read(fd, magic, 4);

        myWad.numDescriptors = (int*)malloc(4);// may not need
        read(fd, numDescriptors, 4);
        printf("YOO! here is the numDescriptors: %d\n", numDescriptors);

        myWad.offset = (int*)malloc(4); // may not need
        read(fd, offset, 4);


        //now we need to skip to first offset
        lseek(fd, offset, SEEK_CUR);

        descriptorOffset = (int*)malloc(4);
        descriptorLength = (int*)malloc(4);
        descriptorName = (string)malloc(8);

        // Node.name = "\\";
        // Node.level = 0;



        for(int i = 0; i < numDescriptors; i++)
        {
            //myWad.root


            read(fd, descriptorOffset, 4);
            read(fd, descriptorLength, 4);
            read(fd, descriptorName, 8);

            bool isDirectory = false;
            if(descriptorLength == 0)
            {
                isDirectory = true;
            }
            
            newestNode = newNode(descriptorOffset, descriptorLength, descriptorName, myWad.level);


            //4 outcomes:
            // 1 - file                     place in vector
            // 2 - start of a directory     start new vector
            // 3 - end of a directory       end vector
            // 4 - E#M#                     start, take 10, end


            //if(descriptorName.find("_START") != -1)
            //if(descriptorName.find("_END") != -1)
            //if(descriptorName.find("E#M#") != -1)
            //do later, change the names


            
            


                

            





        }





        return myWad;

    }

    public string getMagic()
    {
        
    }

    public bool isContent(const string &path)
    {
        
    }

    public bool isDirectory(const string &path)
    {
        
    }

    public int getSize(const string &path)
    {
        
    }

    public int getContents(const string &path, char * buffer, int length, int offset = 0)
    {
        
    }

    public int getDirectory(const string &path, vector<string> *directory)
    {
        //concatonate backslash
        //sike....maybe
    }


}