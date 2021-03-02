/*
 * Name: Koby Miller
 * UFL ID: 5171-4009
 * Section: XXXX
 * Project Number: 3
 * 
 * This project uses methods to make a program that will act as a bank account.
 * You can deposit or withdraw money. It can switch between multiple currencies as well.
 */

import java.util.Scanner;


public class CurrencyExchange
{

    private static double balance = 0;

    /**
     * Get the current balance of the account
     */
    public static double getBalance()
    {
        return balance;
    }

     /**
     * Update the balance of current account, will do a roundup to 2 significant digits
     *
     * @return if update succeed, will return true. If failed, return false
     */
    private static boolean updateBalance(double newBalance)
    {

        balance = Math.round(newBalance * 100) / 100.0;
        if (balance >= 0) {
            return true;
        } else
            return false;
    }

/****************************************************************
*        Do not modify anything above this line                 *
*****************************************************************/

    /**
     * main method, put your business logic and console input here
     */
    public static void main(String[] args)
    {
        //Please DO NOT create any other Scanner objects
        Scanner input = new Scanner(System.in);

        System.out.println("Welcome to Currency Exchange 2.0");
        System.out.println(" ");
        printConversionTable();
        
        
        
        
        int currencyType;
        String log;
        
        
        int mainChoice = 1;
        while( mainChoice != 4)
        {
       
	        mainChoice = mainMenuOptionSelector(input);
	        
	        switch (mainChoice)
	        	{
		        case 1:
		        	
		        	updateBalance(balance);
		        	System.out.println("Your current balance is: " + getBalance());
		        	
		        	break;
		        	
		        case 2:
		        	
		        	currencyType = currencyMenuOptionSelector(input);
		        	System.out.println("Please enter the deposit amount:");
		        	
		        	double deposit = input.nextDouble();
		        	if(deposit(deposit, currencyType) == false)
		        	{
		        		break;
		        	}
		        	
		        	log = logTransaction( deposit , currencyType , true);
		        	System.out.println(log);
		        	
		        	break;
		        	
		        case 3:
		        	
		        	currencyType = currencyMenuOptionSelector(input);
		        	System.out.println("Please enter the withdrawal amount:");
		        	
		        	/* When comparing my outputs to the ones we were given it says that we should say - 
		        	 
		        	    "Please enter the withdraw amount:"
		        	    
		        	  but the example says - 
		        	  
		        	    "Please enter the withdrawal amount:" 
		        	    
		        	  So I don't know what ot do so I just went with the example
		        	 */ 
		        	double withdrawal = input.nextDouble();
		        	
		        	if((withdraw(withdrawal, currencyType)) == false)
		        	{
		        		break;
		        	}
		        	
		        	log = logTransaction( withdrawal , currencyType , false);
		        	System.out.println(log);
		        	
		        	break;
		        	
		        case 4:
		        	updateBalance(balance);
		        	
		        	if(balance > 0)
		        	{
		        	log =logTransaction(balance, 1, false);
		        	System.out.println(log);
		        	}
	        	
	        		else
	        		{
	        		System.out.println("Your remaining balance is 0.0 U.S. Dollars");
	        		
	        		/*
	        		 * Again the example is different from the correct output we are given.
	        		 * it is small, the examples has "Dollars" and the output has "dollars"
	        		 * not a big difference but I again just went with the example. I 
	        		 * don't want to lose points that is why I am pointing these out.
	        		 */
	        		}
		        	
		        	//one example had an extra line here, but the others didn't so I did not put another blank line.
		        	System.out.println("Goodbye");
		        	break;
	        }
        }
        // this is where you will write the code that invokes (calls) 
        // the methods below to facilitate the successful running of 
        // your code
    }
    
    
    
    
    
    


    /**
     * deposit the amount of a specific currency to the account
     *
     * @param amount       the amount to be deposited.
     * @param currencyType the currency type will be the same as the type number used
     *                     in the convertCurrency(double, int, boolean) method. An Invalid type will result in a
     *                     deposit failure.
     * @return if deposit succeed, will return true. If failed, return false
     */
    public static boolean deposit(double amount, int currencyType) 
    {
       
    	if(amount <= 0)
    	{
    		System.out.println("Logging Error");
    		return false;
    	}
    	else
    	{
    	amount = convertCurrency(amount,currencyType,true);
    	
        balance = balance + amount;
        updateBalance(balance);
        
        return true;
    	}
    }
    
    
    
    
    
    
    
    

