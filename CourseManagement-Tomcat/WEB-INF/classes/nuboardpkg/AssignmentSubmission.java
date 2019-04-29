/*
 * SENG2050 - Web Engineers Team
 * AssignmentSubmission.java - Oct 14, 2017
 *
*/

package nuboardpkg;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.io.*;
import java.io.Serializable;

public class AssignmentSubmission
{
    private String submissionID, studentID, groupID, assessmentItemID, dateTimeSubmitted;
    private boolean late, grantedExtension; // yes or no
    private double totalPossibleMarks, studentMark;

    private DatabaseFunctions dbConnection;
    private ArrayList<AssignmentSubmission> submissions = new ArrayList<AssignmentSubmission>();

    public AssignmentSubmission ()
    {
        submissionID = "";
        studentID = ""; groupID = "";
        dateTimeSubmitted = "";
        late = false;
        grantedExtension = false;
        totalPossibleMarks = 0;
        studentMark = 0;

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getSubmissionID () { return submissionID; }
    public String getStudentID () { return studentID; }
    public String getGroupID () { return groupID; }
    public String getDateTimeSubmitted () { return dateTimeSubmitted; }
    public boolean isLate () { return late; }
    public boolean isGrantedExtension () { return grantedExtension; }
    public double getTotalPossibleMarks () { return totalPossibleMarks; }
    public double getStudentMark () { return studentMark; }

    public String getSpecificSubmission ()
    {
        return dbConnection.queryDataBase("SELECT * FROM AssignmentSubmission WHERE submissionID='ND74HF93JS'", 8);
    }

    public String getAllSubmissions ()
    {
        return dbConnection.queryDataBase("SELECT * FROM AssignmentSubmission", 10);
    }

    public void setSubmission (String submissionID, String studentID, String groupID, String dateTimeSubmitted, boolean late)
    {
        this.submissionID = submissionID;
        this.studentID = studentID;
        this.groupID = groupID;
        this.dateTimeSubmitted = dateTimeSubmitted;
        this.late = late;
    }

    public void setGrantedExtension (boolean grantedExtension) { this.grantedExtension = grantedExtension; }
    public void setTotalPossibleMarks (double tpm) { this.totalPossibleMarks = tpm; }
    public void setStudentMark (double studentMark) { this.studentMark = studentMark; }

    public void insertSubmission(String submissionID, String assessmentItemID, String groupID, String studentID, String dateTimeSubmitted, boolean isLate, boolean isExtensionGranted, String submissionFile)
    {
        if(studentID.equals(""))
            dbConnection.alterDataBase("INSERT INTO AssignmentSubmission VALUES ('"+submissionID+"', '"+assessmentItemID+"', '"+groupID+"', NULL, '"+dateTimeSubmitted+"', "+isLate+", "+isExtensionGranted+", "+isLate+", "+isExtensionGranted+", '"+submissionFile+"');");
        if(groupID.equals(""))
            dbConnection.alterDataBase("INSERT INTO AssignmentSubmission VALUES ('"+submissionID+"', '"+assessmentItemID+"', NULL, '"+studentID+"', '"+dateTimeSubmitted+"', "+isLate+", "+isExtensionGranted+", "+isLate+", "+isExtensionGranted+", '"+submissionFile+"');");
    }

    // Makes assignment submissions read from the database, AssignmentSubmission objects
    public void createSubmissions ()
    {
        try {
            Connection connection = dbConnection.getConnection(); String query = "SELECT * FROM AssignmentSubmission";
            PreparedStatement s = connection.prepareStatement(query); ResultSet rs = s.executeQuery();
            while(rs.next()) {
        		AssignmentSubmission theSubmission = new AssignmentSubmission ();
                theSubmission.setSubmission(rs.getString("submissionID"),rs.getString("studentID"),rs.getString("groupID"),rs.getString("dateTimeSubmitted"),rs.getBoolean("isLate"));
                theSubmission.setGrantedExtension(rs.getBoolean("isExtensionGranted"));
                theSubmission.setTotalPossibleMarks(rs.getDouble("totalPossibleMark"));
                theSubmission.setStudentMark(rs.getDouble("studentMark"));
        		submissions.add(theSubmission);
        	} s.close(); rs.close(); connection.close();
        	} catch (SQLException e) { System.err.println("Something went wrong when reading table: " + e + "."); }
    }

    public ArrayList<AssignmentSubmission> getSubmissions () { createSubmissions(); return submissions; }
}
