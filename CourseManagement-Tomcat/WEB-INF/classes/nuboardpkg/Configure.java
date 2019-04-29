/*
 * SENG2050 - Web Engineers Team
 * Configure.java - Oct 25, 2017
 * To use JDBC
*/

package nuboardpkg;
import javax.sql.*;
import java.sql.*;
import javax.naming.InitialContext;

public class Configure
{
    private static DataSource dataSource;
    private static Connection connection;

    public static DataSource getDataSource ()
    {
        try {
             dataSource = (DataSource)new InitialContext().lookup("java:/comp/env/c3220929_db");
        } catch (Exception e) {
            System.err.println("Something went wrong: " + e + ".");
            // Error executing the SQL query
        }
        return dataSource;
    }

    public static Connection getConnection() throws SQLException
    {
        return getDataSource().getConnection();
    }

}
