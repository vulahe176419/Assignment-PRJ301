<%-- 
    Document   : studenttimetable
    Created on : 6 Mar 2024, 21:10:47
    Author     : leanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Timetable</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <h2>Student Timetable</h2>
        <form action="studenttimetable" method="GET">
            <input type="hidden" name="id" value="${param.id}"/>
            Period: <input type="date" value="${requestScope.from}" name="from"/> - <input value="${requestScope.to}" type="date" name="to"/> 
            <input type="submit" value="Show"/>
        </form>
        <table border="1px">
            <tr>
                <th>Time Slot</th>
                <c:forEach items="${requestScope.dates}" var="d">
                    <th>${d}</th>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.name}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.atts}" var="att">
                                <c:if test="${att.date eq d and att.slot.id eq slot.id}">
                                    ${att.group.name} - ${att.group.subject.name}<br>
                                    ${att.isPresent ? 'Present' : 'Absent'}<br>
                                    ${att.description}
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>


