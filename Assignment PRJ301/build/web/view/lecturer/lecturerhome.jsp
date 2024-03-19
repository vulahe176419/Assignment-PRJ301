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
            <a class="lec-a" href="timetable?id=${lecturers.id}">Weekly timetable (Thời khóa biểu từng tuần)</a><br>
            <a class="lec-a" href="../subjectdetail">Subjects Detail (Chi tiết các môn học)</a><br>
            <a class="lec-logout" href="../logout">Logout</a>
        </div>
    </body>
</html>
