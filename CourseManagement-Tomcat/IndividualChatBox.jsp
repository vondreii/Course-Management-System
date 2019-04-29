<!--
    individualChatBox.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />
<jsp:useBean id="chatMessage" class="nuboardpkg.ChatMessage" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - Chat</title>
        <script src='js/formValidation.js'></script>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>

            <br>

            <div class="content">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}">${currentUser.currentCourseBeingViewed}</a> > <a href="DiscussionChatServlet?action=chat">Chat</a> > <a href="#">MembersNameTheyAreChattingWith</a>
                </nav>
                <h2> MemberTheyAreChattingWith </h2>

                <p> Lists all the messages for this particular chat: </p>
                <p> <jsp:getProperty name="chatMessage" property="allChatMessages"/> </p>
                <hr>
                <div id="first" style="height:350px">
                    <h4> Send a Message to PersonsName </h4>
                    <form onsubmit="return validateChatMessage()" action="DiscussionChatServlet?action=sendChatMessage" method="post">

                        <label> Message: </label>
                        <textarea name="messageContent" id="messageContent"></textarea>

                        <input name="submit" type="submit" value="Send">
                    </form>
                </div>

            </div>


        </div>

    </body>
</html>
