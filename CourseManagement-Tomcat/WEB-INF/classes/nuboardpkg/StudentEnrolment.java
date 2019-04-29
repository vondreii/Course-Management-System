/*
 * SENG2050 - Web Engineers Team
 * StudentEnrolment.java - Oct 14, 2017
 *
*/

package nuboardpkg;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.io.*;
import java.io.Serializable;

public class StudentEnrolment
{
    private String studentID, semID, courseID, groupID, finalGrade;
    private String dateEnrolled;
    private double cumulativeMark;

    private DatabaseFunctions dbConnection;
    private ArrayList<StudentEnrolment> studentEnrolments = new ArrayList<StudentEnrolment>();

    public StudentEnrolment ()
    {
        studentID = ""; semID = ""; courseID = ""; groupID = ""; finalGrade = "";
        dateEnrolled = null; cumulativeMark = 0;

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String[] getEnrolment () {
        String[] enrolment = new String[3];
        enrolment[0] = studentID; enrolment[1] = semID;
        enrolment[2] = courseID; // enrolment[3] = dateEnrolled;
        return enrolment;
    }
    public String getFinalGrade () { return finalGrade; }
    public String getDateEnrolled () { return dateEnrolled; }
    public double getCumulativeMark () { return cumulativeMark; }
    public String getGroupID () { return groupID; }
    public String getSemID () { return semID; }
    public String getStudentID () { return studentID; }


    public String getAllEnrolments ()
    {
        return "working";
    }

    public void setEnrolment (String studentID, String semID, String courseID, String dateEnrolled)
    {
        this.studentID = studentID;
        this.semID = semID;
        this.courseID = courseID;
        this.dateEnrolled = dateEnrolled;
    }
    public void setStudentID (String studentID) {this.studentID = studentID; }
    public void setGroupID (String groupID) {this.groupID = groupID; }
    public void setFinalGrade (String finalGrade) { this.finalGrade = finalGrade; }
    public void setCumulativeMark (double cumulativeMark) { this.cumulativeMark = cumulativeMark; }

    // Makes threads read from the database, DiscussionBoardThread objects
    public void createStudentEnrolments ()
    {
        try {
            Connection connection = dbConnection.getConnection(); String query = "SELECT * FROM StudentEnrolment WHERE studentID='" + studentID + "'"; // WHERE groupID=" + "'" + groupID + "'
            PreparedStatement s = connection.prepareStatement(query); ResultSet rs = s.executeQuery();
            while(rs.next()) {
        		StudentEnrolment theStudentEnrolments = new StudentEnrolment ();
                theStudentEnrolments.setEnrolment(rs.getString("studentID"), rs.getString("semID"), rs.getString("courseID"), rs.getString("dateEnrolled"));
                theStudentEnrolments.setGroupID(rs.getString("groupID"));
                studentEnrolments.add(theStudentEnrolments);
        	} s.close(); rs.close(); connection.close();
        	} catch (SQLException e) { System.err.println("Something went wrong when reading table: " + e + "."); }
    }

    public ArrayList<StudentEnrolment> getStudentEnrolments () { createStudentEnrolments(); return studentEnrolments; }


}
