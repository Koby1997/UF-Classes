
public class HuffTree
{
	
	private Node2 root;  

	  /** Constructors */
	  HuffTree(char element, int weight)//leaf node
	    {
		  root = new Node2(element, weight);
		}
	  
	  HuffTree(Node2 left, Node2 right, int weight)//internal Node
	    {
		  root = new Node2(left, right, weight);
		}
	  
	  public Node2 getRoot()
	  {
		  return root;
	  }
}
