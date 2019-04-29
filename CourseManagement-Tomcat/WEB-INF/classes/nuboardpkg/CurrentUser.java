/*
 * SENG2050 - Web Engineers Team
 * CurrentUser.java - Oct 14, 2017
 *
*/

package nuboardpkg;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.io.*;
import java.io.Serializable;

public class CurrentUser
{
    private String currentUser, currentCourseBeingViewed, role, pageBeingRefreshed;
    private String asssessmentItemBeingViewed, group;
    private boolean tryingToRefresh;

    private DatabaseFunctions dbConnection;

    public CurrentUser ()
    {
        currentUser = ""; currentCourseBeingViewed = ""; role = "";
        asssessmentItemBeingViewed = "";
        group = "";
        tryingToRefresh = false;
        pageBeingRefreshed = "";

        dbConnection = new DatabaseFunctions();
        dbConnection.connectToDB();
    }

    public String getCurrentUser () { return currentUser; }
    public String getCurrentCourseBeingViewed () { return currentCourseBeingViewed; }
    public String getRole () { return role; }
    public boolean getTryingToRefresh () { return tryingToRefresh; }
    public String getPageBeingRefreshed () { return pageBeingRefreshed; }
    public String getAsssessmentItemBeingViewed () { return asssessmentItemBeingViewed; }
    public String getGroup () { return group; }

    public void setCurrentUser(String currentUser) { this.currentUser = currentUser; }
    public void setCurrentCourseBeingViewed(String currentCourseBeingViewed) { this.currentCourseBeingViewed = currentCourseBeingViewed;}
    public void setRole(String role) { this.role = role; }
    public void setGroup(String group) { this.group = group; }
    public void setTryingToRefresh(boolean tryingToRefresh) { this.tryingToRefresh = tryingToRefresh; }
    public void setPageBeingRefreshed(String pageBeingRefreshed) { this.pageBeingRefreshed = pageBeingRefreshed; }
    public void setAsssessmentItemBeingViewed(String asssessmentItemBeingViewed) { this.asssessmentItemBeingViewed = asssessmentItemBeingViewed; }
}
