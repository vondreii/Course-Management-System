<!--
    UploadAssessmentItems.jsp – Oct 17, 2017
-->

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title><c:out value="${currentUser.currentCourseBeingViewed}" /> - Upload Assessment Item</title>
        <script src='js/formValidation.js'></script>
    </head>
    <body>
        <div class="container">
            <header>
                <h1><span class="newWord">NEW</span>BOARD</h1>
            </header>

            <br>
            <div class="content">
                <nav>
                    <a href="NewBoard">Home</a> >
                    <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}"><c:out value="${currentUser.currentCourseBeingViewed}"/></a> >
                    <a href="StudentAssignmentServlet?action=assessments">Assessments</a> >
                    <a href="StudentAssignmentServlet?assessmentItem=${currentUser.asssessmentItemBeingViewed}&action=viewAssessmentItem">Assessment Item</a> >
                    <a href="#">Upload</a>
                </nav>
                <h2> Upload Assessment Item </h2>
                <div id="first" style="height:300px">
                    <h4> Upload your submission </h4>
                    <h4> Upload your file for AssessmentItemName. </h4>
                    <form onsubmit="return validateAssignmentSubmission()" action="StudentAssignmentServlet?action=insertNewSubmission" method="post">

                        <label> Submission File Upload: </label>
                        <br>
                        <input name="submissionFile" id="submissionFile" type="file">
                        <br>
                        <input name="group" id="group" value="${currentUser.group}" type="hidden">
                        <input name="student" id="student" value="${currentUser.currentUser}" type="hidden">
                        <input name="assignment" id="assignment" value="${currentUser.asssessmentItemBeingViewed}" type="hidden">
                        <input name="submit" type="submit" value="Submit">

                    </form>
                </div>
            </div>

        </div>

    </body>
</html>
