<!--
    DiscussionBoard.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="discussionForum" class="nuboardpkg.DiscussionBoardForum" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - Discussion Board</title>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>
                <jsp:setProperty name="discussionForum" property="courseID" value="${param.course}"/>

                <div class="content innercontent">
                    <nav>
                        <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}"><c:out value="${currentUser.currentCourseBeingViewed}" /></a> > <a href="#">Discussion Board</a>
                    </nav>
                    <c:if test="${currentUser.role == 'coordinator' || currentUser.role == 'staff'}">
                        <a href="DiscussionChatServlet?action=createForum"><div class="addButton flright">Create Forum</div></a>
                    </c:if>

                    <h2> Discussion Board </h2>

                    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                     url = "jdbc:mysql://localhost:30001/c3220929_db?zeroDateTimeBehavior=convertToNull" user = "c3220929"  password = "020296"/>
                     <sql:query dataSource = "${snapshot}" sql = "SELECT * FROM DiscussionBoardForum WHERE courseID='${currentUser.currentCourseBeingViewed}'" var = "result" />

                     <div class="inner">

                         <c:choose>
                            <c:when test="${result.rowCount==0}">
                                <p>This discussion board has no forums.</p>
                            </c:when>
                            <c:otherwise>

                                <ul class="forums">

                                    <c:forEach var = "row" items="${result.rows}">
                                    <li><a href="DiscussionChatServlet?action=viewForum"><h3><c:out value = "${row.forumName}"/></h3></a>
                                    <c:out value = "${row.forumDescription}"/>
                                    <div class="dateArea">
                                        <c:out value = "${row.dateForumStarted}"/>
                                    </div>
                                    </li>
                                    </c:forEach>
                                </ul>


                            </c:otherwise>
                        </c:choose>
                     </div>




                <br>

            </div>
        </div>

    </body>
</html>
