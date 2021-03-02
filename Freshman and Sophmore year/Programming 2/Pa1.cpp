/*
Name: Koby Miller
UF ID: 51714009
Project 1
Short description: This program creates 4 magic squares with a sized that is input by the user.
                    It does this by creating the first square using the Siamese method.
                    Then it rotates the first square to create 4 other unique squares.
                    It then adds up the rows, columns and diagonals.
*/




#include <iostream>


void addition(int array[15][15])         //funtion to add rows and columns
    {
        char nl = '\n';
        int sum = 0;
        int i;
        int j;
        
        std::cout << nl;
        std::cout << "Checking the sums of every row:    ";
        for(i = 0; i<15; i++)           
        {
            for(j = 0; j<15; j++)               //adds rows
            {
                sum += array[i][j];
            }
            if(sum != 0)
            {
                std::cout << sum;
                std::cout << " ";
            }
            sum = 0;
        }
        
        
        std::cout << nl;
        std::cout << "Checking the sums of every column: ";
        for(j = 0; j<15; j++)                  
        {
            for(i = 0; i<15; i++)               //adds columns
            {
                sum += array[i][j];
            }
            if(sum != 0)
            {
                std::cout << sum;
                std::cout << " ";
            }
            sum = 0;
        }
    }

void diagonal(int array[15][15],int n)
{   
    /*Because I am using a 15x15 array at all times, but not always using every spot,
    and I am rotating my original square to find the other magic squares, I cannot
    just take the sum of the diagonals of the square. So I have to find which corner
    contains a number and then find the diagonal from there. Really the diagonals never
    change from the original so I could just use those but I didn't know if I would get
    points taken off so I just made this extra function.
    */
    
    char nl = '\n';
    int i;
    int j;
    int sum = 0;
    int sum_two = 0;
    
    
    
    
    
    if(array[0][0] != 0)       							//if there is a point in the top right,if it hasn't rotated yet, or is a 15x15 square
    {
        for(i = 0; i<n; i++)              					//finds sum of down right diagonal
            sum += array[i][i];
        
        for(i = n - 1, j = 0; i>=0; i--, j++)               			//finds sum of down left diagonal
            sum_two += array[i][j];
    }
    


    else if(array[0][0] == 0 && array[14][0] == 0 && array[14][14] == 0)        //if number in top right, original rotated once
    {
        for(i = 0, j = 14; i<15; i++, j--)
            sum += array[i][j];     						//finds down left diagonal
        
        for(i = n - 1, j = 14; i >= 0; i--, j--)
            sum_two += array[i][j];    						//finds down right diagonal
    }	
    
    
    
    else if(array[0][0] == 0 && array[0][14] == 0 && array[14][0] == 0)		//bottom right, if original rotated twice
    {
        for(i = 0; i<15; i++)							//finds sum of down right diagonal
            sum += array[i][i];
        
        for(i = 15 - n, j = 14; i < 15; i++,j--)				//finds sum of down left
            sum_two +=array[i][j];
    }
    
    
    
    else if(array[0][0] == 0 && array[0][14] == 0 && array[14][14] == 0)        //bottom left, if original rotated three times
    {
        for(i = 14, j = 0; i>0; i--,j++)        				//finds down left
            sum += array[i][j];
            
        for(i = 15 - n, j = 0; i<15; i++,j++)					//finds down right
            sum_two += array[i][j];
    }
    
    
        
        std::cout << nl;
        std::cout << "Checking the sums of every diagonal:  ";
        std::cout << sum;
        std::cout << " ";
        std::cout << sum_two;
        std::cout << nl;
        std::cout << nl;
}



