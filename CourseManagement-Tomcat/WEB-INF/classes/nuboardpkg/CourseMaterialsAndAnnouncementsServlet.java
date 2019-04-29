/*
 * SENG2050 - Web Engineers Team
 * CourseMaterialsAndAnnouncementsServlet.java - Oct 17, 2017
 *
*/
package nuboardpkg;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/CourseMaterialsAndAnnouncementsServlet"})
public class CourseMaterialsAndAnnouncementsServlet extends HttpServlet {

    /** doGet determines which jsps to redirect the user to, depending on what they are trying to do/view. */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        Announcement courseAnnouncements = new Announcement ();


        // Will redirect to the ViewAnnouncements page, where the user views a list of all announcements
        // for the course they are currently viewing.
        if(action.equals("viewAnnouncements"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewAnnouncements.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to the CreateAnnouncement page, (which can only be accessed by staff), where a new Announcement
        // can be created in the database
        if(action.equals("createAnnouncement"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CreateAnnouncement.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to the viewCourseMaterials page, where the user views a list of all lectures/labs
        // for the course they are currently viewing.
        if(action.equals("viewCourseMaterials"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CourseMaterials.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to the viewLectures page, where the user views only the lectures.
        if(action.equals("viewLectures"))
        {
            // CourseMaterial viewMaterial = new CourseMaterial();
            // viewMaterial.setParameterView("Lectures");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewLectures.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to the addLecture page, where a staff member can add a lecture
        if(action.equals("addLecture"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AddLecture.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to the ViewLabs page, where the user views only the labs..
        if(action.equals("viewLabs"))
        {
            // CourseMaterial viewMaterial = new CourseMaterial();
            // viewMaterial.setParameterView("Labs");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewLabs.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to the addLecture page, where a staff member can add lab exercises
        if(action.equals("addLab"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AddLab.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to the echo page, where the user can view echo recordings (not implemented)
        // (Echo.jsp is empty and only meant to represent a real echo page)
        if(action.equals("viewEchoPage"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Echo.jsp");
            dispatcher.forward(request,response);
        }
	}

    /** doPost - when there is form that requires posting the information, it is captured here. */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        // If the parameter passes 'insertNewAnnouncement', it means that the system now has to create a new announcement
        // and save it in the database.
        if(action.equals("insertNewAnnouncement"))
        {
            // These parameters are from the form's input fields (title, which is the subject line of the announcement)
            // and the announcement message itself.
            String title = request.getParameter("announcementTitle");
            String content = request.getParameter("announcementContent");
            String courseID = request.getParameter("course");

            // The announcementID starts with 'ANN' and 5 random characters are added to the string.
            String announcementID = UUID.randomUUID().toString();
			announcementID = "ANN" + announcementID.substring(0, 5);

            // A new announcement object is made. It calls a method (that runs a query)
            // that will insert this data into the database.
            Announcement announcement = new Announcement();
            announcement.insertAnnouncement(announcementID, title, courseID, content.trim());

            // Redirects back to the ViewAnnouncements page
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewAnnouncements.jsp");
            dispatcher.forward(request,response);
        }

        if(action.equals("insertNewLab"))
        {
            // These parameters are from the form's input fields (file and title)
            String title = request.getParameter("labTitle");
            String file = request.getParameter("labFile");
            String courseID = request.getParameter("course");

            // The courseMaterialID starts with 'CMID' and 4 random characters are added to the string.
            String courseMaterialID = UUID.randomUUID().toString();
			courseMaterialID = "CMID" + courseMaterialID.substring(0, 4);

            // A new CourseMaterial object is made. It calls a method (that runs a query)
            // that will insert this data into the database.
            CourseMaterial courseMaterial = new CourseMaterial();
            courseMaterial.insertCourseMaterial(courseMaterialID, courseID, title, "Lab", file);

            // Redirects back to the ViewLabs page
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewLabs.jsp");
            dispatcher.forward(request,response);
        }

        if(action.equals("insertNewLecture"))
        {
            // These parameters are from the form's input fields (file and title)
            String title = request.getParameter("lectureTitle");
            String file = request.getParameter("lectureFile");
            String courseID = request.getParameter("course");

            // The courseMaterialID starts with 'CMID' and 4 random characters are added to the string.
            String courseMaterialID = UUID.randomUUID().toString();
			courseMaterialID = "CMID" + courseMaterialID.substring(0, 4);

            // A new CourseMaterial object is made. It calls a method (that runs a query)
            // that will insert this data into the database.
            CourseMaterial courseMaterial = new CourseMaterial();
            courseMaterial.insertCourseMaterial(courseMaterialID, courseID, title, "Lecture", file);

            // Redirects back to the ViewLabs page
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewLectures.jsp");
            dispatcher.forward(request,response);
        }
    }

}
