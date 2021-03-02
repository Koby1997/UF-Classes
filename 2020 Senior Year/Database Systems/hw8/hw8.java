/*
Koby Miller
Section number: 11207
Assignment number: 8
Date due: 4/6/2020
*/

import java.util.Scanner;
import java.sql.*;


class TravelAgencyDriver
{
    public static void main( String args[] )
    {
        OurTravelAgency ota = new OurTravelAgency();
        ota.menu();
    }
}


class OurTravelAgency
{
    Scanner get = new Scanner(System.in);

    Connection connection;
    ResultSet rs;
    ResultSetMetaData rsmd;
    Statement statement;

    private String JDBC_DRIVER = "org.mysql.jdbc.Driver";
    private String LOCAL_HOST = "jdbc:mariadb://localhost:3306/";

    private String username;
    private String database;
    private String password;
    public OurTravelAgency()
    {
        database = "TravelAgencyDB";
        username = "root";
        password = "root";
    }
    public OurTravelAgency( String database, String username, String password )
    {
        this.database = database;
        this.username = username;
        this.password = password;
    }
    public void menu()
    {
    // implement your menu

        try
        {
            connection = DriverManager.getConnection( LOCAL_HOST + database, username, password );
            System.out.println( database + " connected." );
            System.out.println();

            boolean exit = false;
            String sql;
            int tableNumber;
            String tableName;
            String attributes;
            while(!exit)
            {
                System.out.print("***** Main Menu *****" + "\n" + 
                                    "  (a) Execute SQL Query" + "\n" + 
                                    "  (b) View Tables" + "\n" + 
                                    "  (c) Quit" + "\n" +
                                    "Enter choice: ");
                char command = get.next().charAt(0);
                System.out.println();

                if(command == 'a')//Execute a complete SQL command
                {
                    System.out.print("Enter an SQL Query: ");
                    get.nextLine();//eating up the \n
                    sql = get.nextLine();

                    statement = connection.createStatement();
                    rs = statement.executeQuery( sql );
                    rsmd = rs.getMetaData();
                    System.out.println();
                    try
                    {
                        String columns = "( ";
                        for(int i = 1; i <= rsmd.getColumnCount(); i++)//just to print Column names first
                        {
                            columns = columns + rsmd.getColumnName(i);
                            if(i == rsmd.getColumnCount())
                            {
                                columns = columns + " )";
                            }
                            else
                            {
                                columns = columns + ",  ";
                            }
                        }
                        System.out.println(columns);
                        System.out.println();

                        
                        while(rs.next())
                        {
                            columns = "( ";
                            for(int i = 1; i <= rsmd.getColumnCount(); i++)
                            {
                                columns = columns + rs.getString(i);
                                if(i == rsmd.getColumnCount())
                                {
                                    columns = columns + " )";
                                }
                                else
                                {
                                    columns = columns + ",  ";
                                }
                            }
                            System.out.println(columns);
                        }
                        System.out.println();
                    }
                    catch ( SQLException sqle ) {}
                    System.out.println();
                }
                else if(command == 'b')//View Data
                {
                    boolean badAttributes = true;
                    while(badAttributes)
                    {
                        System.out.println("***** Table Menu *****");  
                        System.out.println("  (0)  Return to Main Menu");

                        sql = "SHOW TABLES;";
                        statement = connection.createStatement();
                        rs = statement.executeQuery( sql );
                        rsmd = rs.getMetaData();
                        try
                        {   int count = 1;
                            while(rs.next())
                            {
                                System.out.println( "  (" + count + ")  " + rs.getString(1));
                                count++;
                            }
                            System.out.print("Enter a selection:  ");
                        }
                        catch ( SQLException sqle ) {}
                        
                        rs = statement.executeQuery( sql );
                        tableNumber = get.nextInt();
                        if(tableNumber == 0)
                        {
                            System.out.println("Returning to Main Menu\n");
                            badAttributes = false;
                        }
                        else
                        {
                            sql = "SHOW TABLES;";
                            statement = connection.createStatement();
                            rs = statement.executeQuery( sql );
                            rsmd = rs.getMetaData();
                            try
                            {   int count = 0;
                                while((count != tableNumber) && rs.next())
                                {
                                    rs.getString(1);
                                    count++;
                                }
                            }
                            catch ( SQLException sqle ) {}


                            tableName = rs.getString(1);
                            sql = "SELECT COLUMN_NAME " +
                            "FROM INFORMATION_SCHEMA.COLUMNS " +
                            "WHERE TABLE_NAME = '" + tableName + "' ORDER BY ORDINAL_POSITION";
                            rs = statement.executeQuery( sql );
                            System.out.println();
                            System.out.println("***** " + tableName + " Attributes *****");
                            try
                            {
                                while(rs.next())
                                {
                                    System.out.println(" * " + rs.getString(1));
                                }
                            }
                            catch ( SQLException sqle ) {}

                            System.out.print("Enter Attributes [comma separated]:  ");
                            get.nextLine(); //eats up the \n left by the last scan
                        
                            try
                            {
                                attributes = get.nextLine();
                                sql = ("SELECT " + attributes + " FROM " + tableName + ";");
                                rs = statement.executeQuery( sql );
                                rsmd = rs.getMetaData();
                                System.out.println();
                                System.out.println("Query Results:");
                                System.out.println();
                                String columns = "( ";
                                for(int i = 1; i <= rsmd.getColumnCount(); i++)//just to print Column names first
                                {
                                    columns = columns + rsmd.getColumnName(i);
                                    if(i == rsmd.getColumnCount())
                                    {
                                        columns = columns + " )";
                                    }
                                    else
                                    {
                                        columns = columns + ",  ";
                                    }
                                }
                                System.out.println(columns);
                                System.out.println();

                                while(rs.next())
                                {
                                    columns = "( ";
                                    for(int i = 1; i <= rsmd.getColumnCount(); i++)
                                    {
                                        columns = columns + rs.getString(i);
                                        if(i == rsmd.getColumnCount())
                                        {
                                            columns = columns + " )";
                                        }
                                        else
                                        {
                                            columns = columns + ",  ";
                                        }
                                    }
                                    System.out.println(columns);
                                }
                            System.out.println();
                            badAttributes = false;
                            }
                            catch ( SQLSyntaxErrorException sqle )
                            {
                                System.out.println();
                                System.out.println("Error:  Invalid Attribute");
                                System.out.println("Enter Only Attributes from those Listed");
                            }
                        }
                        System.out.println();
                    }
                }
                else if(command == 'c')//exiting
                {
                    System.out.println("Closing connection and ending program");
                    connection = null;
                    exit = true;
                }
                else
                {
                    System.out.println("ERROR: Incorrect command. Please try again.");
                    System.out.println();
                }
            }

            if ( connection != null ) {
                connection.close();
            }

        }
        catch ( SQLException sqle )
        {
            sqle.printStackTrace();
        }  
    }
    // implement other methods as needed
}
// implement other classes as needed