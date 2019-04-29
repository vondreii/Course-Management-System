<!--
    CreateGroup.jsp – Oct 17, 2017
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - Create Group</title>
        <script src='js/formValidation.js'></script>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}</div></a>
            </header>
            <div class="content innercontent">


                <c:if test="${currentUser.role == 'coordinator' || currentUser.role == 'staff'}"><!-- If the user=staff -->
                    <nav>
                        <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}">${currentUser.currentCourseBeingViewed}</a> > <a href="PeerEvaluationAndGroupServlet?action=manageGroups">Manage/View Groups</a> > <a href="#">Create Group</a>
                    </nav>
                </c:if>
                <c:if test="${currentUser.role == 'student'}"><!-- If the user=student -->
                    <nav>
                        <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}">${currentUser.currentCourseBeingViewed}</a> > <a href="StudentAssignmentServlet?action=assessments">Assessments</a> > <a href="StudentAssignmentServlet?action=viewGroupAssessment">Group Assessment Item</a> > <a href="PeerEvaluationAndGroupServlet?action=viewGroupPage">Group Page</a> > <a href="#">Create Group</a>
                    </nav>
                </c:if>


                <h2> Create Group </h2>
                <hr>
                <div id="first">
                    <h4> Create Group for a Group Assessment Item </h4>
                    <h4> Please enter all fields </h4>
                    <form onsubmit="return validateCreateGroup()" action="PeerEvaluationAndGroupServlet?action=insertNewGroup" method="post">
                    <label> Group Name: </label>
                    <input name="groupName" id="groupName" placeholder="eg. Web Engineers" type="text">
                    <p> List of students here </p>
                    <p> For the students selected, set their groupID attribute from null to the group ID generated </p>

                    <input name="submit" type="submit" value="Submit">
                    </form>
                </div>

            </div>


        </div>

    </body>
</html>
