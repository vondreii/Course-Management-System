/*
 * SENG2050 - Web Engineers Team
 * TeacherAssignmentServlet.java - Oct 17, 2017
 *
*/
package nuboardpkg;
import java.io.*;
import java.util.*;
import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.time.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/TeacherAssignmentServlet"})
public class TeacherAssignmentServlet extends HttpServlet {

    /** doGet determines which jsps to redirect the user to, depending on what they are trying to do/view. */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        // Will redirect to the AddAssessmentItem page, which can only be viewed by a staff member.
        // It allows staf members to upload an Assessment Item file.
        if(action.equals("addAssessmentItem"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AddAssessmentItem.jsp");
            dispatcher.forward(request,response);
        }

        // Will direct to GradeCenter.jsp, which is a list of all students and their Assignment submissions
        // for each Assignment, for the course they are currently viewing.
        if(action.equals("viewGradeCenter"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/GradeCenter.jsp");
            dispatcher.forward(request,response);
        }

        // Redirects to DownloadAssignments.jsp, which allows the staff member to download all Assessment Items
        // in GradeCenter, for a particular Assignment.
        if(action.equals("downloadAssignments"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DownloadAssignments.jsp");
            dispatcher.forward(request,response);
        }
	}

    /** doPost - when there is form that requires posting the information, it is captured here. */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        DateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        String action = request.getParameter("action");

        // An Assessment Item file will be uploaded, based on the details the staff member has filled in the form
        if(action.equals("uploadAssessmentItemFile"))
        {
            // These parameters are from the form's input fields (assessmentItemName, description, uploaded file, weight and due date)
            String assessmentItemName = request.getParameter("assessmentItemName");
            String description = request.getParameter("description");
            String assignmentFile = request.getParameter("assignmentFile");
            int weight = Integer.parseInt(request.getParameter("weight"));
            String courseID = request.getParameter("course");

            // The date is retrieved, but is currently not in the correct format to convert to a Date object is java.
            String dueDateString = request.getParameter("dueDate");

            // From the form input field, the format is: 2017-10-05T07:08
            // The following dueDateStringFormat will convert this to: 2016-04-13 22:00:01.0
            String dueDateStringFormat = dueDateString.substring(0, 10) + " " + dueDateString.substring(11, 16) + ":00";

            // Now, the String can be converted into a Date object. A date object is created
            Date dueDate = null;
            try {
                // The dueDateStringFormat String is converted into a date Object (dueDate).
                dueDate = sdf.parse(dueDateStringFormat);
            } catch (ParseException e) { }

            // The assessmentItemID starts with with the courseID of the assessment, "_", and 3 random characters.
            String assessmentItemID = UUID.randomUUID().toString();
			assessmentItemID = courseID + assessmentItemID.substring(0, 3);

            // A new AssessmentItem object is made. It calls a method (that runs a query)
            // that will insert this data into the database.
            AssessmentItem assessmentItem = new AssessmentItem();
            assessmentItem.insertAssessmentItem(assessmentItemID, courseID, assessmentItemName, weight, dueDateString, description, assignmentFile);

            // Redirects back to the Assessments page
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Assessments.jsp");
            dispatcher.forward(request,response);

        }
    }

}