int main()
{
    char nl = '\n';
    int n;      //size of magic square
    int m;      //used for do while loop
    do
    {
        std::cout << "Enter the size of a magic square. The size must be odd and between 3-15:";
        
        
        std::cin >> n;
        
        while(n % 2 == 0 || n<3 || n>15)
        {
            
            std::cout << "That input is invalid. Please try again.";
            std::cin >> n;
            
        }
        
        
        
        int magic[15][15];  //creating 2d arrays
        int magic_two[15][15];
        int magic_three[15][15];
        int magic_four[15][15];
        int i; int j; 
        
        /* For this next part, I wanted to make a funtion that would
            create 4 arrays so I wouldn't just copy and paste, but I
            didn't know you can't have a function return an array.
            So here I make four 15x15 arrays and make all slots 0*/
        
        
        
        
        for(i = 0; i<15; i++)           //square 1
        {
            for(j = 0; j<15; j++)
                magic[i][j] = 0;
        }
        
        
        
    
        
        
        for(i = 0; i<15; i++)          //square 2 
        {
            for(j = 0; j<15; j++)
            magic_two[i][j] = 0;
        }
        
        
        
        
        
        
        for(i = 0; i<15; i++)           //square 3
        {
            for(j = 0; j<15; j++)
            magic_three[i][j] = 0;
    
        }
        
        
    
        
        
        
        for(i = 0; i<15; i++)          //square 4
        {
            for(j = 0; j<15; j++)
            magic_four[i][j] = 0;
    
        }
    
    
    
    
    
    
    
        int x = 0;              					//This is the position where 1 will start
        int y = (((n+1)/2) - 1);
        
        for(int num = 1; num <= n*n; num++)     			//this counts up in order using numbers to fill the square
        {
            if(x == -1)      						//If the next number goes above the highest row, it will switch to the bottom
            x = n - 1;
            
            if(y == n)   						//if the number goes past the last column, it will wrap back to the first column
            y = 0;
            if(magic[x][y] != 0)        				//if the spot has already been filled
            {
                if(y == 0 && x == n - 1)
                {
                    y = n - 1;
                    x = 0;
                }
                else if(y == 0)
                {
                    y = n - 1;      					//goes back to last point if the next point wraped around the right side of the square
                    x++;        
                }
                else
                {
                    x++;
                    y--;
                }
                  x++;         						//goes the spot below the last used
            }
            magic[x][y] = num;      					//sets position to next number
            x--;            
            y++;                    					//moves positions
            
        }
        
        
        
        
        
        
        
        
        int a = 14;          //makes second square by rotating first;
        
        for(i = 0; i<15 ; i++)
        {
            for(j = 0; j<15; j++)
            {
                magic_two[j][i] = magic[a][j];
            }
            a--;
        }
    
        
        
        a = 14;             //makes third square by rotating second;
        
        for(i = 0; i<15 ; i++)
        {
            for(j = 0; j<15; j++)
            {
                magic_three[j][i] = magic_two[a][j];
     
            }
            a--;
        }
        
        
        
        a = 14;             //makes fourth square by rotating third;
        
        for(i = 0; i<15 ; i++)
        {
            for(j = 0; j<15; j++)
            {
                magic_four[j][i] = magic_three[a][j];
     
            }
            a--;
        }
        
        
        
        
        
        bool line = false;      /*This will help with printing lines, I don't want it to print
                                  a ton of blank lines if the square is small and doesn't use the 
                                  whole 15x15 array.
				*/        
        
        std::cout << "Magic Square #1 is:";
        std:: cout << nl;
            
        for(i = 0; i<15; i++)           //Printing out the first square
        {
            for(j = 0; j<15; j++)
            {
                if(magic[i][j] != 0)
                {
                std::cout << magic[i][j];
                std::cout << " ";
                line = true;
                }
            }
            if (line == true)
            std::cout << nl;
            
            line = false;
        }
        
    
        std::cout << nl;
        addition(magic);
        diagonal(magic,n);
        std::cout << nl;
        
        
        
        
        
        
        
        std::cout << "Magic Square #2 is:";
         
        std:: cout << nl;
            
        for(i = 0; i<15; i++)           //Printing out the second square
        {
            for(j = 0; j<15; j++)
            {
                if(magic_two[i][j] != 0)
                {
                std::cout << magic_two[i][j];
                std::cout << " ";
                line = true;
                }
            }
            if (line == true)
            std::cout << nl;
            
            line = false;
        }
        
    
        std::cout << nl;
        addition(magic_two);
        diagonal(magic_two,n);
        std::cout << nl;
        
        
        
        
        
        
        
        
        
        
        std::cout << "Magic Square #3 is:";
        std:: cout << nl;
            
        for(i = 0; i<15; i++)           //Printing out the third square
        {
            for(j = 0; j<15; j++)
            {
                if(magic_three[i][j] != 0)
                {
                std::cout << magic_three[i][j];
                std::cout << " ";
                line = true;
                }
            }
            if (line == true)
            std::cout << nl;
            
            line = false;
        }
        
    
        std::cout << nl;
        addition(magic_three);
        diagonal(magic_three,n);
        std::cout << nl;
        
        
        
        
        
        
        std::cout << "Magic Square #4 is:";
        std:: cout << nl;
            
        for(i = 0; i<15; i++)           //Printing out the fourth square
        {
            for(j = 0; j<15; j++)
            {
                if(magic_four[i][j] != 0)
                {
                std::cout << magic_four[i][j];
                std::cout << " ";
                line = true;
                }
            }
            if (line == true)
            std::cout << nl;
            
            line = false;
        }
        
    
        std::cout << nl;
        addition(magic_four);
        diagonal(magic_four,n);
        std::cout << nl;
        
        
        std::cout << "If you want to try again, enter 1. If you want to exit, enter any other number";
        std::cin >> m;
    }while(m == 1);
}
