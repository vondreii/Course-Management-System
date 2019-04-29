<!--
 * SENG2050 - Web Engineers Team
 * login.jsp – Oct 17, 2017
-->

<!DOCTYPE html>
<html>
    <head>
        <!-- Link to css stylesheet -->
        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
        <title>Welcome to NewBoard!</title>
    </head>
    <body>
        <div class="container">

            <!-- Header, which contains 'NewBoard' at the top. -->
            <header>
                <h1 class="nuboard"><a href="NewBoard"><span class="newWord">NEW</span>BOARD</a></h1>
            </header>

            <!-- The login form, which only accepts logins from tomcatusers.xml -->
            <form name="loginForm" action="j_security_check" method="POST" class="loginBox">

                <!-- The user must input their username and password -->
                <label for="username">Username</label>
            	<input type="text" name="j_username" id="username" placeholder="USERNAME (eg. c1234567 or abc123)"/>
            	<label for="password">Password</label>
            	<input type="password" name="j_password" id="password" placeholder="PASSWORD"/>

                <!-- When submitted, the credentials will be matched against tomcatuser.xml, and the
                user will be redirected to index.jsp -->
            	<input type="submit" value="Login"/>
            </form>
        </div>

    </body>
</html>
