import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class GraduateStudent extends Student
{

	private String major;
	private String advisor;
	
	public GraduateStudent(String name, String id, String essay, ArrayList<String> errorList, String major, String advisor)
	{
		super(name, id, essay, errorList);
        this.major = major;
        this.advisor = advisor;
	}
	
	
	public String getMajor()
	{
		return major;
	}
	
	
	public void setMajor(String major)
	{
		this.major = major;
	}
	
	
	public String getAdvisor()
	{
		return advisor;
	}
	
	
	public void setAdvisor(String advisor)
	{
		this.advisor = advisor;
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
		
		
		printWriter.println("Graduate Student " + getName());
		printWriter.println("Student ID: " + getId());
		printWriter.println("Major: " + getMajor());
		printWriter.println("Advisor: " + getAdvisor());
		
		for(int i = 0; i <= getErrorList().size(); i++)
		{
			printWriter.println("(" + i + ")" + getErrorList().get(i));
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}