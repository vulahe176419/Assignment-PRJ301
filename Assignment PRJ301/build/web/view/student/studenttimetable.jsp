<%-- 
    Document   : studenttimetable
    Created on : 6 Mar 2024, 21:10:47
    Author     : leanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student Timetable</title>
</head>
<body>
    <h2>Student Timetable</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Date</th>
                <th>Subject</th>
                <th>Time</th>
                <th>Room</th>
                <th>Attendance</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${lessions}" var="lession">
                <tr>
                    <td>${lession.date}</td>
                    <td>${lession.group.subject.name}</td>
                    <td>${lession.slot.name}</td>
                    <td>${lession.room.name}</td>
                    <td>
                        <c:if test="${lession.isAttended}">
                            Attended
                        </c:if>
                        <c:if test="${!lession.isAttended}">
                            Absent
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

