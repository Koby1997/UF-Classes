import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Array;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

class TravelAgencyDriver {
	public static void main( String args[] ) {
		OurTravelAgency ota = new OurTravelAgency();
		ota.menu();
	}
}

class OurTravelAgency {
	private String database;
	private String username;
	private String password;

    private DBConnection dbc;
    private DatabaseMetaData metadata;
    private Scanner scanner;
	
	public OurTravelAgency() {
		this( "TravelAgencyDB", "root", "root" );
	}
	public OurTravelAgency( String database, String username, String password ) {
		this.database = database;
		this.username = username;
		this.password = password;

		System.out.println();
		System.out.println( "Openning a Connection to the " + database + " Database" );

		dbc = new DBConnection( database, username, password );
		dbc.openConnection();
		metadata = dbc.getDatabaseMetaData();
		scanner = new Scanner( System.in );
	}
	public void menu() {

		char choice = 'z';
		
		while ( choice != 'c' ) {
			System.out.println( "***** Main Menu *****" );
			System.out.println( " (a)  Execute SQL Query" );
			System.out.println( " (b)  View Tables" );
			System.out.println( " (c)  Quit" );
			System.out.print( "Enter choice:  " );
			choice = scanner.nextLine().charAt(0);
			System.out.println();
			
			try {
				switch ( choice ) {
					case 'a':	executeQuery();
								break;

					case 'b':	viewTables();
								break;

					case 'c':	dbc.closeConnection();
								System.out.println( "Goodbye." );
								System.out.println();
								break;
								
					default:
								System.out.println( "Please enter a valid choice!" );
								System.out.println();
				}
			}
			catch( IOException ioe ) {}
			catch( SQLException sqle ) {}
		}
	}

	private void executeQuery() throws IOException, SQLException {
		System.out.print( "Enter an SQL Query:  " );
		String sql = scanner.nextLine();
		System.out.println();

		ResultSet rs = dbc.query( sql, null );
		if ( rs != null ) {
			ResultSetMetaData rsmd = rs.getMetaData();
			int columns = rsmd.getColumnCount();

			System.out.print( "( " );
			for ( int i = 1; i < columns; i++ ) {
				System.out.print( rsmd.getColumnName(i) + ", " );
			}
			System.out.println( rsmd.getColumnName(columns) + " )" );

			while ( rs.next() ) {
				System.out.print( "( " );
				for( int i = 1; i <= columns; i++ ) {
					if ( i > 1 ) {
						System.out.print(", ");
					}
					System.out.print( rs.getString( i ) );
				}
				System.out.println( " )" );
			}
			System.out.println();
		}
		else {
			System.out.println( "No result set returned." );
		}
	}
	
    private void viewTables() throws SQLException {

		int numTables = 0;
		String tables[] = new String[0];
		String tableMenu = new String(" (0) Return to Main Menu\n" );

		ResultSet rs = metadata.getTables( null, null, null, new String[] { "TABLE" } );

		if ( rs != null ) {

			rs.last();
			numTables = rs.getRow();
			if ( !rs.first() ) {
				System.out.println( "Tables RS did not return to first." );
			}
			
			tables = new String[numTables];
			
			for ( int i = 0; i < numTables; i++ ) {
				tables[i] = rs.getString( "TABLE_NAME" );
				tableMenu = tableMenu + " (" + (i + 1) + ") " + tables[i];
				if ( i < numTables - 1 ) {
					tableMenu = tableMenu + "\n";
				}
				rs.next();
			}
		}
		else {
			System.out.println( database + " has no tables." );
			System.out.println();
		}
		
		int selection = -1;
		
		while( selection != 0 ) {
			System.out.println( "***** Table Menu *****" );
			System.out.println( tableMenu );
			System.out.print( "Enter a selection:  " );
			selection = Integer.parseInt( scanner.nextLine() );
			System.out.println();

			if ( selection > 0 && selection <= tables.length ) {
				selectTable( tables[selection - 1] );
			}
			else if ( selection == 0 ) {
				System.out.println( "Returning to the Main Menu." );
				System.out.println();
			}
			else {
				System.out.println( "Please enter a valid choice (0 to " + tables.length + ")!" );
				System.out.println();
			}
		}
	}
	
