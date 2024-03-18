<%-- 
    Document   : slotdetail
    Created on : 17 Mar 2024, 16:57:44
    Author     : leanh
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Slot detail</title>
    </head>
    <body>
        <h1>Slot detail</h1>
        <c:forEach items="${requestScope.slots}" var="slot">
            <c:forEach items="${requestScope.dates}" var="d">
            <td>
                <c:forEach items="${requestScope.lessions}" var="les">
                    <c:if test="${d eq les.date and les.slot.id eq slot.id}">
                        <p>Date:  <fmt:formatDate value="${d}" pattern="EEEE - dd/MM/yyyy"/></p>
                        <p>Slot: ${slot.name}</p>
                        <p>Student Group: ${les.group.name}</p>
                        <p>Instructor: ${lecturerDetails[les.lecturer.name]}</p>
                        <p>Course: ${subjectDetails[les.group.subject.name]}</p>
                        <p>Room: ${les.room.name}</p>
                        <p>Attendance: 
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
                        </p>
                    </c:if>
                </c:forEach>
            </td>
        </c:forEach>
    </tr>  
</c:forEach>
<a href="timetable?id=1" class="back-button">Back</a>
</body>
</html>
