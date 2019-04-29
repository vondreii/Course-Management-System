<!--
    CourseMenu.jsp – Oct 17, 2017
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>${currentUser.currentCourseBeingViewed} - List of Adverse Applications</title>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
                <a href="NewBoard?log=out"><div class="addButton flright logout">Logout, ${currentUser.currentUser}!</div></a>
            </header>

            <div class="content innercontent">
                <nav>
                    <a href="NewBoard">Home</a> > <a href="CourseServlet?course=${currentUser.currentCourseBeingViewed}"><c:out value="${currentUser.currentCourseBeingViewed}"/></a> > <a href="#">Adverse Applications</a>
                </nav>
                <h2> Adverse Applications </h2>
                <hr>
                <div class="inner">

                    <div class="linkButtons">
                        <a href="AdverseRequestServlet?course=${currentUser.currentCourseBeingViewed}&action=viewPending" class="addButton"> Pending Applications </a>
                        <%-- <br> --%>
                        <a href="AdverseRequestServlet?course=${currentUser.currentCourseBeingViewed}&action=viewAcceptedOrRejected" class="addButton"> Accepted or Rejected Applications </a>
                    </div>
                </div>


                <br>

            </div>


        </div>

    </body>
</html>
