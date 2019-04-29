<!--
    ViewThread.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="threadReply" class="nuboardpkg.ThreadReply" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - View Thread</title>
        <script src='js/formValidation.js'></script>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout</div></a>
            </header>

            <br>

            <div class="content innercontent">

                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}"><c:out value="${currentUser.currentCourseBeingViewed}" /></a> > <a href="DiscussionChatServlet?action=discussionBoard">Discussion Board</a> > <a href="DiscussionChatServlet?action=viewForum">Forum</a> > <a href="#">Thread</a>
                </nav>
                <h2> ${param.name} </h2>
                <ul class="threadReplies">

                    <p> ${param.post} </p>
                    <hr>

                    <c:forEach var = "replyItem" items="${threadReply.threadReplies}">
                    <li>
                        <c:out value = "${replyItem.messageContent}"/>
                        <div class="dateArea">
                            <c:out value = "${replyItem.dateTimePosted}"/>
                        </div>
                    </li>
                    </c:forEach>
                    <hr>
                    <div id="first" style="height:350px">
                        <h4> Reply to thread </h4>
                        <form onsubmit="return validateReply()" action="DiscussionChatServlet?action=insertReply" method="post">

                            <textarea name="threadReply" id="threadReply"></textarea>

                            <input name="submit" type="submit" value="Reply">
                        </form>
                    </div>
                </ul>

            </div>


        </div>

    </body>
</html>
