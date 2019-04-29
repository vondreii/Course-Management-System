/*
 * SENG2050 - Web Engineers Team
 * DiscussionChatServlet.java - Oct 17, 2017
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

@WebServlet(urlPatterns = {"/DiscussionChatServlet"})
public class DiscussionChatServlet extends HttpServlet {

    /** doGet determines which jsps to redirect the user to, depending on what they are trying to do/view. */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        // Will redirect to DiscussionBoard.jsp, which will show a list of forums
        if(action.equals("discussionBoard"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DiscussionBoard.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to ViewForum.jsp, which will open the forum and show a list of threads
        if(action.equals("viewForum"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewForum.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to CreateForum.jsp, where the staff member can create a new forum for students
        // to post threads in
        if(action.equals("createForum"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CreateForum.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to ViewThread.jsp, where the user can view individual threads and the replies in the thread
        if(action.equals("viewThread"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewThread.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to CreateThread.jsp, where any user can create a thread
        if(action.equals("createThread"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CreateThread.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to ReplyToThread.jsp, where anyone can reply to a thread
        if(action.equals("replyToThread"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ReplyToThread.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to Chat.jsp, where a user can chat with another user
        if(action.equals("chat"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Chat.jsp");
            dispatcher.forward(request,response);
        }

        // Will redirect to individualChatBox.jsp, where the student/staff member can have an individual chat with another member
        if(action.equals("viewChatWithMember"))
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/IndividualChatBox.jsp");
            dispatcher.forward(request,response);
        }

	}

    /** doPost - when there is form that requires posting the information, it is captured here. */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        // Inserts a new forum based on the details filled in the form
        if(action.equals("insertNewForum"))
        {
            // Gets the value of the parameters, based on the user's input
            String forumName = request.getParameter("forumName");
            String forumDescription = request.getParameter("forumDescription");
            String courseID = request.getParameter("course");

            // The forumID starts with with "FORUM", and 3 random characters.
            String forumID = UUID.randomUUID().toString();
			forumID = "FORUM" + forumID.substring(0, 4);

            // The current date and time is found (the date/time the forum was created)
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String dateTimePosted = now.format(dtf);

            // A new DiscussionBoardForum object is made. It calls a method (that runs a query)
            // that will insert this data into the database.
            DiscussionBoardForum forum = new DiscussionBoardForum();
            forum.insertForum(forumID, courseID, forumName, dateTimePosted, forumDescription);

            // Redirects back to the DiscussionBoardForum page
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DiscussionBoard.jsp");
            dispatcher.forward(request,response);
        }

        // Inserts a new thread based on the details filled in the form
        if(action.equals("insertNewThread"))
        {
            // Gets the value of the parameters, based on the user's input
            String threadName = request.getParameter("threadName");
            String threadPost = request.getParameter("threadPost");

            // The threadID starts with with "THREAD", and 3 random characters.
            String threadID = UUID.randomUUID().toString();
			threadID = "THREAD" + threadID.substring(0, 4);

            // The current date and time is found (the date/time the forum was created)
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String dateThreadStarted = now.format(dtf);

            out.println(threadID +", "+threadName+", "+ dateThreadStarted);

            // A new DiscussionBoardThread object is made. It calls a method (that runs a query)
            // that will insert this data into the database.
            DiscussionBoardThread thread = new DiscussionBoardThread();
            thread.insertThread(threadID, "FORUM_001", "", "3238179", threadName, threadPost, dateThreadStarted);

            // Redirects back to the DiscussionBoardForum page
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewForum.jsp");
            dispatcher.forward(request,response);
        }

        // Inserts a new reply based on the details filled in the form
        if(action.equals("insertReply"))
        {
            // Gets the value of the parameters, based on the user's input
            String messageContent = request.getParameter("threadReply");

            // The replyID starts with with "RL_", 3 random characters, "_", and another 3 random characters
            String replyID = UUID.randomUUID().toString();
            replyID = "RL_" + replyID.substring(0, 3) + "_" + replyID.substring(3, 6);

            // The current date and time is found (the date/time the forum was created)
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String dateThreadPosted = now.format(dtf);

            // A new ThreadReply object is made. It calls a method (that runs a query)
            // that will insert this data into the database.
            ThreadReply reply = new ThreadReply();
            reply.insertReply(replyID, "THEAD_004", "01", "", messageContent, dateThreadPosted);

            // Redirects back to the DiscussionBoardForum page
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewThread.jsp");
            dispatcher.forward(request,response);
        }

        // Inserts a new chat message into the database
        if(action.equals("sendChatMessage"))
        {
            // Gets the value of the parameters, based on the user's input
            String messageContent = request.getParameter("messageContent");

            // The chatMessageID starts with with "M_", and another 8 random characters
            String chatMessageID = UUID.randomUUID().toString();
            chatMessageID = "M_" + chatMessageID.substring(0, 8);

            // The current date and time is found (the date/time the forum was created)
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String dateTimePosted = now.format(dtf);

            out.println(chatMessageID + ", " + messageContent + ", " + dateTimePosted);

            // A new ChatMessage object is made. It calls a method (that runs a query)
            // that will insert this data into the database.
            ChatMessage chatMessage = new ChatMessage();
            chatMessage.insertChatMessage(chatMessageID, "CH001", "", "3220929", messageContent, dateTimePosted);

            // Redirects back to the DiscussionBoardForum page
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/IndividualChatBox.jsp");
            dispatcher.forward(request,response);
        }
    }

}
