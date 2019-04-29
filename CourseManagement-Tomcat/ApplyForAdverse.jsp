<!--
    ApplyForAdverse.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title><c:out value="${currentUser.currentCourseBeingViewed}" /> - Apply For Adverse</title>
        <script src='js/formValidation.js'></script>
    </head>
    <body>
        <div class="container">
            <header>
                <h1><span class="newWord">NEW</span>BOARD</h1>
            </header>

            <br>

            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> >
                    <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}"><c:out value="${currentUser.currentCourseBeingViewed}"/></a> >
                    <a href="StudentAssignmentServlet?action=assessments">Assessments</a> >
                    <a href="StudentAssignmentServlet?assessmentItem=${currentUser.asssessmentItemBeingViewed}&action=viewAssessmentItem">Assessment Item</a> >
                    <a href="AdverseRequestServlet?action=adverseCircumstances">Adverse Circumstances</a> >
                    <a href="#">Apply For Adverse</a>
                </nav>
                <h2> Apply For Adverse </h2>
                <hr>
                <div id="first" style="height:820px;">
                    <h4> Upload Adverse Request for this Assessment Item </h4>
                    <h4> Please enter all fields. </h4>
                    <form onsubmit="return validateAdverseRequest()" action="AdverseRequestServlet?action=uploadAdverseRequest" method="post">

                        <label> Description of Adverse Circumstances: </label>
                        <br>
                        <textarea name="description" id="description"></textarea>
                        <br>

                        <label> Upload Medical Certificates (if any): </label>
                        <br>
                        <input name="medicalFile" id="medicalFile" type="file">
                        <br>

                        <label> Upload Other Documents (if any): </label>
                        <br>
                        <input name="otherFile" id="otherFile" type="file">
                        <br>
                        <input name="student" id="student" value="${currentUser.currentUser}" type="hidden">
                        <input name="assignment" id="assignment" value="${currentUser.asssessmentItemBeingViewed}" type="hidden">
                        <input name="submit" type="submit" value="Submit">
                    </form>
                </div>
            </div>

        </div>

    </body>
</html>
