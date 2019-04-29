<!--
    CourseMenu.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="adverseRequest" class="nuboardpkg.AdverseRequest" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - Adverse Statuses</title>
    </head>
    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:30001/c3220929_db" user = "c3220929"  password = "020296"/>
         <sql:query dataSource = "${snapshot}" sql = "Select * from AdverseRequest where assessmentItemID IN (Select assessmentItemID from AssessmentItem where courseID='${currentUser.currentCourseBeingViewed}' AND status <> 'pending')" var = "result" />
         <%-- teachdb --%>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>
            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}">${currentUser.currentCourseBeingViewed}</a> > <a href="AdverseRequestServlet?action=viewAdverseApplications">Adverse Applications</a> > <a href="#">Accepted/Rejected Applications</a>
                </nav>

                <h2> Accepted or Rejected Applications </h2>
                <hr>
                <div class="inner">
                    <c:choose>
                       <c:when test="${result.rowCount==0}">
                           <p>There are no pending applications</p>
                       </c:when>
                       <c:otherwise>

                           <table>
                               <tr>
                                   <th>Student ID</th>
                                   <th>Assessment Item ID</th>
                                   <th>Description</th>
                                   <th>Medical Docs</th>
                                   <th>Other Docs</th>
                                   <th>Status</th>
                               </tr>
                               <c:forEach var = "row" items="${result.rows}">
                                   <tr>
                                       <td><c:out value = "${row.studentID}"/></td>
                                       <td><c:out value = "${row.assessmentItemID}"/></td>
                                       <td><c:out value = "${row.description}"/></td>
                                       <td><c:out value = "${row.attachedMedicalDocs}"/></td>
                                       <td><c:out value = "${row.otherDocs}"/></td>
                                       <td><c:out value = "${row.status}"/></td>
                                   </tr>
                               </c:forEach>
                           </table>

                       </c:otherwise>
                   </c:choose>

                </div>
            </div>
        </div>
    </body>
</html>
