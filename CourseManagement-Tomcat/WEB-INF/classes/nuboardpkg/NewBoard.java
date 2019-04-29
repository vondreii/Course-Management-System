/*
 * SENG2050 - Web Engineers Team
 * LoginManagementServlet.java - Oct 17, 2017
 *
*/
package nuboardpkg;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/NewBoard"})
public class NewBoard extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String username = request.getUserPrincipal().getName(); // stores the userID logged in with
        String log = request.getParameter("log");
        String course = request.getParameter("course");

        CurrentUser currentUser = new CurrentUser();
        currentUser.setCurrentUser(username);
        currentUser.setCurrentCourseBeingViewed(course);

        if (log != null) {
            if (log.equals("out")) {
                // out.println(request.getParameter("log"));
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/logout.jsp?user=" + username);
                dispatcher.forward(request,response);
                request.getSession(false).invalidate();
            }
        }

        if (request.isUserInRole("coordinator")) {
            doPost(request,response);
        } else if (request.isUserInRole("staff")) {
            doPost(request,response);
        } else if (request.isUserInRole("student")) {
            doPost(request,response);
        }

	}
    public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String username = request.getUserPrincipal().getName(); // stores the userID logged in with

        String log = request.getParameter("log");
        String course = request.getParameter("course");

        if (log != null) {
            if (log.equals("out")) {
                // out.println(request.getParameter("log"));
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/logout.jsp?user=" + username);
                dispatcher.forward(request,response);
                request.getSession(false).invalidate();
            }
        }

        CurrentUser currentUser = new CurrentUser();
        currentUser.setCurrentUser(username);
        currentUser.setCurrentCourseBeingViewed(course);


        if (request.isUserInRole("coordinator")) {
            currentUser.setRole("coordinator");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp?user=coordinator&course=" + course + "name="+ username);
            dispatcher.forward(request,response);
        } else if (request.isUserInRole("staff")) {
            currentUser.setRole("staff");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp?user=staff&course=" + course + "name="+ username);
            dispatcher.forward(request,response);
        } else if (request.isUserInRole("student")) {
            currentUser.setRole("student");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp?user=student&course=" + course + "name="+ username);
            dispatcher.forward(request,response);
        }

    }

    public boolean isStudentInDatabase (String username) // method name was findStudentBasedOnUserName
    {
        return true;// code to find student in database
    }

    public boolean isMatchingPassword (String password) // method name was validatePassword
    {
        return true;// code to check if password is associated with username
    }


}