	public void selectTable( String table ) {

		int numAttributes = 0;
		String attributes[] = new String[0];
		String attributesMenu = new String();

		System.out.println("***** " + table + " Attributes *****");

		try {
			ResultSet rsa = metadata.getColumns( null, null, table, null );

			if ( rsa != null ) {

				rsa.last();
				numAttributes = rsa.getRow();
				if ( !rsa.first() ) {
					System.out.println( "Attributes RS did not return to first." );
				}
			
				attributes = new String[numAttributes];
				for ( int i = 0; i < numAttributes; i++ ) {
					attributes[i] = rsa.getString( "COLUMN_NAME" );
					attributesMenu = attributesMenu + "  *   " + attributes[i];
					if ( i < numAttributes - 1 ) {
						attributesMenu = attributesMenu + "\n";
					}

					rsa.next();
				}
			}
			else {
				System.out.println( table + " has no attributes." );
				System.out.println();
			}
		}
		catch ( SQLException sqle ) {}
		
		System.out.println( attributesMenu );
		System.out.print( "Enter Attributes [comma separated]:  " );
		String attributesList = scanner.nextLine();
		String attributesNames[] = attributesList.split( "," );
		System.out.println();

		/*************************************************************
		 * For this project, we began using preparedStatements.
		 * 
		 * We also used a non-standard action, asking users to enter
		 * the list of attributes they would like to view.  The 
		 * preparedStatement does not include a ? replacement option
		 * for the attributes listed within a SELECT, because this type
		 * of operation is not standard.
		 * 
		 * As well, observe that there are not injection options into 
		 * the attribute list that could possibly do hard to our 
		 * system.  All that is occuring here is listing the attributes
		 * to be SELECTed.
		 * 
		 * In the development of a real system, the user would select
		 * values to search for within the attributes, but not 
		 * specifying the attributes themselves.  The only scenario 
		 * where we might allow this would be when a system controlled
		 * list of attributes is displayed and a user would select 
		 * which option they prefer, then the system would compose the
		 * string.
		 * 
		 * A simple solution would be to construct a method that 
		 * compares the elements in attributesNames (what the user 
		 * entered) to attributes (those pulled from the db) and 
		 * compose the string from only those that match.
		 *************************************************************/

		try {
			String queryStr = new String( "SELECT " + attributesList + " FROM " + table );
			ResultSet rsq = dbc.query( queryStr, null );


			if ( rsq != null ) {
				ResultSetMetaData rsmd = rsq.getMetaData();
				int columns = rsmd.getColumnCount();

				System.out.print( "( " );
				for ( int i = 1; i < columns; i++ ) {
					System.out.print( rsmd.getColumnName(i) + ", " );
				}
				System.out.println( rsmd.getColumnName(columns) + " )" );

				while ( rsq.next() ) {
					System.out.print( "( " );
					for( int i = 1; i <= columns; i++ ) {
						if ( i > 1 ) {
							System.out.print(", ");
						}
						System.out.print( rsq.getString( i ) );
					}
					System.out.println( " )" );
				}
				System.out.println();
			}
			else {
				System.out.println( "No result set returned." );
			}
		}
		catch ( SQLException sqle ) {
			System.out.println( "Error:  Invalid Attribute" );
			System.out.println( "Enter Only Attributes from those Listed" );
			System.out.println();
		}
	}
}

