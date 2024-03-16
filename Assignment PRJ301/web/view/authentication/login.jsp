<%-- 
    Document   : login
    Created on : 1 Mar 2024, 19:43:00
    Author     : leanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FU Academic Portal</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
    </head>
    <body class="login-bigcon">
        <div class="login-container">
            <h1>FU Academic Portal</h1>
            <form action="login" method="POST">
                <input type="text" name="username" placeholder="Username"/><br/>
                <input type="password" name="password" placeholder="Password"/><br/>
                <input type="checkbox" id="remember" name="remember"/>
                <label for="remember">Remember me</label><br/>
                <div class="login-button-container">
                    <input type="submit" value="Login"/>
                </div>
            </form>
        </div>
    </body>
</html>
