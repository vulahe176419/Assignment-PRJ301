<%-- 
    Document   : studenttimetable
    Created on : 6 Mar 2024, 21:10:47
    Author     : leanh
--%>

<%@ page import="entity.Attendence" %>
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
                                <c:if test="${les.slot.id eq slot.id and les.date eq date}">
                                    ${les.group.name} - ${les.group.subject.name}
                                    <div class="attendance">
                                        <c:forEach items="${les.atts}" var="attendance" varStatus="status">
                                            <c:if test="${status.index eq 0}">
                                                <c:if test="${attendance.isPresent()}">
                                                    <span class="attended">Attended</span>
                                                </c:if>
                                                <c:if test="${!attendance.isPresent()}">
                                                    <span class="absent">Absent</span>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
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


