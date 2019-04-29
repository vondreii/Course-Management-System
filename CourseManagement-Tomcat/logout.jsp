<!--
 * SENG2050 - Web Engineers Team
 * logout.jsp – Oct 17, 2017
-->

<!-- Import taglib to use jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- CurrentUser Bean, to track the current user's actions -->
<jsp:useBean id="currentUser" class="nuboardpkg.CurrentUser" scope="session" />

<!DOCTYPE html>
<html>
	<head>
		<!-- Link to css stylesheet -->
		<link rel="stylesheet" href="css/style.css">
		<meta charset="utf-8">
		<title>NewBoard - Logout</title>
	</head>
	<body>
		<div class="container">
			<!-- Header, which contains 'NewBoard' at the top. -->
			<header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
            </header>
			<div class="content innercontent">
				<!-- The user is told that they have logged out -->
				<h2> '<c:out value="${param.user}"/>' has been logged out! </h2>

				<!-- They are given a link to log back in again -->
				<a href="NewBoard"><div class="addButton login">Log in</div></a>
			</div>
		</div>

	</body>
</html>
