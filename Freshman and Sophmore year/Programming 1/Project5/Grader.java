import java.util.ArrayList;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;


public class Grader
{

	
	private boolean available;
	private Student student;
	private Dictionary dict;
	
	
	
	public Grader(Dictionary dict)
	{
		available = true;
		student = null;
		this.dict = dict;
	}
	
	
	public boolean gradeStudent(String fileName)
	{
		
		
		
		try
		{
			File studentFile = new File(fileName + ".txt");
			
			Scanner fs = new Scanner(studentFile);
			ArrayList<String> essay = new ArrayList<>();
			Dictionary dictionary = new Dictionary();
			dictionary.loadDictionaryFromFile("dictionary.txt");
			
			
			String format;
			String[] restOfEssay = new String[essay.size()];
			
			 int i;
			for( i = 0; fs.hasNext(); i++)
			{
				
				if(i < 5)
				{
					format = caseAndPunctuation(fs.nextLine());
					essay.add(format);	
				}
				else
				{
					format = caseAndPunctuation(fs.next());
					restOfEssay = format.split("\\s");

				}
				
				
				
				
				
			}
			 
			fs.close();
			
			
			//All
			String type;
			String fullName;
			String id;
			ArrayList<String> errorList = new ArrayList<>();
			
			
			//Graduate
			String major;     //Undergraduate as well
			String advisor;
			
			//Highschool
			String nameOfSchool;
			
			
			
			type = essay.get(0);
			System.out.println(essay.get(0));
			fullName = essay.get(1);
			System.out.println(essay.get(2));
			id = essay.get(2);
			
			

//------------------------------------------------------------------------

			if (type.equals("graduate student"))
			{

				major = (essay.get(3));
				advisor = (essay.get(4));

				
				for( i = 5; i <= restOfEssay.length; i++)
				{

					if(dict.isWord(restOfEssay[i]) == false)
					{
						errorList.add(restOfEssay[i]);
					}
				}
				
				student = new GraduateStudent(fullName,id,essay.toString(),errorList,major,advisor);
			}
			
//---------------------------------------------------------------------------------
			
			
			
			if (type == "undergraduate student")
			{
				major = (essay.get(3));
				
				for( i = 4; i <= restOfEssay.length; i++)
				{
					if(dict.isWord(restOfEssay[i]) == false)
					{
						errorList.add(restOfEssay[i]);
					}
				}
				
				student = new UndergraduateStudent(fullName,id,essay.toString(),errorList,major);
			}
			
			
//----------------------------------------------------------------------		
			
			
			
			
			
			if (type == "highschool student")
			{
				nameOfSchool = essay.get(3);
				
				for( i = 4; i <= restOfEssay.length; i++)
				{
					if(dict.isWord(restOfEssay[i]) == false)
					{
						errorList.add(restOfEssay[i]);
					}
				}
				
				student = new HighSchoolStudent(fullName, id, essay.toString(), errorList, nameOfSchool);
			}
			
//---------------------------------------------------------------------------------------------------------			

			
		}
		
		catch(FileNotFoundException e)
		{
			return false;
		}
		
		
		isAvailable();
		
		
		
		
		
		return true;
	}
	
	
	public boolean isAvailable()
	{
		boolean spotOpen = false;
		if(student == null && available == true)
		{
			spotOpen = true;
		}
		
		return spotOpen;
	}
	
	
	public Student getStudent()
	{
		return student;
	}
	
	
	public void reset()
	{
		student = null;
		available = true;
	}
	
	
	
	
	
	
	public String caseAndPunctuation(String essayWord)
	{
		String lc;
		lc = essayWord.toLowerCase();
		lc.replace("[]{}(),.<>?!;:_=+*%@#$" , "" );
		
		return lc;
	}
	
	
	
}
