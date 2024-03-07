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
        <meta charset="UTF-8">
        <title>Student Timetable</title>
    </head>
    <body>
        <h2>Student Timetable</h2>
        <form action="studenttimetable" method="GET">
            <input type="hidden" name="id" value="${param.id}"/>
            Period: <input type="date" value="${requestScope.from}" name="from"/> - <input value="${requestScope.to}" type="date" name="to"/> 
            <input type="submit" value="Show"/>
        </form>
        <table border="1">
            <tr>
                <th>Time Slot</th>
                    <c:forEach items="${requestScope.dates}" var="date">
                    <th>${date}</th>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.name}</td>
                    <c:forEach items="${requestScope.dates}" var="date">
                        <td>
                            <c:forEach items="${requestScope.lessions}" var="les">
                                <c:if test="${date eq les.date and les.slot.id eq slot.id}">
                                    ${les.group.name} - ${les.group.subject.name}
                                    <div>
                                        <c:if test="${les.attended}">
                                            Attended
                                        </c:if>
                                        <c:if test="${!les.attended}">
                                            Absent
                                        </c:if>
                                    </div>    
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

