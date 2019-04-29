<!--
    ViewAdverseApplication.jsp – Oct 17, 2017
-->
<jsp:useBean id="adverseRequest" class="nuboardpkg.AdverseRequest" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>NuBoard: View Adverse Application</title>
    </head>
    <body>
        <div class="container">
            <header>
                <h1><span class="newWord">NEW</span>BOARD</h1>
            </header>

            <br>
            <div class="content">
                <nav>
                    Course_name > Assessments > Assessment Item > Adverse Circumstances > View Adverse Application
                </nav>
                <h2> View Adverse Application </h2>
                <hr>
                <p> Student can  view their application </p>
                <p> <jsp:getProperty name="adverseRequest" property="allAdverseRequests"/> </p>
            </div>

        </div>

    </body>
</html>
