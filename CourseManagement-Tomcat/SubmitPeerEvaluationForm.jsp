<!--
    GroupAssessment.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="peerEvaluationForm" class="nuboardpkg.PeerEvaluationForm" scope="session" />
<jsp:useBean id="enrolment" class="nuboardpkg.StudentEnrolment" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>NewBoard - Submit Peer Evaluation Form</title>
        <script src='/c3238179_c3220929_c3197198_FinalProject/js/formValidation.js'></script>
    </head>
    <body>
        <div class="container">

            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout</div></a>
            </header>

            <jsp:setProperty name="enrolment" property="studentID" value="${param.name}"/>

            <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
             url = "jdbc:mysql://teachdb/c3220929_db" user = "c3220929"  password = "020296"/>
             <sql:query dataSource = "${snapshot}" sql = "SELECT groupName FROM StudentGroup where groupID = (SELECT groupID FROM StudentEnrolment where studentID='${param.name}' and courseID='${param.course}')" var = "result1" />
             <sql:query dataSource = "${snapshot}" sql = "SELECT groupID FROM StudentEnrolment where studentID='${param.name}' and courseID='${param.course}'" var = "result2" />
             <sql:query dataSource = "${snapshot}" sql = "SELECT se.studentID, s.firstName, s.lastName from StudentEnrolment se, Student s WHERE groupID = (SELECT groupID FROM StudentGroup where groupID = (SELECT groupID FROM StudentEnrolment where studentID='${param.name}' and courseID='${param.course}')) and se.studentID = s.studentID" var = "result3" />

            <div class="content innercontent">
                <nav>
                    ${param.course} > Assessments > Assessment Item > Submit Peer Evaluation Form
                </nav>
                <h2> Submit Peer Evaluation Form <span class="teamName">( <c:forEach var = "row" items = "${result1.rows}"><c:out value = "${row.groupName}"/></c:forEach> )</span></h2>
                <hr>
                <p> List all students who are in the group, and whether or not they have submitted their peer evaluation form. </p>

                <p>
                  If someone has not submitted their evaluation form, the students are notified that the person will get 0.
                  Here they see a list of all Peer Evaluations of their group members (who has/hasn't submitted)
                </p>

                <h4> Submit Peer Evaluation Form </h4>
                <form onsubmit="return validatePeerEvaluationForm()" action="PeerEvaluationAndGroupServlet?action=submitPeerEvaluation" method="post">

                    <h4> Please give a mark out of 100% for each group member. </h4>
                    <h5>
                        For example, rate the group members who contributed the most work 100%, and rate
                        the group members who did not conitribute 0%.

                         rate every member in the group (including yourself) 25%. Scale the marks accordingly based on
                        the contribution each team member made.
                    </h5>

                    <p> For each student in the group, have a label and a number input: </p>

                  <c:forEach var = "row" items = "${result3.rows}">
                      <div id="first" style="height:150px; margin-bottom:20px;">
                          <br>
                          <label> <c:out value = "${row.firstName}"/>'s Contribution: </label><br>
                          <input name="${row.studentID}" id="${row.studentID}" placeholder="eg. 25" type="number"><br>
                      </div>
                  </c:forEach>
                    <input name="submit" type="submit" value="Submit">
                </form>


            </div>


        </div>

    </body>
</html>
