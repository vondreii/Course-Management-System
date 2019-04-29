<!--
    ViewForum.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="discussionThread" class="nuboardpkg.DiscussionBoardThread" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - View Forum</title>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>
            <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
             url = "jdbc:mysql://localhost:30001/c3220929_db?zeroDateTimeBehavior=convertToNull" user = "c3220929"  password = "020296"/>
             <sql:query dataSource = "${snapshot}" sql = "Select * from DiscussionBoardThread where forumID IN (SELECT forumID FROM DiscussionBoardForum where courseID='${currentUser.currentCourseBeingViewed}');" var = "result" />


            <div class="content innercontent">

                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}"><c:out value="${currentUser.currentCourseBeingViewed}" /></a> > <a href="DiscussionChatServlet?action=discussionBoard">Discussion Board</a> > <a href="#">Forum</a>
                </nav>
                <c:if test="${currentUser.role == 'coordinator' || currentUser.role == 'staff'}">
                    <a href="DiscussionChatServlet?action=createThread"><div class="addButton flright">Create Thread</div></a>
                </c:if>
                <h2> <c:out value="${param.name}"/> </h2>

                <div class="inner">

                    <c:choose>
                       <c:when test="${result.rowCount==0}">
                           <p>This Forum has no threads.</p>
                       </c:when>
                       <c:otherwise>

                           <ul class="threads" style="margin-top:100px;">
                               <c:forEach var = "row" items="${result.rows}">
                               <li><a href="DiscussionChatServlet?action=viewThread"><h3><c:out value = "${row.threadName}"/></h3></a>
                               <c:out value = "${row.threadPost}"/>
                               <div class="dateArea">
                                   <c:out value = "${row.dateThreadStarted}"/>
                               </div>
                               </li>
                               </c:forEach>
                           </ul>


                       </c:otherwise>
                   </c:choose>
                </div>


            </div>
        </div>
    </body>
</html>
