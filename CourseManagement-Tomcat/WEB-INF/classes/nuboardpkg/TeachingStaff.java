/*
 * SENG2050 - Web Engineers Team
 * TeachingStaff.java - Oct 14, 2017
 *
*/

package nuboardpkg;

public class TeachingStaff
{
    private String staffNo, numberplate, password, firstName, lastName;

    DatabaseFunctions dbConnection;

    public TeachingStaff ()
    {
        staffNo = ""; numberplate = ""; password = ""; firstName = ""; lastName = "";

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getStaffNo () { return staffNo; }
    public String getNumberPlate () { return numberplate; }
    public String getPassword () { return password; }
    public String getFirstName () { return firstName; }
    public String getLastName () { return lastName; }

    public String getAllTeachingStaff ()
    {
        return "working";
    }

    public void setStaffDetails (String staffNo, String numberplate) { this.staffNo = staffNo; this.numberplate = numberplate; }
    public void setPassword (String password) { this.password = password; }
    public void setName (String firstName, String lastName) { this.firstName = firstName; this.lastName = lastName; }
}
