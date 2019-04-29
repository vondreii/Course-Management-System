/*
 * SENG2050 - Web Engineers Team
 * Message.java - Oct 14, 2017
 *
*/

package nuboardpkg;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.io.*;
import java.io.Serializable;

public class ThreadReply
{
    private String replyID, threadID, replierStaffNo, replierStudentID, messageContent, dateTimePosted;

    private DatabaseFunctions dbConnection;
    private ArrayList<ThreadReply> threadreplies = new ArrayList<ThreadReply>();

    public ThreadReply ()
    {
        replyID = ""; threadID = ""; replierStaffNo = "";
        replierStudentID = ""; messageContent = "";
        dateTimePosted = null;

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getReplyID () { return replyID; }
    public String getThreadID () { return threadID; }
    public String getReplierStaffNo () { return replierStaffNo; }
    public String getReplierStudentID () { return replierStudentID; }
    public String getMessageContent () { return messageContent; }
    public String getDateTimePosted () { return dateTimePosted; }

    public String getAllThreadReplies ()
    {
        return dbConnection.queryDataBase("SELECT * FROM ThreadReply", 6);
    }

    public void setThreadReply (String replyID, String threadID, String replierStaffNo, String replierStudentID, String messageContent, String dateTimePosted) {
        this.replyID = replyID;
        this.threadID = threadID;
        this.replierStaffNo = replierStaffNo;
        this.replierStudentID = replierStudentID;
        this.messageContent = messageContent;
        this.dateTimePosted = dateTimePosted;
    }

    public void insertReply (String replyID, String threadID, String replierStaffNo, String replierStudentID, String messageContent, String dateTimePosted)
    {
        dbConnection.alterDataBase("INSERT INTO ThreadReply VALUES ('"+replyID+"', '"+threadID+"', '"+replierStaffNo+"', NULL, '"+messageContent+"', '"+dateTimePosted+"');");
    }

    // Makes threads read from the database, DiscussionBoardThread objects
    public void createThreadReplies ()
    {
        try {
            Connection connection = dbConnection.getConnection(); String query = "SELECT * FROM ThreadReply";
            PreparedStatement s = connection.prepareStatement(query); ResultSet rs = s.executeQuery();
            while(rs.next()) {
        		ThreadReply theThreadReply = new ThreadReply ();
                // theThreadReply.createThread(rs.getString("threadID"), rs.getString("forumID"), rs.getString("staffNo"), rs.getString("studentID"), rs.getString("threadName"), rs.getString("threadPost"), rs.getString("dateThreadStarted"));
                // theThreadReply.setNumOfReplies(rs.getInt("numOfReplies"));
                theThreadReply.setThreadReply(rs.getString("replyID"),rs.getString("threadID"),rs.getString("replierStaffNo"),rs.getString("replierStudentID"),rs.getString("messageContent"),rs.getString("dateTimePosted"));
                threadreplies.add(theThreadReply);
        	} s.close(); rs.close(); connection.close();
        	} catch (SQLException e) { System.err.println("Something went wrong when reading table: " + e + "."); }
    }

    public ArrayList<ThreadReply> getThreadReplies () { createThreadReplies(); return threadreplies; }
}
