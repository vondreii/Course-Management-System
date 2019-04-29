<!--
    CourseMenu.jsp – Oct 17, 2017
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="course" class="nuboardpkg.Course" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>NewBoard - ${currentUser.currentCourseBeingViewed}</title>
    </head>
    <body>
        <jsp:setProperty name="currentUser" property="currentCourseBeingViewed" value="${param.course}"/>

        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:30001/c3220929_db" user = "c3220929"  password = "020296"/>
         <sql:query dataSource = "${snapshot}" sql = "SELECT courseID FROM Course" var = "result" />

        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>
            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="#">${currentUser.currentCourseBeingViewed}</a>
                </nav>
                <h2> <c:out value="${currentUser.currentCourseBeingViewed}" /></h2>


                <c:forEach var = "row" items = "${result.rows}">
                    <c:choose>
                        <c:when test="${row.courseID == currentUser.currentCourseBeingViewed}">
                            <c:choose>
                                <c:when test="${currentUser.role == 'staff'}">
                                    <ul class="menu">
                                        <a href="CourseMaterialsAndAnnouncementsServlet?action=viewAnnouncements"> <li>Announcements</li></a>
                                        <a href="CourseMaterialsAndAnnouncementsServlet?action=viewCourseMaterials"> <li>Course Materials</li></a>
                                        <a href="StudentAssignmentServlet?action=assessments"> <li>Assessments</li></a>
                                        <a href="DiscussionChatServlet?action=discussionBoard"> <li>Discussion Board</li></a>
                                        <a href="DiscussionChatServlet?action=chat"> <li>Chat</li></a>
                                        <a href="PeerEvaluationAndGroupServlet?action=manageGroups"> <li>Manage Groups</li></a>
                                        <a href="CourseMaterialsAndAnnouncementsServlet?action=viewEchoPage"> <li>Echo</li></a>
                                        <a href="TeacherAssignmentServlet?action=viewGradeCenter"> <li>Grade Center</li></a>
                                    </ul>
                                </c:when>
                                <c:when test="${currentUser.role == 'coordinator'}">
                                    <ul class="menu">
                                        <a href="CourseMaterialsAndAnnouncementsServlet?action=viewAnnouncements"> <li>Announcements</li></a>
                                        <a href="CourseMaterialsAndAnnouncementsServlet?action=viewCourseMaterials"> <li>Course Materials</li></a>
                                        <a href="StudentAssignmentServlet?action=assessments"> <li>Assessments</li></a>
                                        <a href="DiscussionChatServlet?action=discussionBoard"> <li>Discussion Board</li></a>
                                        <a href="DiscussionChatServlet?action=chat"> <li>Chat</li></a>
                                        <a href="PeerEvaluationAndGroupServlet?action=manageGroups"> <li>Manage Groups</li></a>
                                        <a href="CourseMaterialsAndAnnouncementsServlet?action=viewEchoPage"> <li>Echo</li></a>
                                        <a href="TeacherAssignmentServlet?action=viewGradeCenter"> <li>Grade Center</li></a>
                                        <a href="AdverseRequestServlet?action=viewAdverseApplications" class="coordinator"><li>Adverse Applications</li></a>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <%-- Courses Particular STUDENT enrolled in --%>
                                    <ul class="menu">
                                        <a href="CourseMaterialsAndAnnouncementsServlet?action=viewAnnouncements"><li>Announcements</li></a>
                                        <a href="CourseMaterialsAndAnnouncementsServlet?action=viewCourseMaterials"><li>Course Materials</li></a>
                                        <a href="StudentAssignmentServlet?action=assessments"><li>Assessments</li></a>
                                        <a href="DiscussionChatServlet?action=discussionBoard"><li>Discussion Board</li></a>
                                        <a href="DiscussionChatServlet?action=chat"><li>Chat</li></a>
                                        <a href="StudentAssignmentServlet?action=viewGrades"><li>Grades</li></a>
                                        <a href="CourseMaterialsAndAnnouncementsServlet?action=viewEchoPage"><li>Echo</li></a>
                                    </ul>
                                </c:otherwise>
                            </c:choose>
                        </c:when>

                    </c:choose>
                </c:forEach>





            </div>
        </div>
    </body>
</html>
