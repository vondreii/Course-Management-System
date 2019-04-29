/*
 * SENG2050 - Web Engineers Team
 * Course.java - Oct 14, 2017
 *
*/
package nuboardpkg;

import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.io.*;
import java.io.Serializable;

public class Course
{
    private String courseID, courseName;
    private int units; // course units eg. 10 units, 20 units
    private DatabaseFunctions dbConnection;
    private ArrayList<Course> courses = new ArrayList<Course>();

    public Course () {
        courseID = ""; courseName = ""; units = 0;

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }
    //
    public Course (String courseID, String courseName, int units) {
        this.courseID = courseID; this.courseName = courseName; this.units = units;
    }

    public String getCourseID () { return courseID; }
    public String getCourseName () { return courseName; }
    public int getUnits () { return units; }

    public String getAll() {
        return dbConnection.queryDataBase("SELECT * FROM Course", 3);
    }

    // Makes courses read from the database, Course objects
    public void createCourses ()
    {
        try {
            Connection connection = dbConnection.getConnection(); String query = "SELECT * FROM Course";
            PreparedStatement s = connection.prepareStatement(query); ResultSet rs = s.executeQuery();
            while(rs.next()) {
        		Course theCourse = new Course ();
                theCourse.setCourseID(rs.getString("courseID"));
                theCourse.setCourseName(rs.getString("courseName"));
                theCourse.setUnits(rs.getInt("units"));
        		courses.add(theCourse);
        	} s.close(); rs.close(); connection.close();
        	} catch (SQLException e) { System.err.println("Something went wrong when reading table: " + e + "."); }
    }

    public ArrayList<Course> getCourses ()
    {
        createCourses(); return courses;
    }

    public String toString ()
    {
        return courseID + " : " + courseName;
    }

    public void setCourseID (String courseID) { this.courseID = courseID; }
    public void setCourseName (String courseName) { this.courseName = courseName; }
    public void setUnits (int units) { this.units = units; }
}
