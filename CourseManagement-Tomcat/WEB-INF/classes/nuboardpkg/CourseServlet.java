/*
 * SENG2050 - Web Engineers Team
 * CourseServlet.java - Oct 25, 2017
 *
*/
package nuboardpkg;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/CourseServlet"})
public class CourseServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        DatabaseFunctions dbConnection = new DatabaseFunctions ();



        // check current use - studentNo
        // get their student enrolment
        // c3220929 math1510
        // c3220929 SENG2050
        // c3197819 math1510
        // c3197819 math1110
        // //
        // c3220929 math1510
        // c3220929 SENG2050
        //
        // [math1510, seng2050]
        //
        // courseID is inside the array

        // doPost(request,response);
        // String username = request.getParameter("name");
        // String course = request.getParameter("course");
        // if (request.isUserInRole("coordinator")) {
        //     RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CourseMenu.jsp?user=coordinator&name="+username+"&course="+course);
        //     dispatcher.forward(request,response);
        // } else if (request.isUserInRole("staff")) {
        //     RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CourseMenu.jsp?user=staff&name="+username+"&course="+course);
        //     dispatcher.forward(request,response);
        // } else if (request.isUserInRole("student")) {
        //     RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CourseMenu.jsp?user=student&name="+username+"&course="+course);
        //     dispatcher.forward(request,response);
        // }

        if (request.isUserInRole("coordinator") || request.isUserInRole("staff") || request.isUserInRole("student")) {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CourseMenu.jsp");
            dispatcher.forward(request,response);
        }
	}
    public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();


    }

}
