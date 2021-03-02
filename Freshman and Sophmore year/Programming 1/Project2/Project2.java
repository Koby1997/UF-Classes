/*
 * Name: Koby Miller
 * UFL ID: 5171-4009
 * Section: 0394
 * Project Number: 2 regrade
 * 
 * This program can tell you various details about shapes
 * 
 * 
 * Number of changes: 1
 * 
 * I misspelled triangle the first time in the printing of what type of triangle it is.
 * lines: 217,222,227
 * 
 * I did also change the format of some of the outputs because that is where like
 * 90% of my output differed from the correct output. I just followed the examples on the assignment though so I don't
 * know why points would be taken off. The format of my code looked exactly like the examples. 
 * 
 * for example my format was:
 * 
 * What is todays's day?
 * What is today's month?
 * What is today's year?
 * 
 * 
 * 
 * But the correct output had it all in one line:
 * 
 * What is today's day? What is today's month? What is today's year?
 * 
 * 
 * 
 */
  import java.util.Scanner;
 
import java.text.SimpleDateFormat;
import java.util.Date;

public class Project2
{
	public static void main(String[]args)
	{
		Scanner get = new Scanner(System.in);
		
		String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
		
		System.out.println("Shape Machine login");
		
		int tries;
		String input = " ";
		
		for(tries = 0; !input.equals(date) && tries < 3; tries++ )
		{
			
		
		System.out.println(" ");
		System.out.print("What is today's day? What is today's month? What is today's year?");
		int day = get.nextInt();
		String stringDay = null;
		if (day < 10 && day > 0)
		{
			stringDay = ("0" + day);
		}
		
		else if(day > 10 && day < 31)
		{
			stringDay = ("" + day);
		}
		
		
		
		int month = get.nextInt();
		String stringMonth = null;
		if (month < 10 && month > 0)
		{
			stringMonth = ("0" + month);
		}
		
		else if(month > 9 && month < 13)
		{
			stringMonth = ("" + month);
		}
		
		
		
		int year = get.nextInt();
		
		input = stringDay + "-"+ stringMonth + "-" + year;

		
		if (!input.equals(date) && tries < 2)
			{
				System.out.print("#ERROR Login attempt #" + (tries+1) + " Invalid input. Please try again.");
			}
		
		}
	
		if (tries > 2 && !input.equals(date))
		{
			System.out.print("#ERROR 3rd invalid login attempt. Terminating program.");
			System.exit(0);
		}
		
		System.out.print("Correct date. Welcome!");
		
		String shape = " ";
		
		while (!shape.equals("Exit"))
		{	
			
			System.out.println(" ");
			System.out.println("---Welcome to the Shape Machine---");
			System.out.println("Available Options:");
			System.out.println("Circles");
			System.out.println("Rectangles");
			System.out.println("Triangles");
			System.out.println("Exit");
			System.out.println(" ");
			
			shape = get.next();
			
			if ( shape.equals("Circles"))
			{
				System.out.print("Circles selected. Please enter the radius:");
				
				double radius = -1.0;
				while ( radius < 0)
				{
					radius = get.nextDouble();
					if (radius < 0)
					{
						System.out.println("#ERROR Negative input. Please input the radius again:");
					}
				}
				
				double circumference = 2 * radius * Math.PI;
				double area = Math.PI * radius * radius;
				String circ_length = Double.toString(circumference);
				String area_length = Double.toString(area);
				
				System.out.println("The circumference is: " + circumference);
				System.out.println("The area is: " + area);
				System.out.println("Total number of digits in the circumference is: " + (circ_length.length() - 1));
				System.out.println("Total number of digits in the area is: " + (area_length.length() - 1));
					
			}
			
			else if (shape.equals("Rectangles"))
			{
				System.out.print("Rectangles selected. Please enter the 2 sides:");
				
				double width = -1;
				double length = -1;
			
				while ( width < 0 || length < 0)
				{
					width = get.nextDouble();
					length = get.nextDouble();
					
					if ( width < 0 || length < 0)
					{
						System.out.println("#Error Negative input. Please input the 2 sides again):");
					}
				}
				
				double area = width * length;
				double perimeter = ((2*width) +(2*length));

				String area_length = Double.toString(area);
				String perimeter_length = Double.toString(perimeter);
				
				System.out.println("The area is: " + area);
				System.out.println("The perimeter is: " + perimeter);
				System.out.println("Total number of digits in the area is: " + (area_length.length() - 1));
				System.out.println("Total number of digits in the perimeter is: " + (perimeter_length.length() - 1));
				
			}
			
			else if (shape.equals("Triangles"))
			{
				System.out.print("Triangles selected. Please enter the 3 sides:");
				
				double a = -1;
				double b = -1;
				double c = -1;
				
				while( a < 0 || b < 0 || c < 0)
				{
					a = get.nextDouble();
					b = get.nextDouble();
					c = get.nextDouble();
					
					if ( a < 0 || b < 0 || c < 0)
					{
						System.out.print("#ERROR Negative input. Please input the 3 sides again:");
					}
					
				}
				
				if( a+b < c || b+c < b || b+c < a)
				{
					System.out.print("#ERROR Triangle is not valid. Returning to menu.");
					continue;
					/*
					 * I didn't know if I should make the program print another
					 * blank line after this because it differs in the examples.
					 * There are only 2 examples when there is an invalid triangle
					 * and in one of them there is only 1 blank line separating 
					 * the #ERROR line and the ---Welcome--- line. But in the other
					 * there are 2 blank lines.
					 */
				}
				
				
				
				if(a == b && b == c)
				{
					System.out.print("The triangle is: Equilateral");
				}
				
				else if(a !=b && a != c && b != c)
				{
					System.out.print("The triangle is: Scalene");
				}
				
				else if((a==b && b!=c) || (a==c && c!=b) || (b==c && c!=a))
				{
					System.out.print("The triangle is: Isosceles");
				}
				
				double perimeter = a + b + c;
				double p = perimeter / 2;
				double area = Math.sqrt(p * (p-a) * (p-b) * (p-c));
				
				
				String perimeter_length = Double.toString(perimeter);
				String area_length = Double.toString(area);
				
				
				System.out.println("The perimeter is: " + perimeter);
				System.out.println("The area is: " + area);
				System.out.println("Total number of digits in the perimeter is: " + (perimeter_length.length() - 1));
				System.out.println("Total number of digits in the area is: " + (area_length.length() - 1));
				
				
			}
			
			else if (!shape.equals("Circles") && !shape.equals("Rectangles") && !shape.equals("Triangles") && !shape.equals("Exit"))
			{
				System.out.print("#ERROR Invalid option. Please try again.");
			}
			
			
		}
		
		if (shape.equals("Exit"))
		{
			System.out.println("Terminating program. Have a nice day!");
			System.exit(0);
		}
		
	}
	
}
