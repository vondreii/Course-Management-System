<!--
    Addlab.jsp – Oct 17, 2017
-->
<jsp:useBean id="courseMaterial" class="nuboardpkg.CourseMaterial" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - Add Lab</title>
        <script src='/c3238179_c3220929_c3197198_FinalProject/js/formValidation.js'></script>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout</div></a>
            </header>

            <div class="content innercontent">
                    <nav>
                        <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}">${currentUser.currentCourseBeingViewed}</a> > <a href="CourseMaterialsAndAnnouncementsServlet?action=viewCourseMaterials">Course Materials</a> > <a href="CourseMaterialsAndAnnouncementsServlet?action=viewLabs">Labs</a> > <a href="#">Add Lab</a>
                    </nav>
                    <h2> Add Lab </h2>
                <hr>
                <div id="first">
                    <h4> Upload Lab File </h4>
                    <h4> Please enter all fields. </h4>
                    <form onsubmit="return validateCourseMaterial()" action="CourseMaterialsAndAnnouncementsServlet?action=insertNewLab" method="post">

                        <label> Title of Lab: </label>
                        <input name="labTitle" id="labTitle" placeholder="eg. Lab 5" type="text">
                        <br>

                        <label> File Upload: </label>
                        <input name="labFile" id="labFile" type="file">
                        <input name="course" id="course" value="${currentUser.currentCourseBeingViewed}" type="hidden">
                        <br>

                        <input name="submit" type="submit" value="Submit">
                    </form>
                </div>

            </div>


        </div>

    </body>
</html>
