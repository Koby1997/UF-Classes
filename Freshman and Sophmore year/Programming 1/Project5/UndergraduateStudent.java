import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class UndergraduateStudent extends Student
{

	private String major;
	
	public UndergraduateStudent(String name, String id, String essay, ArrayList<String> errorList, String major)
	{
		super(name, id, essay, errorList);
        this.major = major;
	}
	
	public String getMajor()
	{
		return major;
	}
	
	
	public void setMajor(String major)
	{
		this.major = major;
	}
	
	
	public void writeToFile()
	{
		File file = new File(getId()+"_graded.txt");
		PrintWriter printWriter = null;
		try 
		{
			printWriter = new PrintWriter(file);
		}
		
		catch (FileNotFoundException e)
		{
			
		}
		
		
		printWriter.println("Undergraduate Student " + getName());
		printWriter.println("Student ID: " + getId());
		printWriter.println("Major: " + getMajor());
		
		for(int i = 0; i <= getErrorList().size(); i++)
		{
			printWriter.println("(" + i + ")" + getErrorList().get(i));
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
