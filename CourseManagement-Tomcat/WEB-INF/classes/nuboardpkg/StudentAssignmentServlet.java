/*
 * SENG2050 - Web Engineers Team
 * StudentAssignmentServlet.java - Oct 17, 2017
 *
*/
package nuboardpkg;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/StudentAssignmentServlet"})
public class StudentAssignmentServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        if(action.equals("assessments"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Assessments.jsp");
            dispatcher.forward(request,response);
        }

        if(action.equals("viewAssessmentItem"))
        {
            String assessmentItemID = request.getParameter("assessmentItem");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Assessment.jsp?assessmentItem="+assessmentItemID+"");
            dispatcher.forward(request,response);
        }

        if(action.equals("viewGroupAssessment"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/GroupAssessment.jsp");
            dispatcher.forward(request,response);
        }

        if(action.equals("viewSubmission"))
        {
            // If the student has not already submitted the Assignment
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UploadAssessmentItems.jsp");
            dispatcher.forward(request,response);

            // If the student already submitted the Assignment
            //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewSubmission.jsp");
            //dispatcher.forward(request,response);
        }

        if(action.equals("viewGrades"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Grades.jsp");
            dispatcher.forward(request,response);
        }

        // Redirects to DownloadAssignments.jsp, which allows the student to download the Assignment.
        if(action.equals("downloadAssignments"))
        {
            String courseID = request.getParameter("course");
            String name = request.getParameter("assignmentName");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DownloadAssignments.jsp?course="+courseID+"&itemName="+name+"");
            dispatcher.forward(request,response);
        }

	}
    public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        if(action.equals("insertNewSubmission"))
        {
            // Gets the value of the parameters, based on the user's input
            String submissionFile = request.getParameter("submissionFile");
            String assessmentItemID = request.getParameter("assignment");
            String studentID = request.getParameter("student");
            String groupID = request.getParameter("group");

            // The submissionID is a string of 10 random characters
            String submissionID = UUID.randomUUID().toString();
            submissionID = submissionID.substring(0, 10);

            // The current date and time is found (the date/time the forum was created)
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String dateTimeSubmitted = now.format(dtf);

            // TO DO: Get the due date of the Assessment Item.
            // Convert those Strings to Date (Java). check if it is late.

            // A new AssignmentSubmission object is made. It calls a method (that runs a query)
            // that will insert this data into the database.
            AssignmentSubmission submission = new AssignmentSubmission();
            submission.insertSubmission(submissionID, assessmentItemID, groupID, studentID, dateTimeSubmitted, false, false, submissionFile);

            // Redirects to the ViewSubmission page
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewSubmission.jsp");
            dispatcher.forward(request,response);
        }
    }

}
