/*
 * SENG2050 - Web Engineers Team
 * Message.java - Oct 14, 2017
 *
*/

package nuboardpkg;
import java.util.*; // for Date type

public class ChatMessage
{

    private String chatMessageID, chatID, replierStaffNo, replierStudentID, messageContent;
    private Date dateTimePosted;

    DatabaseFunctions dbConnection;

    public ChatMessage ()
    {
        chatMessageID = ""; chatID = ""; replierStaffNo = "";
        replierStudentID = ""; messageContent = "";
        dateTimePosted = null;

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getChatMessageID () { return chatMessageID; }
    public String getChatID () { return chatID; }
    public String getReplierStaffNo () { return replierStaffNo; }
    public String getReplierStudentID () { return replierStudentID; }
    public String getMessageContent () { return messageContent; }
    public Date getDateTimePosted () { return dateTimePosted; }

    public String getAllChatMessages ()
    {
        return dbConnection.queryDataBase("SELECT * FROM ChatMessage", 6);
    }

    public void setMessage (String chatMessageID, String chatID, String replierStaffNo, String replierStudentID, String messageContent, Date dateTimePosted) {
        this.chatMessageID = chatMessageID;
        this.chatID = chatID;
        this.replierStaffNo = replierStaffNo;
        this.replierStudentID = replierStudentID;
        this.messageContent = messageContent;
        this.dateTimePosted = dateTimePosted;
    }

    public void insertChatMessage(String chatMessageID, String chatID, String replierStaffNo, String replierStudentID, String messageContent, String dateTimePosted)
    {
        //'M_35H8II97', 'CH001', NULL, '3220929', 'Message?', '2017-08-18 10:10:20'
        if(replierStaffNo.equals(""))
            dbConnection.alterDataBase("INSERT INTO ChatMessage VALUES ('"+chatMessageID+"', '"+chatID+"', null, '"+replierStudentID+"', '"+messageContent+"', '"+dateTimePosted+"');");
        if(replierStudentID.equals(""))
            dbConnection.alterDataBase("INSERT INTO ChatMessage VALUES ('"+chatMessageID+"', '"+chatID+"', '"+replierStaffNo+"', null, '"+messageContent+"', '"+dateTimePosted+"');");
    }
}
