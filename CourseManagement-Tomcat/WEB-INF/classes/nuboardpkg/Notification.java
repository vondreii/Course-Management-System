/*
 * SENG2050 - Web Engineers Team
 * FeedbackDiscussionThread.java - Oct 14, 2017
 *
*/

package nuboardpkg;
import java.util.*; // for Date type

public class Notification
{
    private String notificationID;
    private String notification;
    private String staffNo;
    private String studentID;
    private Date dateTimeReceived;

    DatabaseFunctions dbConnection;

    public Notification ()
    {
        notificationID = ""; notification = ""; staffNo = ""; studentID = "";
        dateTimeReceived = null;

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getNotificationID () { return notificationID; }
    public String notification () { return notification; }
    public String staffNo () { return staffNo; }
    public String studentID () { return studentID; }
    public Date getDateTimeRecieved () { return dateTimeReceived; }

    public String getAllNotifications ()
    {
        return "working";
    }

    public void setNotification (String notificationID, String notification, String staffNo, String studentID, Date dateTimeReceived)
    {
        this.notificationID = notificationID; this.notification = notification;
        this.staffNo = staffNo; this.studentID = studentID;
        this.dateTimeReceived = dateTimeReceived;
    }


}
