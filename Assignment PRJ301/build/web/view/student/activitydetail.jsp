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
                            <c:if test="${les.attended}">
                                Attended
                            </c:if>
                            <c:if test="${!les.attended}">
                                Not yet
                            </c:if>
                        </p>
                    </c:if>
                </c:forEach>
            </td>
        </c:forEach>
    </tr>  
</c:forEach>
</body>
</html>
