/*
 * Name: Koby Miller
 * UFL ID: 5171-4009
 * Section: 0394
 * Project Number: 4
 * 
 * This project creates a Pokedex for pokemon and allows you to put in
 * and sort different pokemon. It also lets you see things such as their stats.
 * 
 * */


public class Pokemon {

	String species;
	int attack;
	int defense;
	int speed;
	
	public Pokemon(String species)
	{
		this.species = species;
		
		attack = (species.length() * 4) + 2;
		defense = (species.length() * 2) + 7;
		speed = (species.length() * 3) + 5;
		
	}

	
	public void grow(int boost)
	{
		attack += boost;
	}
	
	public void harden(int boost)
	{
		defense += boost;
	}
	
	public void haste(int boost)
	{
		speed += boost;
	}
	
	
	
	public String getSpecies()
	{
		return species;
	}
	
	public void setSpecies(String spc)
	{
		species = spc;
	}
	
	
	
	public int getAttack()
	{
		return attack;
	}
	
	public void setAttack(int atk)
	{
		attack = atk;
	}
	
	
	
	public int getDefense()
	{
		return defense;
	}
	
	public void setDefense(int def)
	{
		defense = def;
	}
	
	
	
	public int getSpeed()
	{
		return speed;
	}
	
	public void setSpeed(int spd)
	{
		speed = spd;
	}
	
	
	  
	





}
