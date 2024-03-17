<%-- 
    Document   : studenthome
    Created on : 17 Mar 2024, 16:01:19
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
            <c:forEach items="${requestScope.students}" var="s">
                <a class="lec-a" href="timetable?id=${s.id}">Weekly timetable (Thời khóa biểu từng tuần)</a><br>
            </c:forEach>
            <a class="lec-a" href="../curriculum">Curiculum (Khung chương trình)</a><br>
            <a class="lec-a" href="../logout">Logout</a>
        </div>
    </body>
</html>
