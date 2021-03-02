/*
 * Koby Miller
 * SparseMatrix
 * Create/Manipulate a matrix and find it's determinant 
 * Honestly not the best at Computational Complexity, but it is after the name of each method.
 */

import java.util.LinkedList;


public class SparseMatrix implements SparseInterface 
{
	public LinkedList<Node> main;
	public Node head = new Node();
	public Node tail = new Node();
	public int size = 4;				//Default size
	
	public SparseMatrix()								//Computational Complexity: O(n^2)     for loop in a for loop
	{
		for(int i = 0; i < getSize() + 1; i++)			//This is the way I print the default matrix.
		{
			for (int j = 0; j < getSize() + 1; j++)
			{
				System.out.print((getElement(i,j)) + " ");
			}
			System.out.print("\n");
		}					//This will print the default 5x5 matrix every time you make one
	}
	
	public SparseMatrix(int size)		//Computational Complexity: O(1)
	{									//Didn't print the matrix after this because it would print a new matrix every time the minor method is called
		this.size = size;
	}
	
	
	
	
	
	
	public void clear()						//Computational Complexity: O(n)     while loop
	{
		Node temp = new Node();				//create temp node to find node at coordinates given
		temp = head;
		while (temp.next != null)
		{
			temp.next = temp.next.next;
		}		
	}

	
	
	
	
	public void setSize(int size)			//Computational Complexity: O(1)
	{
		clear();							//project unclear whether or not if you set the size on a matrix already made if the new
		this.size = size;					//matrix should be all 0's..... Test cases did this so I did
		
	}

	public int getSize()					//Computational Complexity: O(1)
	{
		return size;
	}
	
	
	
	
	
	
	
	public void addElement(int row, int col, int data)	//Computational Complexity: O(n)     while loop
	{
		if(row > getSize() || col > getSize())
		{
			System.out.println("ERROR: That element is out of bounds. Terminating program");
			System.exit(0);
		}
		if(data == 0)									//if the data is 0 we don't want to add this element to the list
		{
			return;
		}
		
		Node n = new Node(row,col,data);				//a node will be made with the coordinates and data given;
		if(head.next == null)							//if the list is empty, the new node will be added to the front
		{
			head.next = n;
			n.prev = head;
			tail.next = n;
			return;
		}
		else											//if not, it is added to the end
		{
			Node temp = new Node();						//create temp node to find node at coordinates given
			temp.next = head.next;
			while (temp.next != null)
			{											//this while checks the list to see if an Item is already associated with that coordinate
				if(temp.next.getRow() != row || temp.next.getCol() != col)
				{
					temp.next = temp.next.next;
					continue;
				}
				System.out.println("ERROR: Invalid. An element is already at this coordinate. Terminating program.");
				System.exit(0);
			}
			tail.next.next = n;
			n.prev = tail.next;
			tail.next = n;	
		}	
	}

	
	
	
	
	
	
	public void removeElement(int row, int col)							//Computational Complexity: O(n)     while loop
	{
		if(row > getSize() || col > getSize())
		{
			System.out.println("ERROR: That element is out of bounds. Terminating program.");
			System.exit(0);
		}
		Node temp = new Node();											//make a temp node to find the node with the coordinates given
		temp.next = head.next;
		temp.prev = head.next;
		while (temp.next != null)
		{
			if(temp.next.getRow() != row || temp.next.getCol() != col)		//if it is not the node we are looking for
			{																//move to next node. keep track of previous
				temp.prev = temp.next;
				temp.next = temp.next.next;
				continue;
			}
			//if here, node is found, now handle specific cases
			
			if(temp.next == head.next)				//if the element is the head
			{
				head.next = head.next.next;	
				temp.next.prev = null;
				
			}
			else if(temp.next == tail.next)			//if the element being removed is the tail
			{
				temp.prev.next = null;
				tail.next = temp.prev;
				return;
			}
			else									//if the element is is in the middle of the list
			{
				temp.next = temp.next.next;
				temp.next.prev = temp.prev;
				temp.prev = temp.next;
				return;
			}
			
		}
		if(temp.next == null)
		{
			System.out.println("ERROR: The element is not in the matrix. Terminating program.");
			System.exit(0);
		}
	}

	
	
	
	
