<!--
    GroupAssessment.jsp – Oct 17, 2017
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - Group Assessment</title>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>

            <br>
            <div class="content">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}">${currentUser.currentCourseBeingViewed}</a>
                    > <a href="StudentAssignmentServlet?action=assessments">Assessments</a>
                    > <a href="#">Assessment Item</a>
                </nav>
                <h2> Group Assessment item </h2>
                <hr>
                <p> This is the assessment item (for a group assignment) </p>

                <p>
                  The student can view the submission for this item.
                  - If they have not submitted the item, they will be redirected to the 'submitPeerEvaluations' page.
                  - If they have already submitted, they are directed to the 'view' page.
                </p>
                <p> A column needs to be added to the table 'AssessmentItem.' should be called 'type'
                    and can either be individual or group.
                </p>

                <a href="PeerEvaluationAndGroupServlet?action=viewGroupPage"> Group Page </a>
                <br>
                <a href="PeerEvaluationAndGroupServlet?action=viewGroupSubmission"> Submit your Peer Evaluation Form </a>
            </div>


        </div>

    </body>
</html>
