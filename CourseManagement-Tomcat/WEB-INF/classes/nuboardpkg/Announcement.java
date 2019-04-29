/*
 * SENG2050 - Web Engineers Team
 * AdverseRequest.java - Oct 14, 2017
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

public class Announcement
{
    private String announcementID, title, content, courseID;
    private DatabaseFunctions dbConnection;
    private ArrayList<Announcement> announcements = new ArrayList<Announcement>();

    public Announcement ()
    {
        announcementID = "";
        title = "";
        content = "";
        courseID = "";

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getAnnouncementID () { return announcementID; }
    public String getTitle () { return title; }
    public String getContent () { return content; }
    public String getCourseID () { return courseID; }

    public void setAnnouncementID (String announcementID) { this.announcementID = announcementID; }
    public void setTitle (String title) { this.title = title; }
    public void setContent (String content) { this.content = content; }
    public void setCourseID (String courseID) { this.courseID = courseID; }

    public void setAnnouncement (String announcementID, String title, String content, String courseID)
    {
        this.announcementID = announcementID;
        this.title = title;
        this.content = content;
        this.courseID = courseID;
    }

    public String getAllAnnouncements() {
        return dbConnection.queryDataBase("SELECT * FROM Announcement", 4);
    }

    public void insertAnnouncement(String announcementID, String title, String courseID, String content)
    {
        dbConnection.alterDataBase("INSERT INTO Announcement VALUES ('"+announcementID+"', '"+title+"', '"+courseID+"', '"+content+"');");
    }

    // Makes announcements read from the database objects
    public void createAnnouncements ()
    {
        try {

            Connection connection = dbConnection.getConnection(); String query = "SELECT * FROM Announcement WHERE courseID='"+this.courseID+"'";
            PreparedStatement s = connection.prepareStatement(query);ResultSet rs = s.executeQuery();
            while(rs.next()) {
                Announcement theAnnouncement = new Announcement ();
                theAnnouncement.setAnnouncement(rs.getString("announcementID"),rs.getString("title"),rs.getString("announcementContent"),rs.getString("courseID"));
                announcements.add(theAnnouncement);
        	} s.close(); rs.close(); connection.close();
        	} catch (SQLException e) { System.err.println("Something went wrong when reading table: " + e + "."); }

    }

    public ArrayList<Announcement> getAnnouncements () { createAnnouncements(); return announcements; }

    public String toString ()
    {
        return title + " : " + content;
    }

}
