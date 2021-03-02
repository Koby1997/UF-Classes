/*
 * This Node class is used for the list and codes
 */
public class Node
{
	private char letter;
	private int freq;
	public Node next;
	public Node prev;
	boolean ordered;
	
	private String code;
	
	public Node()
	{
		this.next = null;
		this.prev = null;
		this.ordered = false;
	}
	
	public Node(char letter)
	{
		this.letter = letter;
		this.next = null;
		this.prev = null;
		this.ordered = false;
		freq = 1;		//if node needs to be made, the symbol has occurred at least once
	}
	
	public Node(char letter, String code)
	{
		this.letter = letter;
		this.code = code;
	}
	
	public void setLetter(char l)
	{
		letter = l;
	}
	
	public char getLetter()
	{
		return letter;
	}
	
	public void freqIncrement()
	{
		freq++;
	}
	
	public void setFreq(int f)
	{
		freq = f;
	}
	
	public int getFreq()
	{
		return freq;
	}
	
	public void setOrdered(boolean x)
	{
		ordered = x;
	}
	
	public boolean getOrdered()
	{
		return ordered;
	}
	
	public void setCode(String c)
	{
		code = c;
	}
	
	public String getCode()
	{
		return code;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
