import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class HighSchoolStudent extends Student
{

	private String nameOfSchool;
	
	
	public HighSchoolStudent(String name, String id, String essay, ArrayList<String> errorList, String nameOfSchool)
	{
		super(name, id, essay, errorList);
		this.nameOfSchool = nameOfSchool;
	}
	
	
	
	public String getSchoolName()
	{
		return nameOfSchool;
	}
	
	
	public void setSchoolName(String schoolName)
	{
		this.nameOfSchool = nameOfSchool;
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
		
		
		printWriter.println("High School Student " + getName());
		printWriter.println("Student ID: " + getId());
		printWriter.println("School Name: " + getSchoolName());
		
		
		for(int i = 0; i <= getErrorList().size(); i++)
		{
			printWriter.println("(" + i + ")" + getErrorList().get(i));
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
