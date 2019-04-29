/*
 * SENG2050 - Web Engineers Team
 * Semester.java - Oct 14, 2017
 *
*/

package nuboardpkg;

public class Semester
{
    private String semID;
    private int semester, year;

    DatabaseFunctions dbConnection;

    public Semester ()
    {
        semID = ""; semester = 0; year = 0;

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getsemID () { return semID; }
    public int getSemester () { return semester; }
    public int getYear () { return year; }

    public void setSemID (String semID) { this.semID = semID; }
    public void setSemester (int semester) { this.semester = semester; }
    public void setYear (int year) { this.year = year; }
}
