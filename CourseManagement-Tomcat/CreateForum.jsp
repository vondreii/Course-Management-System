<!--
    CourseMenu.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="discussionForum" class="nuboardpkg.DiscussionBoardForum" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - Create Forum</title>
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
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}"><c:out value="${currentUser.currentCourseBeingViewed}" /></a> > <a href="DiscussionChatServlet?action=discussionBoard">Discussion Board</a> > <a href="#">Create Forum</a>
                </nav>

                <h2> Create Forum </h2>
                <hr>
                <div id="first">
                    <h4> Create Discussion Board Forum </h4>
                    <h4> Please enter all fields. </h4>
                    <form onsubmit="return validateCreateForum()" action="DiscussionChatServlet?action=insertNewForum" method="post">
                        <label> Forum Name: </label>
                        <br>
                        <input name="forumName" id="forumName" placeholder="eg. Assignment 1 Help" type="text">
                        <br>
                        <label> Description: </label>
                        <br>
                        <textarea name="forumDescription" id="forumDescription"></textarea>
                        <br>
                        <input name="submit" type="submit" value="Submit">
                    </form>
                </div>

            </div>


        </div>

    </body>
</html>
