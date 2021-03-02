/*
 * Name: Koby Miller
 * UFL ID: 5171-4009
 * Section: 0394
 * Project Number: 4
 * 
 * This project creates a Pokedex for pokemon and allows you to put in
 * and sort different pokemon. It also lets you see things such as their stats.
 * 
 * This class itself organizes the pokedex.
 * */

public class Pokedex {

	int numPokemon;
	Pokemon pokemonList[];
	
	//Constructor
	public Pokedex(int size)
	{
		pokemonList = new Pokemon[size];
	}
	
	
	public String[] listPokemon()
	{
		String stringArray[] = new String[numPokemon];
		if(numPokemon == 0)
		{
			return null;
		}
		else 
		{
			for(int i = 0; i < numPokemon; i++)
			{
				stringArray[i] = pokemonList[i].getSpecies();
			}
			return stringArray;
		}
	}
	
	public boolean addPokemon(String species)
	{
		
		int i;
		int x = 0;
	
		
	
		if (numPokemon == pokemonList.length)
		{
			System.out.println("Max");
			x++;
			
		}
		
		if (x == 0)
		{
			
		
			 for (i = 0; i < numPokemon; i++)
			 {
				 if((species).equalsIgnoreCase(pokemonList[i].getSpecies()))
				 {
					 System.out.println("Duplicate");
					 x++;
					 
				 }
			 }
		}

	 
		 
		 if (x > 0)
		 {
			 return false;
		 }
		 else
		 {
			 pokemonList[numPokemon] = new Pokemon(species);
			 numPokemon++;
			 return true;
		 }
		 
		 
		 
		
		
		
	}
	
	public int[] checkStats(String species)
	{
	
		int [] stats = new int[3];
		int i;
		
		for(i = 0; i < numPokemon; i++)
		{	
			if(species.equalsIgnoreCase(pokemonList[i].getSpecies()))
			{
				stats[0] = pokemonList[i].getAttack();
				stats[1] = pokemonList[i].getDefense();
				stats[2] = pokemonList[i].getSpeed();
				
				return stats;
				
			}
		}
		
	return null;
	
	}
	
	public void sortPokemon()
	{
		//bubble method
		
		boolean finished = false;
		int i;
		int j=0;
		Pokemon swap;
		
		while((finished == false && (j < numPokemon)))
				{
			
					for(i = 0; i <  numPokemon - 1; i++)
					{
						if((pokemonList[i].getSpecies()).compareToIgnoreCase(pokemonList[i + 1].getSpecies()) > 0)
						{
							swap = pokemonList[i];
							pokemonList[i] = pokemonList[i + 1];
							pokemonList[i + 1] = swap;
							
						}
					}
					
					if(j == pokemonList.length - 1)
					{
						finished = true;
					}
					else
					{
						j++;
					}
			
			
				}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*
		int x,y;
		String sort;
		
		for (x = 0; x < pokemonList.length -1 ; x++)
		{
			for ( y = x+1 ; y < pokemonList.length ; y ++)
			{
				if(pokemonList[x].compareToIgnoreCase(pokemonList[y]) > 0)
				{
				sort = pokemonList[x];
				pokemonList[x] = pokemonList[y];
				pokemonList[y] = sort;
				}
			}
		}
		*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*int i = 0;
		int j = 0;
		
		
		for(j = 0 ; j < numPokemon - 1 ; j++)
		{
			int iMin = j;
			
			for( i = j+1; i < numPokemon; i++)
			{
				if (pokemonList[i] < pokemonList[iMin])
				{
					iMin = i;
				}
			}
			
			if(iMin != j)
			{
				swap(pokemonList[j], pokemonList[iMin]);
			}
		}
		*/
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
