<!--
    CourseMenu.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="assignmentSubmission" class="nuboardpkg.AssignmentSubmission" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - Grade Center</title>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>

            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}">${currentUser.currentCourseBeingViewed}</a> > <a href="#">Grade Center</a>
                </nav>

                <h2> Grade Center </h2>
                <hr>

                <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                 url = "jdbc:mysql://localhost:30001/c3220929_db" user = "c3220929"  password = "020296"/>
                 <sql:query dataSource = "${snapshot}" sql = "Select s.submissionID, s.studentID, s.groupID,  a.assessmentItemID, courseID, s.dateTimeSubmitted, s.isLate, s.isExtensionGranted, s.totalPossibleMark, s.studentMark from AssessmentItem a join AssignmentSubmission s on a.assessmentItemID=s.assessmentItemID where courseID='${currentUser.currentCourseBeingViewed}'" var = "result" />


                 <div class="inner">
                     <c:choose>
                        <c:when test="${result.rowCount==0}">

                            <p>There are no assignment submissions in this course</p>
                        </c:when>
                        <c:otherwise>

                            <table>

                                <tr>
                                    <th>Student/GroupID</th>
                                    <th>Date/Time Submitted</th>
                                    <th>Late</th>
                                    <th>Extension Granted</th>
                                    <th>Total Possible Marks</th>
                                    <th>Student/Group Marks</th>
                                </tr>

                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <c:choose>
                                            <c:when test="${empty row.studentID}">
                                                <td><c:out value = "${row.groupID}"/></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><c:out value = "${row.studentID}"/></td>
                                            </c:otherwise>
                                        </c:choose>

                                        <td><c:out value = "${row.dateTimeSubmitted}"/></td>

                                        <c:if test="${row.isLate == 'false'}"><td><c:out value = "No"/></td></c:if>
                                        <c:if test="${row.isLate == 'true'}"><td><c:out value = "Yes"/></td></c:if>
                                        <c:if test="${row.isExtensionGranted == 'false'}"><td><c:out value = "No"/></td></c:if>
                                        <c:if test="${row.isExtensionGranted == 'true'}"><td><c:out value = "Yes"/></td></c:if>
                                        <td><c:out value = "${row.totalPossibleMark}"/></td>
                                        <td><c:out value = "${row.studentMark}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <br>
                            <a href="TeacherAssignmentServlet?action=downloadAssignments">
                                <div class="addButton">Download all submissions for this Assignment</div> </a>

                        </c:otherwise>
                    </c:choose>
                 </div>

            </div>

        </div>

    </body>
</html>
