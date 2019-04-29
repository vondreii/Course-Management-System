/*
 * SENG2050 - Web Engineers Team
 * Student.java - Oct 14, 2017
 *
*/

package nuboardpkg;

public class Student
{
    private String studentID, username, password, firstName, lastName, programCode;

    DatabaseFunctions dbConnection;

    public Student ()
    {
        studentID = ""; username = ""; password = ""; firstName = ""; lastName = ""; programCode = "";

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getStudentID () { return studentID; }
    public String getUsername () { return username; }
    public String getPassword () { return password; }
    public String getFirstName () { return firstName; }
    public String getLastName () { return lastName; }
    public String getProgramCode () { return programCode; }

    public String getAllStudents ()
    {
        return "working";
    }

    public void setStudentID (String studentID) { this.studentID = studentID; }
    public void setUsername (String username) { this.username = username; }
    public void setPassword (String password) { this.studentID = password; }
    public void setName (String firstName, String lastName) { this.firstName = firstName; this.lastName = lastName; }
    public void setProgramCode (String programCode) { this.programCode = programCode; }
}
