<%-- 
    Document   : activitydetail
    Created on : 15 Mar 2024, 20:28:23
    Author     : leanh
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activity detail</title>
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
    </head>
    <body>
        <h1>Activity detail</h1>
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
                        </p>
                    </c:if>
                </c:forEach>
            </td>
        </c:forEach>
    </tr>  
</c:forEach>
<button id="backButton">Back</button>
<script>
    document.getElementById("backButton").addEventListener("click", function () {
        window.history.back();
    });
</script>
</body>
</html>
