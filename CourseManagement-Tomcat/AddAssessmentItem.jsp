<!--
    AddAssessmentItem.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title><c:out value="${currentUser.currentCourseBeingViewed}" /> - Add Assessment Item</title>
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
                    <a href="#">Add Assessment Item</a> 
                </nav>
                <h2> Add Assessment Item </h2>
                <hr>
                <div id="first" style="height:820px;">
                    <h4> Upload Assessment Item file </h4>
                    <h4> Please enter all fields. </h4>
                    <form onsubmit="return validateAssessmentItemUpload()" action="TeacherAssignmentServlet?action=uploadAssessmentItemFile" method="post">
                        <label> Assessment Item Name: </label>
                        <br>
                        <input name="assessmentItemName" id="assessmentItemName" placeholder="eg. Assignment 1" type="text">
                        <br>
                        <label> Description: </label>
                        <br>
                        <textarea name="description" id="description"></textarea>
                        <br>
                        <label> File Upload: </label>
                        <br>
                        <input name="assignmentFile" id="assignmentFile" type="file">
                        <br>
                        <label> Total Weight (% out of 100): </label>
                        <br>
                        <input name="weight" id="weight" placeholder="eg. 25" type="number">
                        <br>
                        <label> Due Date: </label>
                        <br>
                        <input name="dueDate" id="dueDate" type="datetime-local">
                        <br>
                        <input name="course" id="course" value="${currentUser.currentCourseBeingViewed}" type="hidden">
                        <input name="submit" type="submit" value="Submit">
                    </form>
                </div>

            </div>


        </div>

    </body>
</html>
