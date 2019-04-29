<!--
    DownloadAssignments.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} /> - Download</title>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout</div></a>
            </header>

            <br>

            <div class="content">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}">${currentUser.currentCourseBeingViewed}</a> > <a href="#">Download</a>
                </nav>

                <h2> Your download will start shortly  </h2>

            </div>


        </div>

    </body>
</html>