/*
class PizzaPartyDriver {
	
	public static void main(String[] args) throws IOException {
		Connection connection;
	    ResultSet rs;
	    Statement statement;
	    String JDBC_DRIVER = "org.mysql.jdbc.Driver";
	    String LOCAL_HOST = "jdbc:mariadb://localhost:3306/";
	    String db = "PizzaParty";
	    String username;
	    String password;
		System.out.println();
	    
	    try {
			int Selection = 0;
			BufferedReader reader =
	                   new BufferedReader(new InputStreamReader(System.in));

            System.out.println( "Openning a Connection to the " + db + " Database" );
            System.out.print( "Enter the Username:  " );
            username = reader.readLine();
            System.out.print( "Enter the Password:  " );
            password = reader.readLine();
            System.out.println();

			connection = DriverManager.getConnection( LOCAL_HOST + db, username, password );
			statement = connection.createStatement();
			
			if ( connection != null ) {
				System.out.println( "Connected to " + db + "!" );
                System.out.println();
			}


			while(Selection!=3) {
				System.out.println("***** Main Menu *****" );
				System.out.println(" [1]  Execute SQL Query");
				System.out.println(" [2]  Build an Order");
				System.out.println(" [3]  Quit");
				System.out.print("Enter choice:  ");
				Selection = Integer.parseInt(reader.readLine());
				System.out.println();
				// System.out.println("Your  choice:  "+ Selection +"\n");
				
				switch(Selection) {
					case 1:
						PizzaPartyDriver.executeQuery(reader, statement);
						break;
					case 2:
						PizzaPartyDriver.buildOrder(reader, statement);
						break;
					case 3:
						break;
					default:
						System.out.println("Please enter a valid choice!");
                        System.out.println();					
				}
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static void buildOrder(BufferedReader reader, Statement statement) throws IOException, SQLException {
		
		String Customer = selectCustomer(reader, statement);
		String Restaurant = selectRestaurant(reader, statement);
		System.out.print("Is this order a delivery? (Yes/No):  ");
		String Delivery = reader.readLine();
        System.out.println();

		int Orderid;
		if(Delivery.equalsIgnoreCase("Yes")) {
			ResultSet dr = statement.executeQuery("select Car_Number from Driver where Restaurant_Name = '"+Restaurant+"' order by rand()");
			dr.next();
			String Driver = dr.getString(1);
			statement.executeUpdate("INSERT INTO orders (`Customer_Name`, `Restaurant_Name`, `Is_Delivery`, `Car_Number`) VALUES ('"+Customer+"', '"+Restaurant+"', 'Yes','"+Driver+"');");
			ResultSet rs = statement.executeQuery("select LAST_INSERT_ID()");
			rs.next();
			Orderid = rs.getInt(1);
		} else {
			statement.executeUpdate("INSERT INTO orders (`Customer_Name`, `Restaurant_Name`, `Is_Delivery`) VALUES ('"+Customer+"', '"+Restaurant+"', 'No');");
			ResultSet rs = statement.executeQuery("select LAST_INSERT_ID()");
			rs.next();
			Orderid = rs.getInt(1);
		}
		
		String choice = "";
		while(!choice.equals("2")) {
			System.out.println("***** " + Restaurant + " Options *****");
			System.out.println(" [1]  Add Pizza");
			System.out.println(" [2]  Finalize Order");
			System.out.print("Enter choice:  ");
			choice = reader.readLine();
			System.out.println();

			if(choice.equals("1")) {
				addPizza(reader, statement, Orderid, Restaurant);
			} else if(choice.equals("2")) {
				System.out.println("***** Order #"+Orderid +" *****");
				System.out.println("***** Customer *****");
				ResultSet r = statement.executeQuery("Select * from customer where customer_name = '"+Customer+"'");
				r.next();
				System.out.println( "  * " + r.getString(1));
				System.out.println( "  * " + r.getString(2));
				System.out.println( "  * " + r.getString(3));
				System.out.println("***** Restaurant *****");
				r = statement.executeQuery("Select * from restaurant where restaurant_name = '"+Restaurant+"'");
				r.next();
				System.out.println( "  * " + r.getString(1));
				System.out.println( "  * " + r.getString(2));
				System.out.println( "  * " + r.getString(3));
				r = statement.executeQuery("Select * from orders where order_id = "+Orderid);
				r.next();
				if(r.getString("Is_Delivery").equals("Yes")) {
					r = statement.executeQuery("Select * from orders natural join driver where order_id = "+Orderid);
					r.next();
					System.out.println("Delivered by:  "+ r.getString("Driver_Name") );
				}
				else {
					System.out.println( "Scheduled for Pickup" );
				}
				System.out.println();

				System.out.println("Pizzas\tPrice\tDescription");
				r = statement.executeQuery("select pizza_id,Flavor_Name, pizza.Crust_Style, Pizza.Size,Sauce_Name, flavor.Price+crusts.Price as price from pizza natural join flavor join crusts on pizza.Crust_Style = crusts.Crust_Style and pizza.Size=crusts.Size and pizza.Restaurant_Name=crusts.Restaurant_Name where pizza_id in (select pizza_id from order_pizza where order_id="+Orderid+")");
				int num = 1;
				while(r.next()) {
					System.out.println( "  #" + num +"\t"+ String.format("$%.2f", r.getDouble("price")) +"\t"+ r.getString("Size")+"\" "+r.getString("Crust_Style")+" crust "+r.getString("Flavor_Name")+" pizza with "+r.getString("Sauce_Name") + " sauce");
					num++;
				}
				System.out.println();
				
				r = statement.executeQuery("select sum(flavor.Price+crusts.Price) as price from pizza natural join flavor join crusts on pizza.Crust_Style = crusts.Crust_Style and pizza.Size=crusts.Size and pizza.Restaurant_Name=crusts.Restaurant_Name where pizza_id in (select pizza_id from order_pizza where order_id="+Orderid+");");
				r.next();
				System.out.println("Order Total:\t"+ String.format("$%.2f", r.getDouble("price")) );

				//System.out.println("Order Confirmed");
				System.out.println();
	
			}else {
				System.out.println("Invalid choice try again!");
				System.out.println();
			}
		}
		
	}
	
	private static void addPizza(BufferedReader reader, Statement statement, int orderid, String restaurant) throws SQLException, IOException {
		System.out.println("***** " + restaurant + " Menu *****");
		ArrayList<String> Flavors = new ArrayList<String>();
		ResultSet rs = statement.executeQuery("select * from flavor where restaurant_name = '"+restaurant+"'");
		int i=0;
		while(rs.next()) {
			Flavors.add(rs.getString(1));
			System.out.println( " [" + (i + 1) + "]" + "\t$" + rs.getString(3) + "\t" + rs.getString(1));
			ResultSet FT = statement.executeQuery("select topping_name from flavor_toppings where flavor_name ='"+rs.getString(1)+"' and restaurant_name = '"+restaurant+"'");
			int j = 0;
			System.out.print("\t\t");
			while(FT.next()) {
				if(j>0) System.out.print(", ");
				System.out.print(FT.getString(1));
				j++;
			}
			System.out.println();
			i++;
		}
		System.out.print("Enter choice:  ");
		int pizzaType = ( Integer.parseInt(reader.readLine()) - 1 );
        System.out.println();

		if(pizzaType<Flavors.size()) {
			String Flavor = Flavors.get(pizzaType);
			System.out.println("***** " + restaurant + " Crusts Options *****");
			ArrayList<String> Crusts = new ArrayList<String>();
			ArrayList<String> Sizes = new ArrayList<String>();
			ResultSet cs = statement.executeQuery("select * from crusts where restaurant_name = '"+restaurant+"'");
			int k=0;
			while(cs.next()) {
				Crusts.add(cs.getString(1));
				Sizes.add(cs.getString(2));
				System.out.println( " [" + (k + 1) + "]" + "\t+$" + cs.getString(4) + "\t" + cs.getString(1)+"("+cs.getString(2)+"\")");
				k++;
			}
			System.out.print("Enter choice:  ");
			int crusttype = ( Integer.parseInt(reader.readLine()) - 1);
            System.out.println();
            
			if(crusttype<Crusts.size()) {
				String Crust = Crusts.get(crusttype);
				String Size = Sizes.get(crusttype);
				System.out.println("***** " + restaurant + " Sauce Options *****");
				ArrayList<String> Sauces = new ArrayList<String>();
				ResultSet sc = statement.executeQuery("select * from sauce where restaurant_name = '"+restaurant+"'");
				int l=0;
				while(sc.next()) {
					Sauces.add(sc.getString(1));
					System.out.println( " [" + (l + 1) + "]" + "\t" + sc.getString(1));
					l++;
				}
				System.out.print("Enter choice:  ");
				int saucetype = ( Integer.parseInt(reader.readLine()) - 1);
                System.out.println();
                
				if(saucetype<Sauces.size()) {
					String Sauce = Sauces.get(saucetype);
					statement.executeUpdate("Insert into `pizza` (`Flavor_name`,`Crust_Style`,`Size`,`Restaurant_Name`,`Sauce_name`) values ('"+Flavor+"','"+Crust+"',"+Size+",'"+restaurant+"','"+Sauce+"')");
					ResultSet p = statement.executeQuery("select LAST_INSERT_ID()");
					p.next();
					int pizzaid = p.getInt(1);
					statement.executeUpdate("Insert Into `order_pizza` values ("+orderid+","+pizzaid+")");
				}else {
					System.out.println("Invalid choice");
				}
				
			}else {
				System.out.println("Invalid choice");
			}
			
			
			
		}else {
			System.out.println("Invalid choice");
		}
		
	}

	private static String selectCustomer(BufferedReader reader, Statement statement) throws IOException, SQLException {
		System.out.print("Enter customer name:  ");
		String Customer = reader.readLine();
		ResultSet rs = statement.executeQuery("Select * from Customer where Customer_Name = '"+Customer+"'");
		if(rs.next()) {
			// System.out.println(" >> Name:\t\t" + rs.getString(1));
			System.out.println("  * Address:\t" + rs.getString(2));
			System.out.println("  * Phone:\t"+rs.getString(3));
			System.out.print("Is this you? (Yes/No):  ");
			String c = reader.readLine();
			System.out.println();
			if(c.equalsIgnoreCase("Yes")) {
				return Customer;
			}else {
				return selectCustomer(reader, statement);
			}
		} else {
			System.out.println("Customer does not exist!");
			System.out.println();
            return selectCustomer(reader, statement);
		}
	}

	private static String selectRestaurant(BufferedReader reader, Statement statement) throws SQLException, NumberFormatException, IOException {
		ResultSet rs = statement.executeQuery("Select * from Restaurant");
		ArrayList<String> Restaurants = new ArrayList<String>();
		while(rs.next()) {
			Restaurants.add(rs.getString(1));
		}
		System.out.println("***** Restaurant Menu *****");
		for(int i=0; i<Restaurants.size();i++) {
			System.out.println(" [" + (i + 1) + "]" + "\t"+Restaurants.get(i));
		}
		System.out.print("Enter choice:  ");
		int r = ( Integer.parseInt(reader.readLine()) - 1 );
        System.out.println();

		if( r >= 0 && r < Restaurants.size() ) {
			return Restaurants.get(r);
		}else {
			System.out.println("Invalid Selection");
			return selectRestaurant(reader,statement);
		}
	}
	
	private static void executeQuery(BufferedReader reader, Statement statement) throws IOException {
		System.out.print("Enter SQL command:  ");
		String sql = reader.readLine();
		System.out.println();
		try {
			boolean b = statement.execute(sql);
			if(b) {
				ResultSet rs = statement.getResultSet();
				ResultSetMetaData rsmd = rs.getMetaData();
				int columns = rsmd.getColumnCount();
				while(rs.next()) {
					for(int i=0; i< columns;i++) {
						if(i>0) System.out.print(", ");
						System.out.print(rs.getString(i+1));
					}
					System.out.println("");
				}
				System.out.println("");
			}else {
				int count = statement.getUpdateCount();
				if(count>=0) {
					System.out.println(count + " rows affected");
				}else {
					System.out.println("No rows affected");
				}
			}
		}catch(Exception e) {
			System.out.println("Could not execute query");
		}
	}
}
*/

