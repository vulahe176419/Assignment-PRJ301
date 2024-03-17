<%-- 
    Document   : lecturerhome
    Created on : 6 Mar 2024, 18:26:11
    Author     : leanh
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>University Academic Portal</title>
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
    </head>
    <body class="lechome-body">
        <div class="lechome-con">
            <c:forEach items="${requestScope.lecturers}" var="lec">
                <a class="lec-a" href="timetable?id=${lec.id}">Weekly timetable (Thời khóa biểu từng tuần)</a><br>
            </c:forEach>
            <a class="lec-a" href="../logout">Logout</a>
        </div>
    </body>
</html>