    /**
     * withdraw the value amount with a specific currency from the account. The withdraw amount should never exceed the current account balance, or the withdrawal will fail. If the currency is other than USD, a 0.5% convenience fee will be charged
     *
     * @param amount       the amount to be withdrawn.
     * @param currencyType the currency type will be the same as the type number used
     *                     in the convertCurrency(double, int, boolean) method. An invalid
     * 		         type will result a withdraw failure.
     * @return if withdraw succeed, will return true. If failed, return false
     */
    public static boolean withdraw(double amount, int currencyType) 
    {
    
    	double amountAndFee = 0;
    	
    	if(amount <= 0)
    	{
    		System.out.println("Logging Error");
    		return false;
    
    	}
    	
    	
        if(currencyType != 1)
        {
        	amount = convertCurrency(amount,currencyType,true);
        	
        	amountAndFee = amount + (amount * .005);
        }
        
        else
        {
        	amountAndFee = amount;
        }
        
        
        
        if(amountAndFee > balance)
        {
        	System.out.println("Error: Insufficient funds.");
        	System.out.println("Logging Error");
        	return false;
        
        }
        
        else
        {
        	
        	balance = balance - amountAndFee;
        	return true;
        }
        
       
    }
    
    
    
    
    
    
    
    
    
    

    /**
     * Convert the value amount between U.S. dollars and a specific currency.
     *
     * @param amount         The amount of the currency to be converted.
     * @param currencyType   The integer currencyType works as follows:
     *                       1 for usd (U.S. Dollars)
     *                       2 for eur (Euros)
     *                       3 for bri (British Pounds)
     *                       4 for inr (Indian Rupees)
     *                       5 for aus (Australian Dollars)
     *                       6 for cnd (Canadian Dollars)
     *                       7 for sid (Singapore Dollars)
     *                       8 for swf (Swiss Francs)
     *                       9 for mar (Malaysian Ringgits)
     *                       10 for jpy (Japanese Yen)
     *                       11 for cyr (Chinese Yuan Renminbi)
     * @param isConvertToUSD Tells the direction of the conversion. If the value is true, then the conversion is from a
     *                       foreign currency to USD. If the value is false, then the conversion is from USD to the
     *                       foreign currency
     * @return the converted amount
     */
    public static double convertCurrency(double amount, int currencyType, boolean isConvertToUSD)
    {
    	double currencyNumber = 0;
    	
        switch(currencyType)
        {
        case 1: currencyNumber = 1.00; break;
        case 2: currencyNumber = 0.89; break;
        case 3: currencyNumber = 0.79; break;
        case 4: currencyNumber = 66.53; break;
        case 5: currencyNumber = 1.31; break;
        case 6: currencyNumber = 1.31; break;
        case 7: currencyNumber = 1.37; break;
        case 8: currencyNumber = 0.97; break;
        case 9: currencyNumber = 4.12; break;
        case 10: currencyNumber = 101.64; break;
        case 11: currencyNumber =6.67; break;
        }
        
       
        
        if(isConvertToUSD == true)
        {
        	amount = amount / currencyNumber;
        }
        else
        {
        	amount = amount * currencyNumber;
        }
        
       return amount;
      
        
    }

    
    
    
    
    
    
    
    
