/*
 * Koby Miller
 * Project 2
 * Sorting Algorithm analysis
 * Using Merge Sort and Selections sort
 */



import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;




public class Project2Sorting
{

	
	/*
	 * So I wrote this to take in a text file, it goes through it once to find out how many lines it has, then goes through
	 * a second time and makes an array of that size. It then asks which method is wanted for sorting the array. When I used
	 * it to find the average times, I changed some things so the process would go faster. I kept it like this to make it 
	 * a little nicer even though it is a little sloppy too, but I figured since we arn't getting graded on the code this would
	 * be fine.
	 */
	
		public static void main(String[] args) throws FileNotFoundException
		{
			Scanner get = new Scanner(System.in);			//for any information needed from the user
		   
			System.out.println("What is the name of the file you would like to sort? (no need for the .txt part)  ");
			String name = get.next();
			
			
			int size = 0;
			Scanner sc = new Scanner(new File(name + ".txt"));			//find the size of the array needed for the txt file
			while(sc.hasNextInt())
			{
				size++;
				sc.nextInt();
			}
			
			Scanner sc2 = new Scanner(new File(name + ".txt"));
			int file[] = new int[size];									//create array that big
			int i = 0;
			for(i = 0; i < size; i++)
			{
				file[i] = sc2.nextInt();								//fill array with each line from file
			}
			sc.close();
			sc2.close();
			
			/*for(int j = 0; j< file.length; j++)						//for testing to make sure array was made properly
			{
				System.out.println(file[j]);
			}*/
			
			
			long start = 0;
			long end = 0;
			
			System.out.println("Which sorting algorithm would you like to use? MergeSort(1) or SelectionSort(2)");
			int choice = get.nextInt();
			if(choice == 1)
			{
				int back = file.length - 1;
				start = System.nanoTime();							//time right before algorithm starts
				mergeSort(file, 0, back);
				end = System.nanoTime();							//time once algorithm is finished
				
				
				/*for(int j = 0; j < file.length; j++)				//used to check if sorts were done correctly
				{
					System.out.println(file[j]);
				}*/
			}
			else if(choice == 2)
			{
				start = System.nanoTime();							//time right before algorithm starts
				selectionSort(file);
				end = System.nanoTime();							//time once algorithm is finished
				
				
				/*for(int j = 0; j < file.length; j++)				//used to check if sorts were done correctly
				{
					System.out.println(file[j]);
				}*/
			}
			else if (choice != 1 && choice != 2)
			{
				System.out.println("Incorrect option");
			}
			
			
			//System.out.println(start + "               " + end);	
			long total = end - start;
			System.out.println(total);								//total time it took to complete algorithm. I copied it to an excel chart
	
		}
	
	
	
	
	
	
	
		public static void mergeSort(int File[], int front, int back)
		{
			int mid = 0;

			if (front < back)
			{
				mid = (front + back) / 2;  							//Find the midpoint in the partition
		      														
		         													//It will keep splitting the partitions in half when done recursively
				mergeSort(File, front, mid);							//Recursively sort left partition
				mergeSort(File, mid + 1, back);						//Recursively sort right partition

		         
				merge(File, front, back, mid);						//Merge both partitions
			}
		    
		}
		
		 
		 
		
		public static void merge(int File[], int front, int back, int mid)
		{
		   
		   
	      int size = back - front + 1;       										//Size of merged partition
	      int mergedNumbers [] = new int[size]; 									//Temporary array for merged numbers
	      int mergePosition = 0;               										//Position to insert merged number
	      int leftPosition = 0;                 									//Position of elements in left partition
	      int rightPosition = 0;                 									//Position of elements in right partition

	      leftPosition = front;                  							   		//Initialize left partition position
	      rightPosition = mid + 1;              									//Initialize right partition position

	      	
	      while (leftPosition <= mid && rightPosition <= back)						//compare elements from each partition and add the smallest one
	      {
	         if (File[leftPosition] < File[rightPosition])							//If left is smallest, add the left then go to the next index on the left partition
	         {
	            mergedNumbers[mergePosition] = File[leftPosition];
	            leftPosition++;
	         } 
	         else																	//Else add the right element, go to the next index on the right partition
	         {
	            mergedNumbers[mergePosition] = File[rightPosition];
	            rightPosition++;
	         }
	         mergePosition++;
	      }
	      																			//Now it is done comparing meaning one of the partitions is at the end/empty.
	      
	      while (leftPosition <= mid)												//If the left still has numbers, add those in order to the end of the merged list
	      {
	         mergedNumbers[mergePosition] = File[leftPosition];
	         leftPosition++;
	         mergePosition++;
	      }

	      
	      while (rightPosition <= back)												//If the right still has numbers, add those in order to the end of the merged list
	      {
	         mergedNumbers[mergePosition] = File[rightPosition];
	         rightPosition++;
	         mergePosition++;
	      }

	      
	      for (mergePosition = 0; mergePosition < size; ++mergePosition)			//Copy merge number back to File
	      {
	         File[front + mergePosition] = mergedNumbers[mergePosition];
	      }
		}


	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	 
	   
	   public static void selectionSort(int File[])
	   {
		   
		   
		  int size = File.length;
	      int smallestPosition = 0;
	      int temp = 0;										//used to swap
	      
	      int i = 0;										//basically keeps track of what index you are at
	      int j = 0;										//used to go through array to find smallest number

	      for (i = 0; i < size; ++i)						//starts at index 0, each iteration goes to next spot
	      {
	    	  
	         smallestPosition = i;							//number that j has to "beat". This is the smallest number so far
	         
	         for (j = i + 1; j < size; ++j)					//traverse rest of the list with j
	         {

	            if (File[j] < File[smallestPosition])		//if j is smaller, remember it, but keep looking for smaller
	            {
	               smallestPosition = j;
	            }
	            
	         }

	         
	         temp = File[i];								//you now switch the smallest number to the index i. if index i is the smallest, nothing changes
	         File[i] = File[smallestPosition];
	         File[smallestPosition] = temp;
	         
	      } 
	   }	
	  
}
