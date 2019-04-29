/*
 * SENG2050 - Web Engineers Team
 * AdverseRequestServlet.java - Oct 17, 2017
 *
*/
package nuboardpkg;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/AdverseRequestServlet"})
public class AdverseRequestServlet extends HttpServlet {

    /** doGet determines which jsps to redirect the user to, depending on what they are trying to do/view. */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        // Will redirect to AdverseCircumstances.jsp, which will display a menu for the student to
        // apply for adverse or view their current application
        if(action.equals("adverseCircumstances"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdverseCircumstances.jsp");
            dispatcher.forward(request,response);
        }

        // Will direct them to ApplyForAdverse.jsp, which displays a form for the student to fill in their adverse request
        if(action.equals("applyAdverse"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ApplyForAdverse.jsp");
            dispatcher.forward(request,response);
        }

        // Will direct them to ViewAdverseApplication.jsp, where the student can view the application they submitted
        // for a particular Assignment.
        if(action.equals("viewAdverse"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewAdverseApplication.jsp");
            dispatcher.forward(request,response);
        }

        // Will direct them to ListOfAdverseApplications.jsp, which can only be viewed by coordinators.
        // It shows directs the coordinator to either display pending applications, or accepted/rejected applications.
        if(action.equals("viewAdverseApplications"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListOfAdverseApplications.jsp");
            dispatcher.forward(request,response);
        }

        // Will direct them to PendingApplications.jsp, which displays a list of pending applications.
        if(action.equals("viewPending"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PendingApplications.jsp");
            dispatcher.forward(request,response);
        }

        // Will direct them to AcceptedOrRejectedApplications.jsp,which will display a list of rejected applications.
        if(action.equals("viewAcceptedOrRejected"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AcceptedOrRejectedApplications.jsp");
            dispatcher.forward(request,response);
        }

	}

    /** doPost - when there is form that requires posting the information, it is captured here. */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        if(action.equals("uploadAdverseRequest"))
        {
            // Gets the value of the parameters, based on the user's input
            String description = request.getParameter("description");
            String medicalFile = request.getParameter("medicalFile");
            String otherFile = request.getParameter("otherFile");
            String studentID = request.getParameter("student");
            String assessmentItemID = request.getParameter("assignment");

            // The adverseRequestID starts with with "ADVR" and 6 random characters.
            String adverseRequestID = UUID.randomUUID().toString();
			adverseRequestID = "ADVR" + adverseRequestID.substring(0, 6);

            // A new AdverseRequest object is made. It calls a method (that runs a query)
            // that will insert this data into the database.
            AdverseRequest adverseRequest = new AdverseRequest();
            adverseRequest.insertAdverseRequest(adverseRequestID, assessmentItemID, studentID, description, medicalFile, otherFile);

            // Redirects back to the ViewAdverseApplication page
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdverseCircumstances.jsp");
            dispatcher.forward(request,response);

        }

    }

}