class DBConnection {

  private static final String JDBC_DRIVER = "org.mysql.jdbc.Driver";
  private static final String LOCAL_HOST = "jdbc:mariadb://localhost:3306/";

  private String db;
  private String username;
  private String password;
  private PreparedStatement preparedStatement;
  private Connection connection;

  public DBConnection() {
    this.db = "TravelAgencyDB";
    this.username = "root";
    this.password = "root";
  }

  public DBConnection( String db, String username, String password ) {
    this.db = db;
	this.username = username;
	this.password = password;
  }

  public boolean openConnection( ) {
	  boolean result = false;

    try {
      connection = DriverManager.getConnection( LOCAL_HOST + db, username, password );
      System.out.println( db + " connected." );
      System.out.println();
      
      result = true;
    }
    catch ( SQLException sqle ) {
      sqle.printStackTrace();
    }
    
    return result;
  }
  public ResultSet query( String sql, String args[] ) throws SQLException {
    ResultSet rs = null;
    int i;

    // try {  
    preparedStatement = connection.prepareStatement( sql );
      
    if ( args != null ) {
      for ( i = 0; i < args.length; i++ ) {
        preparedStatement.setString( ( i + 1 ), args[i] );
      }
    }
      
    rs = preparedStatement.executeQuery();
 
    // }
    // catch ( SQLException sqle ) {
    //   sqle.printStackTrace();
    // }

    return rs;
  }
 
  public int update( String sql ) {
    int result = 0;

    try {     
      preparedStatement = connection.prepareStatement( sql );
      result = preparedStatement.executeUpdate();
    }
    catch ( SQLException sqle ) {
      sqle.printStackTrace();
    }

    return result;
  }
  public void closeConnection() {
    try {
      if ( connection != null ) {
        connection.close();
      }
    }
    catch ( SQLException sqle ) {
      sqle.printStackTrace();
    }
  }
  public DatabaseMetaData getDatabaseMetaData() {
	DatabaseMetaData metadata = null;

	try {
	  metadata = connection.getMetaData();
	}
	catch( SQLException sqle ) {
      System.out.println( "Metadata fail." );
	}

    return metadata;	  
  }
}


