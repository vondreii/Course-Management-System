/*
 * SENG2050 - Web Engineers Team
 * FeedbackDiscussionThread.java - Oct 14, 2017
 *
*/

package nuboardpkg;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.io.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DiscussionBoardForum
{
    private String forumID;
    private String courseID;
    private String forumName;
    private String forumDescription;
    private String dateForumStarted;
    private int numOfReplies;
    private DatabaseFunctions dbConnection;
    private ArrayList<DiscussionBoardForum> forums = new ArrayList<DiscussionBoardForum>();

    public DiscussionBoardForum ()
    {
        forumID = ""; courseID = ""; forumName = ""; forumDescription = "";
        dateForumStarted = ""; numOfReplies = 0;

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public void setCourseID (String courseID) { this.courseID = courseID; }
    public String getForumID () { return forumID; }
    public String getCourseID () { return courseID; }
    public String getForumName () { return forumName; }
    public String getForumDescription () { return forumDescription; }
    public String getDateForumStarted () { return dateForumStarted; }
    public int getNumOfReplies () { return numOfReplies; }

    public String getAllForums ()
    {
        return dbConnection.queryDataBase("SELECT * FROM DiscussionBoardForum", 6);
    }

    public void createForum (String forumID, String courseID, String forumName, String forumDescription, String dateForumStarted)
    {
        this.forumID = forumID; this.courseID = courseID; this.forumName = forumName;
        this.forumDescription = forumDescription; this.dateForumStarted = dateForumStarted;
    }
    public void setNumOfReplies () { this.numOfReplies = numOfReplies; }

    public void insertForum (String forumID, String courseID, String forumName, String dateForumStarted, String forumDescription)
    {
        dbConnection.alterDataBase("INSERT INTO DiscussionBoardForum VALUES ('"+forumID+"', '"+courseID+"', '"+forumName+"', '"+dateForumStarted+"', 0, '"+forumDescription+"');");
    }

    // Makes forums read from the database, DiscussionBoardForum objects
    public void createForums ()
    {
        try {
            Connection connection = dbConnection.getConnection(); String query = "SELECT * FROM DiscussionBoardForum";
            PreparedStatement s = connection.prepareStatement(query); ResultSet rs = s.executeQuery();
            while(rs.next()) {
        		DiscussionBoardForum theForum = new DiscussionBoardForum ();
                theForum.createForum(rs.getString("forumID"), rs.getString("courseID"), rs.getString("forumName"), rs.getString("description"), rs.getString("dateForumStarted"));
                forums.add(theForum);
        	} s.close(); rs.close(); connection.close();
        	} catch (SQLException e) { System.err.println("Something went wrong when reading table: " + e + "."); }
    }

    public ArrayList<DiscussionBoardForum> getForums () { createForums(); return forums; }

}
