<!--
 * SENG2050 - Web Engineers Team
 * index.jsp – Oct 17, 2017
-->

<!-- tag libraries to use jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!-- Beans to track the current user's actions, and the courses they are teaching/enrolled in -->
<jsp:useBean id="course" class="nuboardpkg.Course" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>NewBoard - Home</title>
        <!-- Link to css stylesheet -->
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <!-- This will get the current user, who has just logged in, and save it in the currentUser Bean -->
        <%currentUser.setCurrentUser(request.getUserPrincipal().getName());%>
        <div class="container">

            <!-- Header, which contains 'NewBoard' at the top. -->
            <header class="index">
                <!-- NewBoard link and logout button -->
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>

            <div class="content innercontent">

                <!-- Current user's role is set in the currentUser Bean -->
                <jsp:setProperty name="currentUser" property="role" value="${param.user}"/>

                <!-- Data Source connects to the database -->
                <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                 url = "jdbc:mysql://localhost:30001/c3220929_db" user = "c3220929"  password = "020296"/>

                 <!-- Query is executed to to get the first/last name of the user -->
                 <sql:query dataSource = "${snapshot}" sql = "SELECT firstName, lastName FROM TeachingStaff WHERE numberPlate = '${currentUser.currentUser}'" var = "result0" />

                 <c:forEach var = "row" items = "${result0.rows}">
                     <!-- The user's name is displayed -->
                     <h2> Hello, <c:out value = "${row.firstName}"/> <c:out value = "${row.lastName}"/>! </h2>
                  </c:forEach>

                    <c:choose>
                        <%-- If the user is a staff/coordinator --%>
                		<c:when test="${currentUser.role == 'staff' || currentUser.role == 'coordinator'}">

                            <%-- Query to get Courses Particular STAFF are teaching --%>
                             <sql:query dataSource = "${snapshot}" sql = "SELECT courseID, courseName FROM Course WHERE courseID IN (SELECT courseID FROM TeachingStaffCourseAllocation WHERE semID='2017_2' AND staffNo = ( SELECT staffNo FROM TeachingStaff WHERE numberPlate = '${currentUser.currentUser}'))" var = "result1" />

                             <h3> Courses you are teaching: </h3>

                            <c:choose>
                               <c:when test="${result1.rowCount == 0}">
                                   <%-- If the query returns an empty result, it means that there are no courses they are teaching --%>
                                   <p> You have no courses to teach this semester, or do not have permission to view these courses. </p>
                               </c:when>
                               <c:otherwise>

                                   <!-- otherwise, a menu is listed with the courses they teach -->
                                   <ul class="menu">
                                   <c:forEach var = "row" items = "${result1.rows}">
                                          <!-- The courseID and courseName is displayed -->
                                          <li><a href="<c:url value='CourseServlet?course=${row.courseID}'/>">
                                          <c:out value = "${row.courseID}"/> : <c:out value = "${row.courseName}"/>
                                          </a></li>
                                   </c:forEach>
                                   </ul>

                               </c:otherwise>
                           </c:choose>
                		</c:when>
                		<c:otherwise>
                            <%-- Courses Particular STUDENT enrolled in --%>
                            <sql:query dataSource = "${snapshot}" sql = "SELECT courseID, courseName FROM Course WHERE courseID IN (SELECT courseID FROM StudentEnrolment WHERE semID='2017_2' AND studentID = ( SELECT studentID FROM Student WHERE username = '${currentUser.currentUser}'))" var = "result2" />

                            <h3> Courses you are enrolled in: </h3>
                			<hr>
                                <c:choose>
                                   <c:when test="${result2.rowCount == 0}">
                                       <!-- If student is not enrolled in any courses, a message is displayed -->
                                       <p> You have no courses to teach this semester, or do not have permission to view these courses. </p>
                                   </c:when>
                                   <c:otherwise>
                                       <!-- otherwise, the menu with the courses is displayed -->
                                        <ul class="menu">
                                                <!-- for each row: -->
                                               <c:forEach var = "row" items="${result2.rows}">

                                               <!-- displays the courseID and the courseName -->
                                               <li><a href="<c:url value='CourseServlet?course=${row.courseID}'/>">
                                               <c:out value = "${row.courseID}"/> : <c:out value = "${row.courseName}"/>
                                               </a></li>
                                               </c:forEach>
                                        </ul>
                                   </c:otherwise>
                               </c:choose>

                		</c:otherwise>
                	</c:choose>

            </div>
        </div>
    </body>
</html>
