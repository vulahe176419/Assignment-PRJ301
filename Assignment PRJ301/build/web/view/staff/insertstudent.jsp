<%-- 
    Document   : insertstudent
    Created on : 19 Mar 2024, 18:49:17
    Author     : leanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
    </head>
    <body>
        <form action="insertstudent" method="POST">
            Id:<input type="id" name="id" /> <br/>
            Name: <input type="name" name="name" /> <br/>
            <input type="submit" value="save"/>
        </form>
    </body>
</html>