	public int getElement(int row, int col)					//Computational Complexity: O(n)     while loop
	{
		if(row > getSize() || col > getSize())
		{
			System.out.println("ERROR: That element is out of bounds. Terminating program.");
			System.exit(0);
		}
		Node temp = new Node();								//create temp node to find node at coordinates given
		temp.next = head.next;
		while (temp.next != null)
		{
			if(temp.next.getRow() != row || temp.next.getCol() != col)
			{
				temp.next = temp.next.next;
				continue;
			}
			return temp.next.getData();						//if there is a node at those coordinates, return the data of that node
		}
		return 0;											//if it doesn't find it and it beats the first if statement, data = 0
	}

	
	
	
	
	public int determinant()					//Computational Complexity: O(n^(n+1))  I think? I am not exactly sure
	{											//I didn't use the algorithm given to us exactly, that one wanted us to move down the rows,
												//mine moves across the columns. Just easier for me to visualize because thats how I would do it on paper
		int sign = 1;
		int answer = 0;
		
		if(getSize() == 0)						//base case = if there is only one element
			return getElement(0,0);				//return that one element
		
		for(int j = 0; j <= getSize(); j++)
		{
			if(j % 2 != 0)
			{
				sign = -1;
			}		
			else								//NEEDS THIS ELSE! couldn't find what was wrong with this algorithm for like and hour haha
			{									//didn't realize that because I initialize answer outside, sign can end up staying negative.
				sign = 1;
			}
			answer = answer + (sign * getElement(0,j) * minor(0,j).determinant());
		}
		return answer;
	}

	
	
	
	
	public SparseInterface minor(int row, int col)													//Computational Complexity: O(n)     while loop
	{
		if(row > getSize() || col > getSize())
		{
			System.out.println("ERROR: Row or Column out of bounds. Cannot make minor from these inputs. Terminating program.");
			System.exit(0);
		}
		
		SparseMatrix minor = new SparseMatrix(getSize() - 1);		
		Node temp = new Node();
		temp.next = head.next;
		while (temp.next != null)
		{
			if(temp.next.getRow() == row || temp.next.getCol() == col)								//if the node in the list has the same row or column than we don't want to add it to the new list
			{
				temp.next = temp.next.next;
				continue;
			}	

			if(temp.next.getRow() < row && temp.next.getCol() < col)								//if the row and column value are under the row and column we are taking out than in the new matrix there coordinates will be the same
			{
				minor.addElement(temp.next.getRow(), temp.next.getCol(), temp.next.getData());
				temp.next = temp.next.next;
				continue;
			}

			if(temp.next.getRow() > row && temp.next.getCol() > col)								//if in the original matrix, the row and column values were greater than the row and column we are getting rid of, then in the new matrix, both coordinates need to go down one
			{
				minor.addElement(temp.next.getRow() - 1, temp.next.getCol() - 1, temp.next.getData());
				temp.next = temp.next.next;
				continue;
			}

			if(temp.next.getRow() > row )
			{
				minor.addElement(temp.next.getRow() - 1, temp.next.getCol(), temp.next.getData());	//if the node has a row that is valued greater than the one we are taking out, its new coordinate for the row will be one less.
				temp.next = temp.next.next;
				continue;
			}

			if(temp.next.getCol() > col )
			{
				minor.addElement(temp.next.getRow() , temp.next.getCol() - 1, temp.next.getData());	//if the node has a column that is valued greater than the one we are taking out, its new coordinate for the column will be one less.
				temp.next = temp.next.next;
				continue;
			}		
		}
		return minor;
	}


