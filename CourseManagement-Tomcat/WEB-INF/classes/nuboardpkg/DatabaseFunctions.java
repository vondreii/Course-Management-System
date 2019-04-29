/*
 * SENG2050 - Web Engineers Team
 * DatabaseFunctions.java - Oct 14, 2017
 *
*/

package nuboardpkg;

import java.util.*; // for ArrayList
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.io.*;
import java.io.Serializable;

public class DatabaseFunctions
{
    private String announcementID, content, staffID;

    private String resultString;
    private Connection connection;
    private Statement stmt;
    private ResultSet results;
    private int success;
	private int numOfRows;

    public DatabaseFunctions ()
    {
        resultString = ""; connection = null; stmt = null;
        results = null; success = 0;

        connectToDB();
    }

    /** MySQLURL = "jdbc:mysql://teachdb/c[YOUR_STUDENT_NUMBER]_db"; // {teachdb = uni}
        MySQLURL = "jdbc:mysql://localhost:30001/c[YOUR_STUDENT_NUMBER]_db"; // {localhost:30001 = home}
        'username' and 'password' should match 'context.xml'
    */

    /** Makes a connection to a uni database
    */
    public void connectToDB() {
        try {
            // Gets the driver (mySql)
            Class.forName("com.mysql.jdbc.Driver");

            // URL to connect to the database
            String MySQLURL = "jdbc:mysql://teachdb/c3220929_db";

            // Username and password to connect to the database
            String username = "c3220929";
            String password = "020296";

            // A connection is made between the database and the NuBoard Application
            connection = DriverManager.getConnection(MySQLURL, username, password);

            // Based on the connection, a statement object is created so that queries can be return
            // Such as SELECT * FROM 'Something'
            stmt = connection.createStatement();

        } catch (ClassNotFoundException cnfe) {
            resultString += "Class not found";
        } catch (Exception e) {
            resultString += "Could not connect to database";
        }
    }

    /** This method allows you to make SQL statements that can alter the database.
        For example, INSERT, UPDATE, DELETE, ALTER, etc.
    */
    public void alterDataBase(String query)
    {
        try{
            // Whatever the String the user passes in as an argument, will be used, For example:
            // stmt.executeUpdate("INSERT INTO Something VALUES ('Hello');")
            success = stmt.executeUpdate(query);
        } catch (Exception e) {
                resultString += "Something went wrong when altering the database: " + e;
        }
    }

    /** This method allows you to make SQL statements that can query (collect data from) the database.
        For example, SELECT * FROM Something WHERE Something = 'Something'
    */
    public String queryDataBase(String query, int numberOfColumns)
    {
		// Variable to count the number of rows
		numOfRows = 0;

        // resultString is a String that returns all data in the database
        resultString = "";
        try{
            // stmt.executeQuery(query) is the line that executes the query.
            // For example, stmt.executeQuery("SELECT * FROM Hello");
            // results will return the results set of the query.
            results = stmt.executeQuery(query);

            // For each entry/record (or row in the table)
            while(results.next()) {
                // Loop for number of columns
                for(int i=1; i<numberOfColumns+1; i++)
                {
                    // Each data for the column is added to the resultsString
                    // (resultsString) is the String that will display the data.
                    resultString += results.getString(i) + " ";
                }
				numOfRows++;
            }
        } catch (Exception e) {
                resultString += "Something went wrong with retrieving data: " + e;
        }
        // Returns the data of the query
        return resultString;
    }

    /** Gets the connection to the database */
    public Connection getConnection()
    {
        return connection;
    }

    /** Gets the number of rows in the database */
	public int getNumOfRows () { return numOfRows; }

}
