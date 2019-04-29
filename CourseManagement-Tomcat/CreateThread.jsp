<!--
    CourseMenu.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="discussionthread" class="nuboardpkg.DiscussionBoardThread" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - Create Thread</title>
        <script src='js/formValidation.js'></script>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout</div></a>
            </header>
            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}"><c:out value="${currentUser.currentCourseBeingViewed}" /></a> > <a href="DiscussionChatServlet?action=discussionBoard">Discussion Board</a> > <a href="DiscussionChatServlet?action=viewForum">Forum</a> > <a href="#">Create Thread</a>
                </nav>
                <h2> Create Thread </h2>
                <hr>
                <div id="first">
                    <h4> Create Discussion Board Thread </h4>
                    <h4> Please enter all fields. </h4>
                    <form onsubmit="return validateCreateThread()" action="DiscussionChatServlet?action=insertNewThread" method="post">
                        <label> Thread Name: </label>
                        <br>
                        <input name="threadName" id="threadName" placeholder="eg. Need help on Servlets" type="text">
                        <br>
                        <label> Thread Post: </label>
                        <br>
                        <textarea name="threadPost" id="threadPost"></textarea>
                        <br>
                        <input name="submit" type="submit" value="Post">
                    </form>
                </div>

            </div>


        </div>

    </body>
</html>
