/*
 * SENG2050 - Web Engineers Team
 * TeachingStaffCourseAllocation.java - Oct 14, 2017
 *
*/
package nuboardpkg;

public class TeachingStaffCourseAllocation
{
    private String staffNo, courseID, semID, position;

    public TeachingStaffCourseAllocation () { staffNo = ""; courseID = ""; semID = ""; position = ""; }

    public String getStaffNo () { return staffNo; }
    public String getCourseID () { return courseID; }
    public String getSemID () { return semID; }
    public String getPosition () { return position; }

    public void allocateStaffToCourse (String staffNo, String courseID, String semID, String position)
    {
        this.staffNo = staffNo;
        this.courseID = courseID;
        this.semID = semID;
        this.position = position;
    }
}
