/*
 * SENG2050 - Web Engineers Team
 * PeerEvaluationAndGroupServlet.java - Oct 17, 2017
 *
*/
package nuboardpkg;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/PeerEvaluationAndGroupServlet"})
public class PeerEvaluationAndGroupServlet extends HttpServlet {

    /** doGet determines which jsps to redirect the user to, depending on what they are trying to do/view. */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        // Will redirect to CreateGroup.jsp, which will allow the user to create a new group (group name and select list of students)
        if(action.equals("createGroup"))
        {
            // If the Assignment is not yet uploaded, direct them to the peer evaluation page
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CreateGroup.jsp");
            dispatcher.forward(request,response);

            // If it has already been uploaded, let them view their attempt:
            // RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewSubmission.jsp");
            // dispatcher.forward(request,response);
        }

        // Will redirect to SubmitPeerEvaluationForm.jsp or ViewSubmission.jsp
        // Depending on whether the student has submitted their assignment or not
        if(action.equals("viewGroupSubmission"))
        {
            // If the Assignment is not yet uploaded, direct them to the peer evaluation page
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SubmitPeerEvaluationForm.jsp");
            dispatcher.forward(request,response);

            // If it has already been uploaded, let them view their attempt:
            // RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewSubmission.jsp");
            // dispatcher.forward(request,response);
        }

        // Will redirect to GroupPage.jsp, where the user can view their groupname/students in their group.
        if(action.equals("viewGroupPage"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/GroupPage.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to ManageGroups.jsp, where the staff member can view all groups in the course
        if(action.equals("manageGroups"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ManageGroups.jsp");
            dispatcher.forward(request,response);
        }

	}

    /** doPost - when there is form that requires posting the information, it is captured here. */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        // This will submit a new peer evaluation form
        if(action.equals("submitPeerEvaluation"))
        {
            out.println("hello");
        }

        // This will insert a new group into the database
        if(action.equals("insertNewGroup"))
        {
            String groupName = request.getParameter("groupName");

            // The groupID starts with with the courseID of the assessment, "GROUP", and 3 random characters.
            String groupID = UUID.randomUUID().toString();
            groupID = "GROUP" + groupID.substring(0, 3);

            out.println(groupID + ", " + groupName);

            // A new studentGroup object is made. It calls a method (that runs a query)
            // that will insert this data into the database.
            StudentGroup studentGroup = new StudentGroup();
            studentGroup.insertGroup(groupID, groupName);

            // If the currentuser=student, redirects back to the Student Group page
            // RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/GroupPage.jsp");
            // dispatcher.forward(request,response);

            // If the currentuser=staff member, redirects to manage groups
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ManageGroups.jsp");
            dispatcher.forward(request,response);
        }
    }

    public void peerEvaluationContribution()
    {

    }

}
