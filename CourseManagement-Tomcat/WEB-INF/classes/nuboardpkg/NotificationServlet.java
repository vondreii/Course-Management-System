/*
 * SENG2050 - Web Engineers Team
 * NotificationServlet.java - Oct 17, 2017
 *
*/
package nuboardpkg;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/NotificationServlet"})
public class NotificationServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

	}
    public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();
    }

}
