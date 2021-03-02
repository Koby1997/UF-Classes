/***********
 * 
 *  MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;
 * 
 * download and place on your java classpath:
 * [Canvas Modules/Week #1/MariaDB] mariadb-java-client-2.2.3.jar
 * 
 ***********/

import java.sql.*;

class SimpleJDBC {
  public static void main(String[] args) {
    Connection connection;
    ResultSet rs;
    Statement statement;

    String JDBC_DRIVER = "org.mysql.jdbc.Driver";
    String LOCAL_HOST = "jdbc:mariadb://localhost:3306/";
    String db = "sample";
    String username = "root";
    String password = "root";
    String sql = "SELECT * FROM Beers;";

    try {

      connection = DriverManager.getConnection( LOCAL_HOST + db, username, password );
      System.out.println( db + " connected." );
      System.out.println();


      statement = connection.createStatement();
      rs = statement.executeQuery( sql );


      while ( rs.next() ) {
        System.out.println( "( " + rs.getString( "name" ) + ", " + rs.getInt( "Calories" ) + " ) " );
      }
      System.out.println( "That's all the Beers folks!" );
      System.out.println();
      

      if ( connection != null ) {
        connection.close();
      }

    }
    catch ( SQLException sqle ) {
      sqle.printStackTrace();
    }
  }
}
