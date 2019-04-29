/*
 * SENG2050 - Web Engineers Team
 * ChatBox.java - Oct 14, 2017
 *
*/

package nuboardpkg;

public class ChatBox
{
    private String chatID;
    private int numOfMessages;

    DatabaseFunctions dbConnection;

    public ChatBox ()
    {
        chatID = ""; numOfMessages = 0;
        
        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getChatID () { return chatID; }
    public int getNumOfMessages () { return numOfMessages;}

    public void setChatID (String chatID) { this.chatID = chatID; }
    public void setNumOfMessages (int numOfMessages) { this.numOfMessages = numOfMessages; }
}
