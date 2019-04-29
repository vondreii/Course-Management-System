<!--
    CourseMenu.jsp – Oct 17, 2017
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="lecture" class="nuboardpkg.CourseMaterial" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title><c:out value="${currentUser.currentCourseBeingViewed}" /> - Lectures</title>
    </head>
    <body>
        <%-- <jsp:setProperty name="courseMaterial" property="parameterView" value=""/> --%>
        <jsp:setProperty name="lecture" property="parameterView" value="Lectures"/>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout</div></a>
            </header>

            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}"><c:out value="${currentUser.currentCourseBeingViewed}" /></a> > <a href="CourseMaterialsAndAnnouncementsServlet?action=viewCourseMaterials">Course Materials</a> > <a href="#">Lectures</a>
                </nav>
                <h2> Lectures </h2>

                <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                 url = "jdbc:mysql://localhost:30001/c3220929_db" user = "c3220929"  password = "020296"/>

                 <sql:query dataSource = "${snapshot}" sql = "SELECT * FROM CourseMaterial WHERE type='Lecture' AND courseID = '${currentUser.currentCourseBeingViewed}'" var = "result1" />

                 <c:choose>
                    <c:when test="${result1.rowCount == 0}">
                        <p> There are no lectures for this course. </p>
                    </c:when>
                    <c:otherwise>
                    <ul class="inner">
                        <c:forEach var = "row" items = "${result1.rows}">

                                <li>
                                    <h3><c:out value = "${row.materialTitle}"/></h3> <c:out value = "${row.filename}"/>
                                </li>
                        </c:forEach>
                    </ul>

                    </c:otherwise>
                </c:choose>
                <c:if test="${currentUser.role == 'coordinator' || currentUser.role == 'staff'}">
                    <a href="CourseMaterialsAndAnnouncementsServlet?action=addLecture"><div class="addButton">Add Lecture</div></a>
                </c:if>
            </div>
        </div>

    </body>
</html>
