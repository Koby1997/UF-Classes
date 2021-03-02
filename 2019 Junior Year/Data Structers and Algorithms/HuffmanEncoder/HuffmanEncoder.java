import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class HuffmanEncoder implements HuffmanCoding
{
	public static Node head = new Node();
	public static Node tail = new Node();
	//public static Node head2 = new Node();     //would be used if I used ascii method
	//public static Node tail2 = new Node();
	
	public static Node convertedList = new Node();
	private HuffTree HT;
	private Heap HuffmanHeap;
	
	
	public HuffmanEncoder(){}//Constructor
		
	
	public void setHuffTree(HuffTree tree)
	{
		HT = tree;
	}
	
	public HuffTree getHuffTree()
	{
		return HT;
	}
	
	public void setHeap(Heap heap)
	{
		HuffmanHeap = heap;
	}
	
	public Heap getHeap()
	{
		return HuffmanHeap;
	}
	
	
	
	
	/*
	 * Takes a char and adds it to the end of the HuffmanProject list. If already on the list,
	 * increment it's frequency.
	 */
	
	public void fileToList(char letter)
	{
		Node n = new Node(letter);				//a node will be made with the letter given
		if(head.next == null)							//if the list is empty, the new node will be added to the front
		{
			head.next = n;
			n.prev = head;
			tail.next = n;
			return;
		}
		else											//if not, it checks the list
		{
			Node temp = new Node();						//create temp node to search for letter in the list
			temp.next = head.next;
			while (temp.next != null)
			{											//this while checks the list to see if that item is already in the list
				if(temp.next.getLetter() != letter)
				{
					temp.next = temp.next.next;			
					continue;
				}
				temp.next.freqIncrement();				//if found in list, increment frequency by one																								//I wrote another bit of vode above that handles the situation, so it never reaches here.
				return;
			}
			tail.next.next = n;							//if not found, add new node to the end
			n.prev = tail.next;
			tail.next = n;	
		}		
	}
	
	
	
	
	
	
	
	
	
	
	
	/* coded, didn't realize I didn't need to use it until I went to turn in project...
	 * Used by TraverseTree. 
	 
	public void treeToList(Node n)
	{
		
		if(head.next == null)							//if the list is empty, the new node will be added to the front
		{
			head.next = n;
			n.prev = head;
			tail.next = n;
			return;
		}
		else											//if not empty, it checks the list
		{
			Node temp = new Node();						//create temp node to search for letter in the list
			temp.next = head.next;
			while (temp.next != null)
			{
				if(temp.next.getLetter() != n.getLetter())//if it doesn't go through this if, it has been found
				{
					temp.prev = temp.next;
					temp.next = temp.next.next;			
					continue;
				}
				System.out.println("ERROR: Symbol already in list. Terminating program");
				System.exit(0);
			}
			tail.next.next = n;							//if not found, add new node to the end
			n.prev = tail.next;
			tail.next = n;	
		}		
	}*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * prints the values in the list and their frequencies
	 * used to help while writing
	 */
	public void printList()
	{
		Node temp = new Node();						//create temp node to search for letter in the list
		temp.next = head.next;
		while (temp.next != null)
		{
			System.out.println("Symbol:  " + temp.next.getLetter() + "    Freq:   " + temp.next.getFreq());																							//I wrote another bit of vode above that handles the situation, so it never reaches here.
			temp.next = temp.next.next;
		}
		return;
	}
	
	
	/*
	 * prints each character and its 0/1 code from Huffman tree
	 * used to help while writing
	 */
	public void stringCodes()
	{
		String codes = "";
		Node temp = new Node();						//create temp node to search for letter in the list
		temp.next = head.next;
		while (temp.next != null)
		{
			codes += temp.next.getLetter() + " " + temp.next.getCode() + "\n";																							//I wrote another bit of vode above that handles the situation, so it never reaches here.
			temp.next = temp.next.next;
		}
		return;
	}

	
	
	
	/*
	 * This takes the HuffmanProject list and creates an ordered Heap out of the frequencies it.
	 */
	public Heap orderListFreq()
	{
		int size = 0;
		Node checkSize = new Node();		//finds size of list needed for heap
		checkSize.next = head.next;
		while (checkSize.next != null)
		{
			size++;
			checkSize.next = checkSize.next.next;
		}
		
		
		
		Heap listToHeap = new Heap();
		
		while(size > 0)
		{
			Node temp = new Node();						//create temp node to search for letter in the list
			Node lowest = new Node();
			temp.next = head.next;
			
			while(temp.next.getOrdered() == true)		//if it has been ordered already, go to next one
			{
				temp.next = temp.next.next;
				if(temp.next == null)					//if null, it has reached the end of the list
				{
					return listToHeap;
				}
				
			}
			
			lowest.next = temp.next;
			
			while (temp.next != null)
			{											
				if(lowest.next.getFreq() > temp.next.getFreq() && temp.next.getOrdered() == false)
				{
					lowest.next = temp.next;		//finds lowest unordered value
				}
				temp.next = temp.next.next;
			}
			
			HuffTree answer = new HuffTree(lowest.next.getLetter(), lowest.next.getFreq());
			lowest.next.setOrdered(true);				//it has been ordered
			listToHeap.insert(answer);
			size--;
		}
		//listToHeap.displayHeap();    used for testing, displays heap
		setHeap(listToHeap);		
		return listToHeap;
	}
	
	
	
	

	
	
	
	
	/*
	 * Finds the frequencies of the symbols in a file given to it. First it checks that it can read the file.\
	 * It will then read the txt file char by char. Then it will use fileToList to create a list of all of
	 * the symbols/frequencies. Then it orders the list based off of the ascii chart. then prints the list.
	 */
	public String getFrequencies(File inputFile) throws FileNotFoundException
	{
	    if (!inputFile.exists())
	    {
	      System.out.println(inputFile.getName() + " does not exist. Exiting program");
	      System.exit(0);
	    }
	    if (!(inputFile.isFile() && inputFile.canRead()))
	    {
	      System.out.println(inputFile.getName() + " cannot be read from.");
	      return null;
	    }
	    try 
	    {
	      FileInputStream fis = new FileInputStream(inputFile);
	      char current;
	      while (fis.available() > 0)
	      {
	        current = (char) fis.read();
	        fileToList(current); 		//each char is stored in the list
	      }
	    }
	    catch (IOException e)
	    {
	      System.out.println("ERROR: TERMINATING PROGRAM");
	      System.exit(0);
	    }
	    
	    orderListFreq();//puts list into heap and saves that heap for the huffmanProject

	    
	    
	    String answer = "";
	    
	    for(int i = 32; i < 126; i++)
	    {
	    	Node temp = new Node();
	    	temp.next = head.next;
	    	while(temp.next != null)
	    	{
	    		int x = temp.next.getLetter();
	    		if(x == i)
	    		{
	    			answer += temp.next.getLetter() + " " + temp.next.getFreq() + "\n";
	    			break;
	    		}
	    		temp.next = temp.next.next;
	    	}
	    }  
		return answer; 
	}
	
	
	
	
	
	
	
	

	/*
	 *As name says, this builds the tree. Takes 2 smallest values from heap and makes a tree.
	 *Puts that tree back into the heap and repeats until the heap only has one value.
	 */
	public HuffTree buildTree(File inputFile) throws FileNotFoundException,Exception
	{
		
		setHuffTree(null);
		getFrequencies(inputFile);

		HuffTree temp1 = null;
		HuffTree temp2 = null;
		HuffTree temp3 = null;
		while (getHeap().getList().size() > 1)// While two items left
		{
		   temp1 = getHeap().removeMin();
		   temp2 = getHeap().removeMin();
		   temp3 = new HuffTree(temp1.getRoot(), temp2.getRoot(), temp1.getRoot().getWeight() + temp2.getRoot().getWeight());
		   getHeap().insert(temp3);   // Return new tree to heap
		}
		return temp3;            // Return the tree	
	}
	
	
	
	
	
	
	
	
	
	/*
	 * takes a file and a HuffTree and encodes the file.
	 * outputs a string of 1's and 0's representing the file
	 */
	public String encodeFile(File inputFile, HuffTree huffTree) throws FileNotFoundException
	{
		traverseTree(huffTree);//need to traverse in order to get codes
		setHuffTree(huffTree);//check this, before it was traverseTree(huffTree)
		String answer = "";
		
		if (!inputFile.exists())
	    {
	      System.out.println(inputFile.getName() + " does not exist. Exiting program");
	      System.exit(0);
	    }
	    if (!(inputFile.isFile() && inputFile.canRead()))
	    {
	      System.out.println(inputFile.getName() + " cannot be read from. Terminating program.");
	      System.exit(0);
	    }
	    try 
	    {
		      FileInputStream fis = new FileInputStream(inputFile);
		      char current;
		      int checker = 0;	//just checks that the file has more than one element
		      while(fis.available() > 0)
		      {
		    	  	checker++;
			        current = (char) fis.read();
			        Node temp = new Node();
			        temp.next = head.next;
			        while(temp.next.getLetter() != current)
					{
						temp.next = temp.next.next;
						if(temp.next == null)
						{
							System.out.println("Cannot use Symbol. Not in HuffmanTree. Terminating program.");
							System.exit(0);
						}
					}
					answer += temp.next.getCode();
		      }
		      if(checker == 0)
		      {
		    	  System.out.println("ERROR: File is empty. Terminating program.");
		    	  System.exit(0);
		      }
		      if(checker == 1)//only one element so code is 0
		      {
		    	  System.out.println("ERROR: List is too small. Terminating program.");
		    	  System.exit(0);
		    	  //answer = "0"; 		//didn't know how you wanted me to deal with this
		      }
	    }
	    catch (IOException e)
	    {
	      System.out.println("ERROR: TERMINATING PROGRAM");
	      System.exit(0);
	    }	    
	    return answer;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * take a String and HuffTree and output the decoded words
	 */
	public String decodeFile(String code, HuffTree huffTree) throws Exception
	{
		setHuffTree(huffTree);
		String answer = "";
		
		String[] codeArray = code.split("");	//make string and array of strings
		Node2 trav = new Node2();
		trav.next = huffTree.getRoot();			//make node to traverse tree
		int i = 0;
		for(i = 0; i < code.length(); i++)
		{
			if(codeArray[i].equals("0"))		//if next char is 0, go left on the tree
			{
				trav.next = trav.next.left;
				if(trav.next.getLeaf() == true)	//if it is now at a leaf, add the leafs element to the output string. restart from root of tree.
				{
					answer += trav.next.getElement();
					trav.next = huffTree.getRoot();
					continue;
				}
			}
			else if(codeArray[i].equals("1"))	//if next char is 1, go right on the tree
			{
				trav.next = trav.next.right;
				if(trav.next.getLeaf() == true) //if it is now at a leaf, add the leafs element to the output string. restart from root of tree
				{
					answer += trav.next.getElement();
					trav.next = huffTree.getRoot();
					continue;
				}
			}
			else if(codeArray[i].equals("0") && codeArray[i].equals("1"))
			{
				System.out.println("Error: Element is not 0 or 1. Terminating program.");
				System.exit(0);
			}
		}
		if(i == 0)
		{
			System.out.println("ERROR: List is too small. Terminating program.");
			System.exit(0);
			//answer = Character.toString(head.next.getLetter());	 //didn't know how you want me to handle this situation...
		}
		if(trav.next != huffTree.getRoot() && trav.next.getLeaf() == false)
		{
			System.out.println("ERROR: Invalid code. Last couple of 0's/1's don't finish translating. Terminating program.");
			System.exit(0);;
		}
		return answer;
	}

	
	
	
	
	/*
	 * see traverseTree.
	 */
	public String traverseHuffmanTree(HuffTree huffTree) throws Exception
	{
		traverseTree(huffTree);
		
				return null;
	}
	/*
	 * Traverses tree as the name states. I made this a separate method from the traverseHuffmanTree
	 * because I could use the traversal in other methods.
	 */
	void traverseTree(HuffTree huffTree)
	{
		setHuffTree(huffTree);
		if(getHuffTree().getRoot().left == null && getHuffTree().getRoot().right == null)
		{
			System.out.println("ERROR: There is only one item in this list. Terminating program");
			System.exit(0);
		}
		Node2 trav = new Node2();		//new Node that traverses the nodes in the tree
		
		while(getHuffTree().getRoot().getVisited() != true)//go until the root has been visited
		{
			trav.next = getHuffTree().getRoot();
			String code = "";
			boolean skip = false;
			
			while(trav.next.getLeaf() != true)//traverse until you reach a leaf
			{
				
				if(trav.next.left.getVisited() != true)
				{
					code += "0";
					trav.next = trav.next.left;
					continue;					
				}
				if(trav.next.right.getVisited() != true)
				{
					code += "1";
					trav.next = trav.next.right;
					continue;
				}
				skip = true;//both of the next nodes have been visited, so break and set current node as visited
				break;
			}
			
			if(skip == true)
			{
				trav.next.setVisited(true);
				continue;
			}
			trav.next.setVisited(true);
			
			
			/*
			 * now update code value in same list
			 */
			Node temp = new Node();
			temp.next = head.next;
			while(temp.next != null)
			{
				if(temp.next.getLetter() == trav.next.getElement())
				{
					temp.next.setCode(code);
					break;
				}
				temp.next = temp.next.next;
			}
			if(temp.next == null)
			{
				System.out.println("UNKNOWN ERROR: Terminating program.");
				System.exit(0);
			}
		}
		//printCodes(); used to help test code	
	}	
}









/*
 * This isn't used in the project but wanted to keep to work on for practice later.
 * It is supposed to put the list in ascii order but I couldn't get it to work.
 * I know its more complicated than the way I ended up printing the list, but this way
 * I don't just traverse the list and find what I need. I wanted to actually re-arrange
 * the list and then print it in order.
 */
/*
public void asciiList()
{
	printList();
	//printCodes();
	
	
    head2.next = head.next;
    tail2.next = tail.next;
    head.next = null;
    tail.next = null;
    while(head2.next != null)
    {										System.out.println("1");
    	Node temp = new Node();
    	Node lowest = new Node();
    	
    	temp.next = head2.next;
    	lowest.next = head2.next;
    	while(temp.next != null)
    	{									System.out.println("2");
    		int l = lowest.next.getLetter();
    		int t = temp.next.getLetter();
    		System.out.println("l = " + l + "   t = " + t);
    		if(l > t)
    		{System.out.println("I honestly don't know what is messing up:   ");
    		//System.out.println(lowest.prev.getLetter());
    		System.out.println(lowest.next.getLetter());
    			lowest.prev = temp.prev;
    			lowest.next = temp.next;
    			System.out.println(lowest.prev.getLetter());
	    		System.out.println(lowest.next.getLetter());
    		}
    		temp.prev = temp.next;
    		temp.next = temp.next.next;
    	}
    	System.out.println("1) head2.next = " + head2.next); 
    	Node pickMe = lowest.next;					//copy node, to put back in original list
    												//now delete identical node from list you are traversing through
    	System.out.println("This is the letter I am taking out:  " + pickMe.getLetter());
    	
    	
    	
    	if(lowest.next == head2.next)				//if the element is the head
		{System.out.println("2) head2.next = " + head2.next);
			head2.next = head2.next.next;	
			lowest.next.prev = null;
			
		}
		else if(lowest.next == tail2.next)			//if the element being removed is the tail
		{System.out.println("3) head2.next = " + head2.next);
			lowest.prev.next = null;
			tail2.next = lowest.prev;
		}
		else if (lowest.next != head2.next && lowest.next != tail2.next)									//if the element is is in the middle of the list
		{	
			System.out.println("4) head2.next = " + head2.next);
			
			System.out.println("lowest.next.getLetter = " + lowest.next.getLetter());
			System.out.println("lowest.next.next.getLetter = " + lowest.next.next.getLetter());
			System.out.println("lowest.prev.getLetter = " + lowest.prev.getLetter());
			
			
			
			lowest.next = lowest.next.next;
			lowest.next.prev = lowest.prev;
			lowest.prev.next = lowest.next;
		}
    	
    	System.out.println("---------------    " );
    	printList();
    	System.out.println("this is going to the new list: " + pickMe.getLetter());
    	treeToList(pickMe);
    	
		/*if(head.next == null)							//if the list is empty, the new node will be added to the front
		{System.out.println("5) head2.next = " + head2.next);
			head.next = pickMe;
			pickMe.prev = null;
		}
		else											//if not, it traverses the list
		{System.out.println("6) head2.next = " + head2.next);
			Node temp2 = new Node();
			temp2.next = head.next;
			while (temp2.next != null)
			{				
				temp2.next = temp2.next.next;			
			}
			temp2.next = pickMe;
			pickMe.next = null;
			System.out.println("7) head2.next = " + head2.next);
		}
		
		
		
		
		System.out.println("8) head2.next = " + head2.next);
    }
	System.out.println("I want these");
	//printList();
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	
}*/
