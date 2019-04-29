<!--
    CourseMenu.jsp – Oct 17, 2017
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title><c:out value="${currentUser.currentCourseBeingViewed}" /> - Course Materials</title>
        <style>
            .materials { background-color: rgba(255,255,255,0); padding: 30px; margin-left: 0;}
        </style>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout</div></a>
            </header>
            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}"><c:out value="${currentUser.currentCourseBeingViewed}" /></a> > <a href="#">Course Materials</a>
                </nav>
                <h2> Course Materials </h2>
                <hr>
                    <ul class="materials">
                        <a href="CourseMaterialsAndAnnouncementsServlet?action=viewLectures"><li><h3 style="margin-top:20px;"> Lectures </h3></li></a>
                        <a href="CourseMaterialsAndAnnouncementsServlet?action=viewLabs"><li><h3 style="margin-top:20px;"> Labs </h3></li></a>
                    </ul>
            </div>


        </div>

    </body>
</html>