	public String toString()					//Computational Complexity: O(n^2)     for loop in a for loop
	{											//Basically goes through the matrix in order, once it finds a spot with data it will
		String line = "";						//save the coordinates and the data to a string
		
		for(int i = 0; i < getSize() + 1; i++)
		{
			for (int j = 0; j < getSize() + 1; j++)
			{
				if(getElement(i,j) != 0)
				{
					line = line + ( i + " " + j + " " + getElement(i,j) + "\n");  
				}
			}
		}
		return line;
	}

	
	
	
	
	
	/*
	 *Made for my own convenience while checking my code
	 *Goes through matrix by coordinates. It will start with (0,0) and use the getElement method to retrieve the data at that coordinate.
	 * It will then check the next column of the same row and repeat. Once the column is greater than the size of the matrix, it will 
	 * then begin to check the next row and reset the column to 0.
	 * 
	 * ended up needing it for default matrix in the beginning. Main can't call it though because it is
	 * not apart of the SparseInterface
	 */
	
	public void printMatrix()			//Computational Complexity: O(n^2)     for loop in a for loop
	{
		for(int i = 0; i < getSize() + 1; i++)
		{
			for (int j = 0; j < getSize() + 1; j++)
			{
				System.out.print((getElement(i,j)) + " ");
			}
			System.out.print("\n");
		}
	}
	
	
	
	
	
	
	public int listSize()					//Computational Complexity: O(n)     while loop
	{										//made for convenience while checking program
		int x = 0;
	
		Node temp = new Node();				//create temp node to find node at coordinates given
		temp.next = head.next;
		while (temp.next != null)
		{
				temp.next = temp.next.next;
				x++;
		}
		return x;
	}
	
	
	

	
	
	
	/*
	 
	  Didn't know you had to make it print in a specific order going through one row and then the next
	  and so on. This prints it out in the order of my list, which wont necessarily be in 
	  reading order of the matrix (left to right, top to bottom)
	  Just saving for future use. I re-wrote the algorithm and basically used my printMatrix method.
	 
	public String toString()				
	{
		Node temp = new Node();				//new node to traverse list
		temp = head;
		String x = "";
		String line;
		while (temp.next != null)			//if it is in the list, the data is not 0, so give the location and the data
		{
			line = (temp.next.getRow() + " " +temp.next.getCol() + " " + (temp.next.getData()) + "\n");
			x = x + line;
			temp.next = temp.next.next;
		}
		return x;
	}
	*/
	

	
	/*
	 * NOTE: I wrote this method because with the way I planned on doing the program, I was expecting
	 * to be told how we are given the matrix. I wrote my with the intention that it didn't matter
	 * the size of the matrix. With that, I made this method to find the size, that also meant that
	 * I didn't need the setSize() method. I found out I won't receive full credit unless I use that
	 * method, so I am rewriting this method, but I wanted to keep it here for future use for when I mess
	 * with this project later after it is turned in.

	 * 
	 * 
	 * Because it is a square, the highest value row/column is the size. so say there is only one element that has a row 4 and the rest are less than or equal to 3,
	 * that matrix can have 0's in the whole 5th row/column except for where that one node is. visual example:
	 * 1 3 2 5 0
	 * 8 3 5 1 0			In this case, the node in row 4/col 2 shows that the square is a 5x5. if that 2 was gone, the matrix would be a 4x4. 
	 * 3 6 4 4 0			So the highest valued row/column shows the total size of the matrix
	 * 3 6 2 6 0
	 * 0 0 2 0 0
	 
	
	public int getSize()				
	{									
		if(head.next == null)					//if the list is empty, the size is 0
			return 0;
		
		int x = 0;
		Node temp = new Node();					//Node traverses the list
		temp.next = head;
		while (temp.next != null)
		{
			if(x < temp.next.getRow())			//x will keep track of the highest row or column that it comes by
				x = temp.next.getRow();
			
			if(x <temp.next.getCol())
				x = temp.next.getCol();
			
			temp.next = temp.next.next;
		}
		setSize(x);
		return x;								
	}
	*/
}





