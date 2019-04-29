<!--
    ViewSubmission.jsp – Oct 17, 2017
-->
<jsp:useBean id="assignmentSubmission" class="nuboardpkg.AssignmentSubmission" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>NuBoard: View Submission</title>
    </head>
    <body>
        <div class="container">
            <header>
                <h1><span class="newWord">NEW</span>BOARD</h1>
            </header>

            <br>
            <div class="content">
                <nav>
                    Course_name > Assessments > Assessment Item > View Submission
                </nav>
                <h2> View Assessment Item </h2>
                <hr>
                <p> Student can view the file they submitted and their grades </p>

                <p> <jsp:getProperty name="assignmentSubmission" property="allSubmissions"/> </p>


            </div>
        </div>

    </body>
</html>
