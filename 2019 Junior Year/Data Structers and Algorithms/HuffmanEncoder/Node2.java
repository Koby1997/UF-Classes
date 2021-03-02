/*
 * Used for HuffTree
 */
public class Node2
{
	public Node2 next;
	public Node2 left;
	public Node2 right;
	private boolean isRoot;
	private boolean leaf;
	private boolean visited;
	private int weight;
	private char element;
	
	
	public Node2()
	{}
	
	
	public Node2(char element, int weight)//leaf node
	{
		this.element = element;
		this.weight = weight;
		this.leaf = true;
		this.visited = false;
	}
	
	public Node2(Node2 left, Node2 right, int weight)//Internal node
	{
		this.left = left;
		this.right = right;
		this.weight = weight;
		this.leaf = false;
		this.visited = false;
	}
	
	
	public void setRoot(boolean b)
	{
		isRoot = b;
	}
	
	public boolean getRoot()
	{
		return isRoot;
	}
	
	public void setLeaf(boolean b)
	{
		leaf = b;
	}
	
	public boolean getLeaf()
	{
		return leaf;
	}
	
	public void setVisited(boolean b)
	{
		visited = b;
	}
	
	public boolean getVisited()
	{
		return visited;
	}
	
	public int getWeight()
	{
		return weight;
	}
	
	public char getElement()
	{
		return element;
	}
	
}
