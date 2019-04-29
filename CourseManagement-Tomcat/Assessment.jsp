<!--
    Assessment.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="assessmentItem" class="nuboardpkg.AssessmentItem" scope="session" />
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title><c:out value="${currentUser.currentCourseBeingViewed}" /> - View Assessment Item</title>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>

            <br>

            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> >
                    <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}"><c:out value="${currentUser.currentCourseBeingViewed}"/></a> >
                    <a href="StudentAssignmentServlet?action=assessments">Assessments</a> >
                    <a href="#">Assessment Item</a>
                </nav>

                <h2> ${param.assessmentItem} </h2>
                <hr>
                <jsp:setProperty name="currentUser" property="asssessmentItemBeingViewed" value="${param.assessmentItem}"/>

                <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                 url = "jdbc:mysql://localhost:30001/c3220929_db" user = "c3220929"  password = "020296"/>

                 <sql:query dataSource = "${snapshot}" sql = "SELECT * FROM AssessmentItem WHERE assessmentItemID = '${param.assessmentItem}'" var = "result1" />

                 <c:choose>
                    <c:when test="${result1.rowCount == 0}">
                        <p> This Assignment does not exist or you do not have access to this item. </p>
                    </c:when>
                    <c:otherwise>
                    <ul class="inner">
                        <c:forEach var = "row" items = "${result1.rows}">
                            <li>
                                <h3>
                                    <c:out value = "${row.itemName}"/></a>
                                </h3>
                                <c:out value = "${row.description}"/>
                                <p> Type: <c:out value = "${row.type}"/> </p>
                                <p> Weight: <c:out value = "${row.weight}"/> </p>
                                <p> Due Date: <c:out value = "${row.dueDate}"/> </p>
                                <p> Downloadable Link: <c:out value = "${row.specsFileName}"/> </p>
                            </li>
                        </c:forEach>
                    </ul>

                    </c:otherwise>
                </c:choose>
                <p> Select 'View Submission' to submit your submission for this Assessment Item. </p>
                <div class="addButton flleft"><a href="StudentAssignmentServlet?action=viewSubmission"> View Submission </a></div>

                <div class="addButton flleft"><a href="AdverseRequestServlet?action=adverseCircumstances"> Adverse Circumstances </a></div>
                <br>
                <br>
                <br>
            </div>


        </div>

    </body>
</html>
