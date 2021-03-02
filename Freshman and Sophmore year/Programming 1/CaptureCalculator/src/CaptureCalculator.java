import java.util.Scanner;

public class CaptureCalculator {
	
	
	public static void main(String[]args)
	{
		Scanner get = new Scanner(System.in);
		
		System.out.println("Hello and welcome to the Monster Capture Possibility Calculator.");
		System.out.println("Please enter the Latitude of the monster (1-10):");
		
		// I used double for most because the values have a possibility of not being whole(Ex: it can 5.5 latitude)
		double lat_monster = get.nextDouble();
		
		if(lat_monster < 1 || lat_monster > 10)
		{
			System.out.println("Invalid");
			System.exit(0);
		}
		
		System.out.println("Please enter the longitude of the monster (1-10):");
		double long_monster = get.nextDouble();
		
		if(long_monster < 1 || long_monster > 10)
		{
			System.out.println("Invalid");
			System.exit(0);
		}
		
		System.out.println("Please enter the time the monster appeared (1-1440);");
		double appear_monster = get.nextDouble();
		
		if(appear_monster < 1 || appear_monster > 1440)
		{
			System.out.println("Invalid");
			System.exit(0);
		}
		
		System.out.println("Please enter the possible time the monster will exist (10-40):");
		double time_monster_exist = get.nextDouble();
		
		if(time_monster_exist < 10 || time_monster_exist > 40)
		{
			System.out.println("Invalid");
			System.exit(0);
		}
		
		System.out.println("Please enter the player's Id (8 digits):");
		int ID = get.nextInt();
		
		if(ID < 10000000 || ID > 99999999)
		{
			System.out.println("Invalid");
			System.exit(0);
		}
		
		int luck = ID % 100;
		//gets last 2 digits
		
		System.out.println("Please enter the time of the player noticed the monster (1-1440):");
		double time_noticed_monster = get.nextDouble();
		
		if(time_noticed_monster < 1 || time_noticed_monster > 1440)
		{
			System.out.println("Invalid");
			System.exit(0);
		}
		
		System.out.println("Please enter the latitude of the player (1-10):");
		double lat_player = get.nextDouble();
		
		if(lat_player < 1 || lat_player > 10)
		{
			System.out.println("Invalid");
			System.exit(0);
		}
		
		System.out.println("Please enter the longitude of the player (1-10):");
		double long_player = get.nextDouble();
		
		if(long_player < 1 || long_player > 10)
		{
			System.out.println("Invalid");
			System.exit(0);
		}
		
		System.out.println("Please enter the player's walking speed (10-200):");
		double speed = get.nextDouble();
		
		if(speed < 10 || speed > 200)
		{
			System.out.println("Invalid");
			System.exit(0);
		}
		
		double subtract_lat = (lat_monster - lat_player) * 1000;
		// (latitude of monster - latitude of player)
		// * 1000 because in is in km and we need m
		double subtract_long = (long_monster - long_player) * 1000;
		// (longitude of monster - longitude of player)
		
		double square_lat = Math.pow(subtract_lat, 2);
		// (latitude of monster - latitude of player)^2
		
		double square_long = Math.pow(subtract_long, 2);
		// (longitude of monster - longitude of player)^2
		
		double add_lat_long = square_lat + square_long;
		// (lat of monster - lat of player)^2 +(long of monster - long of player)^2
		
		double total_distance = Math.sqrt(add_lat_long);
		
		double abs_total_distance = Math.abs(total_distance);
		
		double final_distance = Math.round(abs_total_distance *10)/10.0;
	
		double time_to_monster = final_distance / speed;
		
		double arrive_at_monster = time_to_monster + time_noticed_monster;
		// arive_at_ monster = Tg
		
		double round_arrive_at_monster = Math.round(arrive_at_monster*10)/10.0;
		
		double monster_disappears = appear_monster + time_monster_exist;
		// monster_disappears = Ta +Te
		double disappear_probability = (((round_arrive_at_monster - monster_disappears) / time_monster_exist) * 100);
		// (Tg - (Ta +Te)/Te)*100 
		
		/* I know there are a lot of doubles, but I could not get it to work, so I went step by
		 * step with the formulas and rounding to make sure that I would get the right numbers
		 */
		

		
		System.out.println("Player " + ID + " who is on the ");
		
		if (luck >=00 && luck <= 49)
		{
			System.out.print("lucky list, ");
		}
		
		else
		{
			System.out.print("normal list, ");
		}
		
		System.out.println(" ");
		// This is just because it was putting the lucky/unlucky and the notice the monster line below on the same line
		
		System.out.println("noticed the monster at time " + time_noticed_monster + ",");
		System.out.println("is " + final_distance + "m away from the monster,");
		System.out.println("and will arive at time " + round_arrive_at_monster + "." );
		System.out.println("The monster's disappear time is about " + monster_disappears + ".");
		System.out.println("So the player will capture this monster with ");
		
		if (round_arrive_at_monster <= monster_disappears)
		{
			System.out.print("Definite possibility");
		}
		
		else 
		{
			if (luck < 50) // lucky
			{

				if (disappear_probability > 0 && disappear_probability <= 10)
				{
					System.out.print("Highly Likely possibility");
				}
				
				else if (disappear_probability > 10 && disappear_probability <= 30)
				{
					System.out.print("Likely possibility");
				}
				
				else if (disappear_probability > 30 && disappear_probability <= 40)
				{
					System.out.print("Unsure possibility");
				}
				
				else if (disappear_probability > 40 && disappear_probability <= 50)
				{
					System.out.print("Unlikely possibility");
				}
				
				else if (disappear_probability > 50)
				{
					System.out.print("Highly Unlikely possibility");
				}
			}
			
			else if (luck >= 50)
			{
				if (disappear_probability > 0 && disappear_probability <= 5)
				{
					System.out.print("Highly Likely possibility");
				}
				
				else if (disappear_probability > 5 && disappear_probability <= 20)
				{
					System.out.print("Likely possibility");
				}
				
				else if (disappear_probability > 20 && disappear_probability <= 35)
				{
					System.out.print("Unsure possibility");
				}
				
				else if (disappear_probability > 35 && disappear_probability <= 40)
				{
					System.out.print("Unlikely possibility");
				}
				
				else if (disappear_probability > 40)
				{
					System.out.print("Highly Unlikely possibility");
				}
			}
			
			// So many if statements!
			
		}
		
		
	}

}
