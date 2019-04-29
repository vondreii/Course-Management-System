/*
 * SENG2050 - Web Engineers Team
 * StudentGroup.java - Oct 14, 2017
 *
*/
package nuboardpkg;

public class StudentGroup
{
    private String groupID, groupName;
    private int numGroupMembers;

    private DatabaseFunctions dbConnection;

    public StudentGroup ()
    {
        groupID = ""; groupName = ""; numGroupMembers=0;

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getGroupID () { return groupID; }
    public String getName () { return groupName; }
    public int getNumGroupMembers () { return numGroupMembers; }

    public String getAllStudentGroups ()
    {
        return dbConnection.queryDataBase("SELECT * FROM StudentGroup", 2);
    }

    public void setGroupID (String groupID) { this.groupID = groupID; }
    public void setGroupPageTitle (String groupPageTitle) { this.groupID = groupPageTitle; }
    public void setGroupName (String groupName) { this.groupID = groupName; }

    public void insertGroup (String groupID, String groupName)
    {
        dbConnection.alterDataBase("INSERT INTO StudentGroup VALUES ('"+groupID+"', '"+groupName+"');");
    }
}
