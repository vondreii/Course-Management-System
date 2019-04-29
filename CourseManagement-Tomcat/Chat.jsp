<!--
    Chat.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - Chat</title>
        <script src='/c3238179_c3220929_c3197198_FinalProject/js/formValidation.js'></script>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>

            <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
             url = "jdbc:mysql://localhost:30001/c3220929_db" user = "c3220929"  password = "020296"/>
             <sql:query dataSource = "${snapshot}" sql = "select studentID, firstName, lastName from Student where studentID IN (Select studentID from ChatBox where courseID='${currentUser.currentCourseBeingViewed}')" var = "result" />


            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}">${currentUser.currentCourseBeingViewed}</a> > <a href="#">Chat</a>
                </nav>
                <h2> Chat </h2>

                <c:if test="${currentUser.role == 'student'}">
                    <h3> You can select a staff member to chat with directly to privately discuss any matters regarding assignment feedback,
                        course content. adverse circumstances, and any other issues. </h3>
                    <hr>
                    <p> Lists of staff members for this particular course </p>
                </c:if>

                <c:if test="${currentUser.role == 'staff' || currentUser.role == 'coordinator'}">
                    <h3> You can select a student to chat with directly to privately discuss any matters regarding assignment feedback,
                        course content, adverse circumstances, and any other issues. </h3>
                    <hr>
                    <p> Lists of students for this particular course </p>

                    <ul>
                        <c:forEach var = "row" items="${result.rows}">
                                <li><c:out value = "${row.firstName}"/> <c:out value = "${row.lastName}"/> (<c:out value = "${row.studentID}"/>)</li>
                        </c:forEach>
                    </ul>

                </c:if>

                <hr>
                <p> When selecting a staff member/student, an individual chat appears: </p>
                <br>
                <a href="DiscussionChatServlet?action=viewChatWithMember"> <div class="addButton">Individual Member to chat with</div> </a>

            </div>


        </div>

    </body>
</html>
