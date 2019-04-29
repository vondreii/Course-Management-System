/*
 * SENG2050 - Web Engineers Team
 * PeerEvaluationForm.java - Oct 14, 2017
 *
*/

package nuboardpkg;
import java.util.*; // for Date type and ArrayList

public class PeerEvaluationForm
{
    private String formID, formName;
    private ArrayList<Double> contributionGradesStudents;

    private DatabaseFunctions dbConnection;
    private ArrayList<PeerEvaluationForm> evaluationForms = new ArrayList<PeerEvaluationForm>();

    public PeerEvaluationForm ()
    {
        formID = ""; formName = "";
        contributionGradesStudents = new ArrayList<Double>();

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getformID () { return formID; }
    public String getformName () { return formName; }
    public ArrayList<Double> getContributionGradesStudents () { return contributionGradesStudents; }

    public String getAllPeerEvaluationForms ()
    {
        return "working";
    }

    public void setForm (String formID, String formName, ArrayList<Double> contributionGradesStudents) { //
        this.formID = formID;
        this.formName = formName;
        this.contributionGradesStudents = contributionGradesStudents;
    }

    // Makes threads read from the database, DiscussionBoardThread objects
    /*public void createEvaluationForms ()
    {
        try {
            Connection connection = dbConnection.getConnection(); String query = "SELECT * FROM PeerEvaluationForm WHERE formID=" + "'"formID"'";
            PreparedStatement s = connection.prepareStatement(query); ResultSet rs = s.executeQuery();
            while(rs.next()) {
        		PeerEvaluationForm theEvaluationForms = new PeerEvaluationForm ();
                theEvaluationForms.createThread(rs.getString("formID"), rs.getString("formName"));
                theEvaluationForms.setNumOfReplies(rs.getInt("numOfReplies"));
                evaluationForms.add(theEvaluationForms);
        	} s.close(); rs.close(); connection.close();
        	} catch (SQLException e) { System.err.println("Something went wrong when reading table: " + e + "."); }
    }

    public ArrayList<PeerEvaluationForm> getEvaluationForms () { createEvaluationForms(); return evaluationForms; }*/
}
