/*
 * SENG2050 - Web Engineers Team
 * Group.java - Oct 14, 2017
 *
*/
package nuboardpkg;

public class ContributionToGroup
{
    private String formID, studentIDWhoContributed;
    private double contributionGrade;

    DatabaseFunctions dbConnection;

    public ContributionToGroup ()
    {
        formID = ""; studentIDWhoContributed = ""; contributionGrade = 0;

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getFormID () { return formID; }
    public String getStudentIDWhoContributed () { return studentIDWhoContributed; }
    public double getContributionGrade () { return contributionGrade; }

    public String getAllStudentContributions ()
    {
        return "working";
    }

    public void setFormID (String formID) { this.formID = formID; }
    public void setStudentIDWhoContributed (String studentIDWhoContributed) { this.studentIDWhoContributed = studentIDWhoContributed; }
    public void setContributionGrade (double contributionGrade) { this.contributionGrade = contributionGrade; }

}
