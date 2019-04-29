<!--
    CourseMenu.jsp – Oct 17, 2017
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="announcement" class="nuboardpkg.Announcement" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title><c:out value="${param.course}" /> - Announcements</title>
    </head>
    <body>

        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout</div></a>
            </header>
            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}">${currentUser.currentCourseBeingViewed}</a> > <a href="#">View Announcements</a>
                </nav>
                <c:if test="${currentUser.role == 'coordinator' || currentUser.role == 'staff'}">
                    <a href="CourseMaterialsAndAnnouncementsServlet?action=createAnnouncement"><div class="addButton flright">Create Announcement</div></a>
                </c:if>

                <h2>Announcements</h2>

                <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                 url = "jdbc:mysql://localhost:30001/c3220929_db" user = "c3220929"  password = "020296"/>

                 <sql:query dataSource = "${snapshot}" sql = "SELECT * FROM Announcement WHERE courseID = '${currentUser.currentCourseBeingViewed}'" var = "result1" />

                 <c:choose>
                    <c:when test="${result1.rowCount == 0}">
                        <p> There are no announcements for this course. </p>
                    </c:when>
                    <c:otherwise>
                    <ul class="inner">
                        <c:forEach var = "row" items = "${result1.rows}">
                                <li>
                                    <h3><c:out value = "${row.title}"/></h3> <c:out value = "${row.announcementContent}"/>
                                </li>
                        </c:forEach>
                    </ul>

                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </body>
</html>
