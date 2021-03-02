
/*Pretty basic Node class. Has 2 ints that save the coordinates of the place in the matrix. 1 int to save the data that goes to those
 * coordinates. Then node that is used to point to the next node. and a node used to point to the previous node.
 */


	public class Node
	{		
		private int row;
		private int col;
		private int data;
		public Node next;
		public Node prev;
	
		public Node(int row, int col, int data)
		{
			this.row = row;
			this.col = col;
			this.data = data;
			this.next = null;
			this.prev = null;
	    }
		
		public Node()
		{
			this.row = 0;
			this.col = 0;
			this.data = 0;
			this.next = null;
			this.prev = null;
		}
		
		
		public void setRow(int x)
		{
			row = x;
		}
		
		public int getRow()
		{
			return row;
		}
		
		
		
		public void setCol(int x)
		{
			col = x;
		}
		
		public int getCol()
		{
			return col;
		}
		
		
		
		public void setData(int x)
		{
			data = x;
		}
		
		public int getData()
		{
			return data;
		}
	} 