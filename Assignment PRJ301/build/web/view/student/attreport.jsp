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
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>Class</th>
                    <th>Lecturer</th>
                    <th>Description</th>
                    <th>Attend</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.atts}" var="a">
                <tr>
                    <td>${a.subject.name}</td>
                    <td>${subjectDetails[a.subject.name]}</td>
                    <td>${a.group.name}</td>
                    <td>${lecturerDetails[a.lecturer.name]} (${a.lecturer.name})</td>
                    <td>${a.description}</td>
                    <td>${a.present ? 'Attended' : 'Present'}
                    </td>
                    <td><fmt:formatDate value="${a.time}" pattern="dd/MM/yyyy"/></td>
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
