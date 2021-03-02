import java.util.ArrayList;

public class Heap
{

    private ArrayList<HuffTree> list;

    public Heap()
    {

        this.list = new ArrayList<HuffTree>();
    }

    public Heap(ArrayList<HuffTree> items)
    {

        this.list = items;
        buildHeap();
    }

    public void insert(HuffTree item)
    {

        list.add(item);
        int i = list.size() - 1;
        int parent = parent(i);

        while (parent != i && list.get(i).getRoot().getWeight() < list.get(parent).getRoot().getWeight())
        {

            swap(i, parent);
            i = parent;
            parent = parent(i);
        }
    }

    public void buildHeap()
    {

        for (int i = list.size() / 2; i >= 0; i--)
        {
            minHeapify(i);
        }
    }

    public HuffTree removeMin()
    {

        if (list.size() == 0)
        {

            throw new IllegalStateException("MinHeap is EMPTY");
        } else if (list.size() == 1)
        {

            HuffTree min = list.remove(0);
            return min;
        }

        // remove the last item ,and set it as new root
        HuffTree min = list.get(0);
        HuffTree lastItem = list.remove(list.size() - 1);
        list.set(0, lastItem);

        // bubble-down until heap property is maintained
        minHeapify(0);

        // return min key
        return min;
    }

    private void minHeapify(int i)
    {

        int left = left(i);
        int right = right(i);
        int smallest = -1;

        // find the smallest key between current node and its children.
        if (left <= list.size() - 1 && list.get(left).getRoot().getWeight() < list.get(i).getRoot().getWeight())
        {
            smallest = left;
        }
        else
        {
            smallest = i;
        }

        if (right <= list.size() - 1 && list.get(right).getRoot().getWeight() < list.get(smallest).getRoot().getWeight())
        {
            smallest = right;
        }

        // if the smallest key is not the current key then bubble-down it.
        if (smallest != i)
        {
            swap(i, smallest);
            minHeapify(smallest);
        }
    }
    
    
    

    public HuffTree getMin()
    {
        return list.get(0);
    }
    
    
    
    public ArrayList<HuffTree> getList()
    {
    	return list;
    }

    
    
    public boolean isEmpty()
    {
        return list.size() == 0;
    }

    
    
    private int right(int i)
    {
        return 2 * i + 2;
    }

    
    
    private int left(int i)
    {
        return 2 * i + 1;
    }

    
    
    private int parent(int i)
    {
        if (i % 2 == 1)
        {
            return i / 2;
        }

        return (i - 1) / 2;
    }

    
    
    
    private void swap(int i, int parent)
    {
        HuffTree temp = list.get(parent);
        list.set(parent, list.get(i));
        list.set(i, temp);
    }
    
    
    
    
    public void displayHeap()
    {
        System.out.print("\nHeap array: ");    
        for(int i = 0; i <= list.size() - 1; i++)
        {
        	System.out.print(list.get(i).getRoot().getWeight() +" ");
        }
        System.out.println("\n");
    } 

}














































/* java.util.Scanner;


public class Heap
{
	
	private int[] heapArray;// size of array
    private int maxSize;  // number of nodes in array
    private int heapSize; 
 
    
    public Heap(int max) // Constructor
    {
        maxSize = max;
        heapSize = 0;
        heapArray = new int[maxSize]; 
    }
    
    public boolean isEmpty() // Check if heap is empty
    {
        return heapSize == 0;
    }
    
    
    
    
    
    public boolean insert(int element) // Function to insert element
    {
        if (heapSize + 1 == maxSize)
        {
        	return false;
        }
            
        heapArray[++heapSize] = element;
        int position = heapSize;
        while (position != 1 && element > heapArray[position/2])
        {
            heapArray[position] = heapArray[position/2];
            position /=2;
        }
        heapArray[position] = element;    
        return true;
    } 
 
    
    
    
    
    
    public int remove()/** function to remove element **
    {
        int parent;
        int child;
        int item;
        int temp;
        
        if (isEmpty())
        {
        	throw new RuntimeException("Error : Heap empty!");
        }
            
 
        item = heapArray[1];
        temp = heapArray[heapSize--];
 
        parent = 1;
        child = 2;
        while (child <= heapSize)
        {
            if (child < heapSize && heapArray[child] < heapArray[child + 1])
            {
            	child++;
            }
                
            if (temp >= heapArray[child])
            {
            	break;
            }
                
 
            heapArray[parent] = heapArray[child];
            parent = child;
            child *= 2;
        }
        heapArray[parent] = temp;
 
        return item;
    }

    
    
    
    
    
    public void displayHeap()
    {
        /* Array format *
        System.out.print("\nHeap array: ");    
        for(int i = 1; i <= heapSize; i++)
        {
        	System.out.print(heapArray[i] +" ");
        }
        System.out.println("\n");
    }  

    
    
    
    
    
    
    
	 
}
	
	
	
	*/
	


