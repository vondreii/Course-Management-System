<!--
    Manage Groups.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - Manage Groups</title>
        <jsp:useBean id="studentGroup" class="nuboardpkg.StudentGroup" scope="session" />
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>
            <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
             url = "jdbc:mysql://localhost:30001/c3220929_db" user = "c3220929"  password = "020296"/>
             <sql:query dataSource = "${snapshot}" sql = "SELECT groupID, groupName FROM StudentGroup WHERE groupID IN (SELECT DISTINCT groupID FROM StudentEnrolment WHERE courseID='${currentUser.currentCourseBeingViewed}');" var = "result" />

            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}">${currentUser.currentCourseBeingViewed}</a> > <a href="#">Manage/View Groups</a>
                </nav>
                <h2> Manage/View Groups </h2>
                <hr>
                <div class="inner">
                    <c:choose>
                       <c:when test="${result.rowCount==0}">
                           <p>There are no groups in this course.</p>
                       </c:when>
                       <c:otherwise>

                           <table>

                               <tr>
                                   <th>Group ID</th>
                                   <th>Name</th>
                               </tr>

                               <c:forEach var = "row" items = "${result.rows}">
                                   <tr>
                                       <td><c:out value = "${row.groupID}"/></td>
                                       <td><c:out value = "${row.groupName}"/></td>
                                   </tr>
                               </c:forEach>
                           </table>
                           <br>
                           <%-- <p> When they click on an individual group: </p>
                           <a href="PeerEvaluationAndGroupServlet?action=viewGroupPage"> <div class="addButton">
                               View Group Page
                           </div> </a>
                           <p> Can add a group </p> --%>
                           <a href="PeerEvaluationAndGroupServlet?action=createGroup"> <div class="addButton">
                               Create Group
                           </div> </a>


                       </c:otherwise>
                   </c:choose>
                </div>


            </div>


        </div>

    </body>
</html>
