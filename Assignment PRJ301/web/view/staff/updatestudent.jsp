<%-- 
    Document   : updatestudent
    Created on : 19 Mar 2024, 18:50:04
    Author     : leanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
    </head>
    <body>
        <form action="updatestudent" method="POST">
            Id: ${requestScope.student.id}
            <input type="hidden" name="id" value="${requestScope.student.id}" /> <br/>
            Name: <input type="name" name="name" value="${requestScope.student.name}" /> <br/>
            <input type="submit" value="save"/>
        </form>
    </body>
</html>
