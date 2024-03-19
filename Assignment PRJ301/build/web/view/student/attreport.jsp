<%-- 
    Document   : attreport
    Created on : 17 Mar 2024, 16:46:34
    Author     : leanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Report</title>
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
    </head>
    <body>
        <h1>Attendance Report</h1>
        <table class="subdetail-table" border="1">
            <thead>
                <tr>
                    <th>Class</th>
                    <th>Subject Name</th>
                    <th>Lecturer</th>
                    <th>Description</th>
                    <th>Attend</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.atts}" var="a">
                <tr>
                    <td>${a.group.name}</td>
                    <td>${subjectDetails[a.subject.name]}</td>
                    <td>${subjectDetails[a.lecturer.name]}</td>
                    <td>${a.description}</td>
                    <td>${a.isPresent}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <button id="backButton">Back</button>
    <script>
        document.getElementById("backButton").addEventListener("click", function () {
            window.history.back();
        });
    </script>
</body>
</html>
