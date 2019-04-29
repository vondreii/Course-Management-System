<!--
    AdverseCircumstances.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <meta charset="utf-8">
        <title><c:out value="${currentUser.currentCourseBeingViewed}" /> - Adverse Circumstances</title>
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
                    <a href="#"/>Adverse Circumstances</a>
                </nav>
                <h2> Adverse Circumstances </h2>
                <hr>
                <div class="addButton flleft">
                    <a href="/c3238179_c3220929_c3197198_FinalProject/AdverseRequestServlet?action=applyAdverse" style="color:white"> Apply for Adverse </a>
                </div>

                <!--
                <div class="addButton flleft">
                    <a href="/c3238179_c3220929_c3197198_FinalProject/AdverseRequestServlet?action=viewAdverse" style="color:white"> View Adverse Application </a>
                </div>-->

                <br>
                <br>
                <br>
            </div>


        </div>

    </body>
</html>