    /**
     * Displays message at the end of the withdraw, deposit, and endTransaction stating
     * how much the user just withdrew/deposited and what type (this will be used in both features B, C and D of the
     * main menu).
     *
     * @param amount       the amount of currency withdrew/deposited
     * @param currencyType the currency type will be the same as the type number used
     *                     in {@link #convertCurrency(double, int, boolean)}
     * @param isDeposit    if true log the deposit transaction, false log the withdraw transaction
     * @return Return the formatted log message as following examples:
     * You successfully withdrew 10.0 U.S. Dollars
     * You successfully deposited 30.0 Japanese Yen
     * <p>
     * The invalid input like invalid currencyType or negative amount,
     */
    private static String logTransaction(double amount, int currencyType, boolean isDeposit)
    {
        String x;
    	
    	if(isDeposit == true)
    	{
    		x = "deposited";
    	}
    	else
    	{
    		x = "withdrew";
    	}
    	
    	
    	String y = "y";
    	
    	switch(currencyType)
     	{
     	 case 1: y = "U.S. Dollars"; break;
         case 2: y = "Euros"; break;
         case 3: y = "British Pounds"; break;
         case 4: y = "Indian Rupees"; break;
         case 5: y = "Australian Dollars"; break;
         case 6: y = "Canadian Dollars"; break;
         case 7: y = "Singapore Dollars"; break;
         case 8: y = "Swiss Francs"; break;
         case 9: y = "Malaysian Ringgits"; break;
         case 10: y = "Japanese Yen"; break;
         case 11: y = "Chinese Yuan Renminbi"; break;
     	}
    	
    	
    	
    	
    	
    	return ("You successfully " + x + " " + amount + " " + y);
    }

    
    
    
    
    
    
    
    
    
    /**
     * Prints the currency menu (see output examples), allows the user to make a selection from available currencies
     *
     * @param input the Scanner object you created at the beginning of the main method. Any value other than the
     *              11 valid valid currency types should generate an invalid value prompt. Print the list again
     *              and prompt user to select a valid value from the list. the currency type will be the same as
     *              the type number used in {@link #convertCurrency(double, int, boolean)}
     * @return an integer from 1-11 inclusive representing the user’s selection.
     */
    private static int currencyMenuOptionSelector(Scanner input) 
    {
    	int currencyType = 0;
    	while(currencyType < 1 || currencyType > 11)
    	{	
    		//Some examples have a blank line here
    		System.out.println("Please select the currency type:");
        	System.out.println(" 1. U.S. Dollars");
        	System.out.println(" 2. Euros");
        	System.out.println(" 3. British Pounds");
        	System.out.println(" 4. Indian Rupees");
        	System.out.println(" 5. Australian Dollars");
        	System.out.println(" 6. Canadian Dollars");
        	System.out.println(" 7. Singapore Dollars");
        	System.out.println(" 8. Swiss Francs");
        	System.out.println(" 9. Malaysian Ringgits");
        	System.out.println("10. Japanese Yen");
        	System.out.println("11. Chinese Yuan Renminbi");
        	// The decimals lined up here on the examples
        	currencyType = input.nextInt();
        	
        	if (currencyType < 1 || currencyType > 11)
        	{
            	System.out.println(" Input failed validation. Please try again.");
            	System.out.println(" ");
        	}
        	
    	}
    	
    	return currencyType;
    }
    
    
    
    
    
    
    
    
    

    /**
     * Prints the main menu (see output examples), allows the user to make a selection from available operations
     *
     * @param input the Scanner object you created at the beginning of the main method. Any value other than the 4
     *              valid selections should generate an invalid value prompt. Print the list again and prompt user to
     *              select a valid value from the list.
     * @return an integer from 1-4 inclusive representing the user’s selection.
     */
    private static int mainMenuOptionSelector(Scanner input)
    {
    	int menuOption = 0;
        
        while(menuOption < 1 || menuOption > 4)
        {
        	System.out.println(" ");
        	System.out.println("Please select an option from the list below:");
            System.out.println("1. Check the balance of your account");
            System.out.println("2. Make a deposit");
            System.out.println("3. Withdraw an amount in a specific currency");
            System.out.println("4. End your session (and withdraw all remaining currency in U.S. Dollars)");
            
            menuOption = input.nextInt();
          //System.out.println(menuOption);
            if(menuOption < 1 || menuOption > 4)
            {
            	System.out.println(" Input failed validation. Please try again.");
            	System.out.println(" ");
            }
        	
           
            
        }
    	 
        return menuOption;
        
    }

    
    
    
    
    
    
    /**
     * Prints the conversion table at the start of the program (see the output examples).
     */
    private static void printConversionTable() 
    {
    	System.out.println("Current rates are as follows:");
		System.out.println(" ");
		System.out.println("1 -  U.S. Dollar - 1.00"); //examples had extra space in front of U.S. so I put it just in case
		System.out.println("2 - Euro - 0.89");
		System.out.println("3 - British Pound - 0.78");
		System.out.println("4 - Indian Rupee - 66.53");
		System.out.println("5 - Australian Dollar - 1.31");
		System.out.println("6 - Canadian Dollar - 1.31");
		System.out.println("7 - Singapore Dollar - 1.37");
		System.out.println("8 - Swiss Franc - 0.97");
		System.out.println("9 - Malaysian Ringgit - 4.12");
		System.out.println("10 - Japanese Yen - 101.64");
		System.out.println("11 - Chinese Yuan Renminbi - 6.67");   
    }
}