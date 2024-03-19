<%-- 
    Document   : studenttimetable
    Created on : 6 Mar 2024, 21:10:47
    Author     : leanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Timetable</title>
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
    </head>
    <body class="lec-timetable">
        <h1 class="lec-heading">Student Timetable</h1>
        <form action="studenttimetable" method="GET" class="lec-form">
            <input type="hidden" name="id" value="${param.id}"/>
            From <input type="date" value="${requestScope.from}" name="from"/> to <input value="${requestScope.to}" type="date" name="to"/> 
            <input type="submit" value="View" class="lec-button"/>
        </form>
        <table class="lec-table" border="1px">
            <tr>
                <td class="lec-table-heading">Time Slot</td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td class="lec-table-heading"><fmt:formatDate value="${d}" pattern="EEEE"/>
                        <br>
                        <fmt:formatDate value="${d}" pattern="dd/MM/yyyy"/></td>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td class="lec-slot-name">${slot.name}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.lessions}" var="les">
                                <c:if test="${d eq les.date and les.slot.id eq slot.id}">
                                    <a href="activitydetail?id=${les.id}" class="lec-link">${les.group.subject.name}</a>
                                    at ${les.room.name}<br>
                                    <c:set var="now" value="<%= new java.util.Date() %>"/>
                                    <c:set var="dateFormat" value="<%= new java.text.SimpleDateFormat(\"yyyy-MM-dd\") %>"/>
                                    <c:set var="today" value="${dateFormat.format(now)}" />
                                    <c:choose>
                                        <c:when test="${today lt les.date}">
                                            <span class="lec-status">Not yet</span>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${(today eq les.date) or (today gt les.date)}">
                                                <c:choose>
                                                    <c:when test="${les.attended}">
                                                        <span class="lec-status-at">Attended</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="lec-status-abs">Absent</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>     
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>  
            </c:forEach>
        </table>
        <a href="studenthome" class="backButton">Back</a>
    </body>
</html>
