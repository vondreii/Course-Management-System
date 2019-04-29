/*
 * SENG2050 - Web Engineers Team
 * AssessmentItem.java - Oct 14, 2017
 *
*/

package nuboardpkg;
import java.util.Date; // for Date type
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.io.*;

public class AssessmentItem
{
    private String assessmentItemID, courseID, itemName, description, specsFileName, markingSchemeFileName;
    private double weight;
    private String dueDate;

    private DatabaseFunctions dbConnection;
    private ArrayList<AssessmentItem> assessmentsList = new ArrayList<AssessmentItem>();

    public AssessmentItem ()
    {
        assessmentItemID = ""; itemName = ""; description = ""; specsFileName = ""; markingSchemeFileName = "";
        weight = 0;
        dueDate = null;

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String toString () {
        return ""; // need toString format
    } // assignment details toString ()

    public String getAssessmentItemID () { return assessmentItemID; }
    public String getCourseID () { return courseID; }
    public String getItemName () { return itemName; }
    public String getDescription () { return description; }
    public String getSpecsFileName () { return specsFileName; }
    public String getMarkingSchemeFileName () { return markingSchemeFileName; }

    public double getWeight () { return weight; }
    public String getDueDate () { return dueDate; }

    public String getIndividualItem()
    {
        return dbConnection.queryDataBase("SELECT * FROM AssessmentItem WHERE assessmentItemID='SENG2050_001'", 6);
    }

    public String getAllAssessmentItems ()
    {
        return dbConnection.queryDataBase("SELECT * FROM AssessmentItem WHERE courseID='SENG2050'", 8);
    }

    public void setAssessmentItem (String assessmentItemID, String courseID, String itemName, double weight, String dueDate, String description, String specsFileName)
    {
        this.assessmentItemID = assessmentItemID;
        this.courseID = courseID;
        this.itemName = itemName;
        this.weight = weight;
        this.dueDate = dueDate;
        this.description = description;
        this.specsFileName = specsFileName;
    }

    public void createAssessmentItem ()
    {
        try {
            Connection connection = dbConnection.getConnection(); String query = "SELECT * FROM AssessmentItem WHERE courseID = '"+courseID+"'";
            PreparedStatement s = connection.prepareStatement(query); ResultSet rs = s.executeQuery();
            while(rs.next()) {
        		AssessmentItem theAssessmentItem = new AssessmentItem ();
                theAssessmentItem.setAssessmentItem(rs.getString("assessmentItemID"),rs.getString("courseID"),rs.getString("itemName"),rs.getInt("weight"),rs.getString("dueDate"),rs.getString("description"),rs.getString("specsFileName"));
        		assessmentsList.add(theAssessmentItem);
        	} s.close(); rs.close(); connection.close();
        	} catch (SQLException e) { System.err.println("Something went wrong when reading table: " + e + "."); }
    }

    public ArrayList<AssessmentItem> getAssessments () { createAssessmentItem(); return assessmentsList; }

    public void setCourseID (String courseID) { this.courseID = courseID; }
    public void setDueDate (String dueDate) { this.dueDate = dueDate; }
    public void setItemName (String itemName) { this.itemName = itemName; }
    public void setMarkingSchemeFileName (String msFileName) { this.markingSchemeFileName = msFileName; }

    public void insertAssessmentItem(String assessmentItemID, String courseID, String itemName, int weight, String dueDateString, String description, String specsFileName)
   {
       dbConnection.alterDataBase("INSERT INTO AssessmentItem VALUES ('"+assessmentItemID+"', '"+courseID+"','"+itemName+"', "+weight+", '"+dueDateString+"', '"+description+"', '"+specsFileName+"', null);");
   }
}
