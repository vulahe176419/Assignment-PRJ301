<%-- 
    Document   : timetable
    Created on : 2 Mar 2024, 20:29:07
    Author     : leanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lecturer Timetable</title>
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
    </head>
    <body class="lec-timetable">
        <h1 class="lec-heading">Lecturer Timetable</h1>
        <form action="timetable" method="GET" class="lec-form">
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
                                    <span class="lec-group-name">${les.group.name}</span> - <a href="slotdetail?id=${les.id}" class="lec-link">${les.group.subject.name}</a><br>
                                    <span class="lec-room-name">at ${les.room.name}</span> <br>
                                    <c:set var="now" value="<%= new java.util.Date() %>"/>
                                    <c:set var="dateFormat" value="<%= new java.text.SimpleDateFormat(\"yyyy-MM-dd\") %>"/>
                                    <c:set var="today" value="${dateFormat.format(now)}" />
                                    <c:choose>
                                        <c:when test="${today lt les.date}">
                                            <span class="lec-status">Not yet</span>
                                        </c:when>
                                        <c:when test="${today gt les.date}">
                                            <span class="lec-status-at">Complete</span>
                                        </c:when>  
                                        <c:when test="${(today eq les.date) and (les.attended)}">
                                            <a href="att?id=${les.id}" class="lec-link">Edit</a>
                                        </c:when>
                                        <c:when test="${(today eq les.date) and (!les.attended)}">
                                            <a href="att?id=${les.id}" class="lec-link">Take</a>
                                        </c:when>
                                    </c:choose>          
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>  
            </c:forEach>
        </table> 
        <div class="lec-footer">
            <a href="lecturerhome" class="lec-link">Back to Home</a><br>
        </div>
    </body>
</html>
