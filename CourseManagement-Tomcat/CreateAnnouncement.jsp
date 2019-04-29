<!--
    CourseMenu.jsp – Oct 17, 2017
-->
<jsp:useBean id="announcement" class="nuboardpkg.Announcement" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title><c:out value="${param.course}" /> - Create Announcement</title>
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
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}">${currentUser.currentCourseBeingViewed}</a> > <a href="CourseMaterialsAndAnnouncementsServlet?action=viewAnnouncements">View Announcements</a> > <a href="#">Create Announcement</a>
                </nav>
                <h2> Create Announcement </h2>
                <hr>
                <div id="first">
                    <h4> New Announcements appear at the top of the page. </h4>
                    <h4> Please enter all fields. </h4>
                    <form onsubmit="return validateAnnouncement()" action="CourseMaterialsAndAnnouncementsServlet?course=${currentUser.currentCourseBeingViewed}&action=insertNewAnnouncement" method="post">
                    <label> Subject Line: </label>
                    <input name="announcementTitle" id="announcementTitle" placeholder="eg. Assignment 1 marks released" type="text">
                    <br>
                    <label> Announcement Content:</label>
                    <textarea name="announcementContent" id="announcementContent" placeholder="Message">
                    </textarea>
                    <input name="submit" type="submit" value="Submit">
                    </form>
                </div>

                <br>

            </div>

        </div>

    </body>
</html>
