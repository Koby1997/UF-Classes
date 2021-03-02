import java.util.ArrayList;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

public class Dictionary
{

	private ArrayList<String> dictionary = new ArrayList<>();
	private String word;
	
	
	public Dictionary()
	{
		//constructor
		this.dictionary = dictionary;
	}
	
			
		
	
	
	
	
	
	
	public int getVocabularySize()
	{
		return dictionary.size();
	}
	
	
	public boolean loadDictionaryFromFile(String filePath)
	{
		Scanner fs = null; //file Scanner
	
		
		try
		{
			File dictionaryFile = new File(filePath);
			fs = new Scanner(dictionaryFile);	
			
			while(fs.hasNext())
			{
				dictionary.add(fs.next());
				
			}
			fs.close();
			
		}
			
		catch(FileNotFoundException e)
		{
			return false;
		}
		
		return true;
		
	}
	
	
	
	
	
	
	
	
	public boolean isWord(String word)
	{
		
		this.word = word;
		boolean correct = false;
		
		int i;
		for(i = 0; i < dictionary.size(); i++)
		{
			if(dictionary.get(i) == word)
			{
				correct = true;
				break;
			}
		}
		
		
		if(i == dictionary.size())
			correct = false;
		
		return correct;
	}
	
	
	
	
	
	
	
	
	
}