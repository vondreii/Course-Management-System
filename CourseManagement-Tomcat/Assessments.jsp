<!--
    Assessments.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="assessmentItem" class="nuboardpkg.AssessmentItem" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title><c:out value="${currentUser.currentCourseBeingViewed}" /> - Assessments</title>
    </head>
    <body>
        <div class="container">
            <header class="index">
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>

            <br>

            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> >
                    <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}"><c:out value="${currentUser.currentCourseBeingViewed}"/></a> >
                    <a href="#">Assessments</a>
                </nav>

                <h2> Individual Assessments: </h2>

                <jsp:setProperty name="assessmentItem" property="courseID" value="${currentUser.currentCourseBeingViewed}"/>

                <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                 url = "jdbc:mysql://localhost:30001/c3220929_db" user = "c3220929"  password = "020296"/>

                 <sql:query dataSource = "${snapshot}" sql = "SELECT * FROM AssessmentItem WHERE type='Individual' AND courseID = '${currentUser.currentCourseBeingViewed}'" var = "result1" />

                 <c:choose>
                    <c:when test="${result1.rowCount == 0}">
                        <p> There are no Assessment Items for this course. </p>
                    </c:when>
                    <c:otherwise>
                    <ul class="inner">
                        <c:forEach var = "row" items = "${result1.rows}">
                                <li>
                                    <h3>
                                        <a href="StudentAssignmentServlet?assessmentItem=${row.assessmentItemID}&action=viewAssessmentItem"><c:out value = "${row.itemName}"/></a>
                                    </h3>
                                    <c:out value = "${row.description}"/>
                                    <p> Type: <c:out value = "${row.type}"/> </p>
                                    <p> Weight: <c:out value = "${row.weight}"/> </p>
                                    <p> Due Date: <c:out value = "${row.dueDate}"/> </p>
                                    <p> Downloadable Link: <c:out value = "${row.specsFileName}"/> </p>
                                </li>
                        </c:forEach>
                    </ul>

                    </c:otherwise>
                </c:choose>
                <br>

                <h2> Group Assessments: </h2>

                <sql:query dataSource = "${snapshot}" sql = "SELECT * FROM AssessmentItem WHERE type='Group' AND courseID = '${currentUser.currentCourseBeingViewed}'" var = "result1" />

                <c:choose>
                   <c:when test="${result1.rowCount == 0}">
                       <p> There are no Assessment Items for this course. </p>
                   </c:when>
                   <c:otherwise>
                   <ul class="inner">
                       <c:forEach var = "row" items = "${result1.rows}">
                               <li>
                                   <h3>
                                       <a href="StudentAssignmentServlet?assessmentItem=${row.assessmentItemID}&action=viewGroupAssessment"><c:out value = "${row.itemName}"/></a>
                                   </h3>
                                   <c:out value = "${row.description}"/>
                                   <p> Type: <c:out value = "${row.type}"/> </p>
                                   <p> Weight: <c:out value = "${row.weight}"/> </p>
                                   <p> Due Date: <c:out value = "${row.dueDate}"/> </p>
                                   <p> Downloadable Link: <c:out value = "${row.specsFileName}"/> </p>
                               </li>
                       </c:forEach>
                   </ul>

                   </c:otherwise>
               </c:choose>
               <br>

                <div class="addButton flleft"><a href="TeacherAssignmentServlet?action=addAssessmentItem"> Add Assessment Item </a></div>

                <br>
                <br>
                <br>
            </div>
        </div>

    </body>
</html>
