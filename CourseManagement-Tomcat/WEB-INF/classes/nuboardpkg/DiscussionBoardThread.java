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

public class DiscussionBoardThread
{
    private String threadID;
    private String forumID;
    private String staffNo;
    private String studentID;
    private String threadName;
    private String threadPost;
    private String dateThreadStarted;
    private int numOfReplies;
    private ArrayList<DiscussionBoardThread> threads = new ArrayList<DiscussionBoardThread>();

    private DatabaseFunctions dbConnection;

    public DiscussionBoardThread ()
    {
        threadID = ""; forumID = ""; staffNo = "";
        studentID = ""; threadName = ""; threadPost = "";
        dateThreadStarted = null; numOfReplies = 0;

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getThreadID () { return threadID; }
    public String getForumID () { return forumID; }
    public String getStaffNo () { return staffNo; }
    public String getStudentID () { return studentID; }
    public String getThreadName () { return threadName; }
    public String getThreadPost () { return threadPost; }
    public String getDateThreadStarted () { return dateThreadStarted; }
    public int getNumOfReplies () { return numOfReplies; }

    public String getAllThreads ()
    {
        return dbConnection.queryDataBase("SELECT * FROM DiscussionBoardThread", 8);
    }

    public void createThread(String threadID, String forumID, String staffNo, String studentID, String threadName, String threadPost, String started)
    {
        this.threadID = threadID; this.forumID = forumID; this.staffNo = staffNo; this.studentID = studentID;
        this.threadName = threadName; this.threadPost = threadPost; this.dateThreadStarted = started;
    }
    public void setNumOfReplies (int numOfReplies) { this.numOfReplies = numOfReplies; }

    public void insertThread (String threadID, String forumID, String staffNo, String studentID, String threadName, String threadPost, String dateThreadStarted)
    {
        dbConnection.alterDataBase("INSERT INTO DiscussionBoardThread VALUES ('"+threadID+"', '"+forumID+"', '"+staffNo+"', '"+studentID+"', '"+threadName+"', '"+threadPost+"', '"+dateThreadStarted+"', 1);");
    }

    // Makes threads read from the database, DiscussionBoardThread objects
    public void createThreads ()
    {
        try {
            Connection connection = dbConnection.getConnection(); String query = "SELECT * FROM DiscussionBoardThread";
            PreparedStatement s = connection.prepareStatement(query); ResultSet rs = s.executeQuery();
            while(rs.next()) {
        		DiscussionBoardThread theThread = new DiscussionBoardThread ();
                theThread.createThread(rs.getString("threadID"), rs.getString("forumID"), rs.getString("staffNo"), rs.getString("studentID"), rs.getString("threadName"), rs.getString("threadPost"), rs.getString("dateThreadStarted"));
                theThread.setNumOfReplies(rs.getInt("numOfReplies"));
                threads.add(theThread);
        	} s.close(); rs.close(); connection.close();
        	} catch (SQLException e) { System.err.println("Something went wrong when reading table: " + e + "."); }
    }

    public ArrayList<DiscussionBoardThread> getThreads () { createThreads(); return threads; }

}
