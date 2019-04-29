/*
 * SENG2050 - Web Engineers Team
 * AdverseRequest.java - Oct 14, 2017
 *
*/

package nuboardpkg;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.io.*;
import java.io.Serializable;

public class AdverseRequest
{
    private String adverseRequestID, assessmentItemID, studentID;
    private String description, attachedMedicalDoc, otherDoc, status;

    private DatabaseFunctions dbConnection;
    private ArrayList<AdverseRequest> adverseRequests = new ArrayList<AdverseRequest>();


    public AdverseRequest ()
    {
        adverseRequestID = "";
        assessmentItemID = "";
        studentID = "";
        description = "";
        attachedMedicalDoc = "";
        otherDoc = "";
        status = "";

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getAdverseRequestID () { return adverseRequestID; }
    public String getAssessmentItemID () { return assessmentItemID; }
    public String getStudentID () { return studentID; }
    public String getDescription () { return description; }
    public String getAttachedMedicalDoc () { return attachedMedicalDoc; }
    public String getOtherDoc () { return otherDoc; }
    public String getStatus () { return status; }
    public void setStatus (String status) { this.status = status; }

    public String getSpecificAdverseRequests ()
    {
        return dbConnection.queryDataBase("SELECT * FROM AdverseRequest WHERE adverseRequestID='ADVRUIU34X'", 5);
    }

    public String getAllAdverseRequests ()
    {
        return dbConnection.queryDataBase("SELECT * FROM AdverseRequest", 7);
    }

    public String getPendingAdverseRequests ()
    {
        return dbConnection.queryDataBase("SELECT * FROM AdverseRequest WHERE status='Pending'", 7);
    }

    public String getRejectedOrAcceptedAdverseRequests ()
    {
        return dbConnection.queryDataBase("SELECT * FROM AdverseRequest WHERE status='Accepted' OR status='Rejected'", 7);
    }

    public void setAdverseRequest (String adReqID, String assessmentItemID,  String studentID, String desc, String attachedMedicalDoc, String otherDoc, String status)
    {
        this.adverseRequestID = adReqID;
        this.assessmentItemID = assessmentItemID;
        this.studentID = studentID;
        this.description = desc;
        this.attachedMedicalDoc = attachedMedicalDoc;
        this.otherDoc = otherDoc;
        this.status = status;
    }

    public void insertAdverseRequest(String adverseRequestID, String assessmentItemID,  String studentID, String description, String medicalFile, String otherFile)
    {
        dbConnection.alterDataBase("INSERT INTO AdverseRequest VALUES ('"+adverseRequestID+"', '"+assessmentItemID+"', '"+studentID+"', '"+description+"', '"+medicalFile+"', '"+otherFile+"', 'Pending');");
    }

    // Makes adverse requests read from the database, AdverseRequest objects
    public void createAdverseRequests ()
    {
        try {
            Connection connection = dbConnection.getConnection(); String query = "SELECT * FROM AdverseRequest";
            PreparedStatement s = connection.prepareStatement(query); ResultSet rs = s.executeQuery();
            while(rs.next()) {
        		AdverseRequest theAdverseRequest = new AdverseRequest ();
                theAdverseRequest.setAdverseRequest(rs.getString("adverseRequestID"), rs.getString("assessmentItemID"), rs.getString("studentID"), rs.getString("description"), rs.getString("attachedMedicalDocs"), rs.getString("otherDocs"), rs.getString("status"));
                adverseRequests.add(theAdverseRequest);
        	} s.close(); rs.close(); connection.close();
        	} catch (SQLException e) { System.err.println("Something went wrong when reading table: " + e + "."); }
    }

    public ArrayList<AdverseRequest> getAdverseRequestList () { createAdverseRequests(); return adverseRequests; }

}
