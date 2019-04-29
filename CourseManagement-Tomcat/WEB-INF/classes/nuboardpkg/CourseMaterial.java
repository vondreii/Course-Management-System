/*
 * SENG2050 - Web Engineers Team
 * CourseMaterial.java - Oct 14, 2017
 *
*/

package nuboardpkg;

import java.util.*; // for ArrayList
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.io.*;
import java.io.Serializable;

public class CourseMaterial
{
    private String courseMaterialID, courseID, materialTitle, type, filename, resultString;
    private DatabaseFunctions dbConnection;
    private ArrayList<CourseMaterial> materials = new ArrayList<CourseMaterial>();
    private ArrayList<CourseMaterial> lectures = new ArrayList<CourseMaterial>();
    private ArrayList<CourseMaterial> labs = new ArrayList<CourseMaterial>();
    private String parameter = ""; // changes to labs or lectures depending on the page.

    public CourseMaterial ()
    {
        courseMaterialID = "";
        courseID = "";
        materialTitle = "";
        type = "";
        filename = "";

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public void setParameterView (String para) { parameter = para; }
    public String getParameterView () {return parameter; }

    public String getCourseMaterialID () { return courseMaterialID; }
    public String getCourseID () { return courseID; }
    public String getMaterialTitle () { return materialTitle; }
    public String getType () { return type; }
    public String getFilename () { return filename; }

    public void setCourseID (String courseID) { this.courseID = courseID; }
    public void setMaterial (String courseMaterialID, String courseID, String materialTitle, String type, String filename)
    {
        this.courseMaterialID = courseMaterialID;
        this.courseID = courseID;
        this.materialTitle = materialTitle;
        this.type = type;
        this.filename = filename;
    }

    public String getAllLectures() {
        return dbConnection.queryDataBase("SELECT * FROM CourseMaterial WHERE type='Lecture'", 5);
    }

    public String getAllLabs() {
        return dbConnection.queryDataBase("SELECT * FROM CourseMaterial WHERE type='Lab'", 5);
    }

    public void insertCourseMaterial(String courseMaterialID, String courseID, String materialTitle, String type, String filename)
    {
        dbConnection.alterDataBase("INSERT INTO CourseMaterial VALUES ('"+courseMaterialID+"', '"+courseID+"', '"+materialTitle+"', '"+type+"', '"+filename+"');");
    }

    // Makes lectures/labs objects in an ArrayList
    public void createMaterials ()
    {
        try {
            Connection connection = dbConnection.getConnection(); String query = "";
            if (parameter == "Lectures") query = "SELECT * FROM CourseMaterial WHERE courseID='"+this.courseID+"' AND type='Lecture'";
            else query = "SELECT * FROM CourseMaterial WHERE courseID='"+this.courseID+"' AND type='Lab'";
            PreparedStatement s = connection.prepareStatement(query); ResultSet rs = s.executeQuery();
            while(rs.next()) {
                if (parameter == "Lectures") {
                    CourseMaterial theLectureMaterial = new CourseMaterial ();
                    theLectureMaterial.setMaterial(rs.getString("courseMaterialID"),rs.getString("courseID"),rs.getString("materialTitle"),rs.getString("type"),rs.getString("filename"));
                    lectures.add(theLectureMaterial);
                } else  {
                    CourseMaterial theLabMaterial = new CourseMaterial ();
                    theLabMaterial.setMaterial(rs.getString("courseMaterialID"),rs.getString("courseID"),rs.getString("materialTitle"),rs.getString("type"),rs.getString("filename"));
                    labs.add(theLabMaterial);
                }
        	} s.close(); rs.close(); connection.close();
        	} catch (SQLException e) { System.err.println("Something went wrong when reading table: " + e + "."); }
    }

    public ArrayList<CourseMaterial> getMaterials ()
    {
         createMaterials();
         if (parameter == "Lectures") materials = lectures;
         else materials = labs;
         return materials;
    }

}
