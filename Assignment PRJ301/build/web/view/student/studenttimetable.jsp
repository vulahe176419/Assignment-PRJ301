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
        
    </head>
    <body>
        <h2>Student Timetable</h2>
        <form action="studenttimetable" method="GET">
            <input type="hidden" name="id" value="${param.id}"/>
            From <input type="date" value="${requestScope.from}" name="from"/> to <input value="${requestScope.to}" type="date" name="to"/> 
        <input type="submit" value="View"/>
        </form>
        <table border="1px">
            <tr>
                <td>Time Slot</td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td><fmt:formatDate value="${d}" pattern="EEEE"/>
                        <br>
                        <fmt:formatDate value="${d}" pattern="dd/MM/yyyy"/></td>
                </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
              <tr>
                <td>${slot.name}</td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        <c:forEach items="${requestScope.lessions}" var="les">
                            <c:if test="${d eq les.date and les.slot.id eq slot.id}">
                                <a href="activitydetail?id=${les.id}">${les.group.subject.name}</a>
                                at ${les.room.name}<br>
                               <c:if test="${les.attended}">
                                   Attended
                               </c:if>
                               <c:if test="${!les.attended}">
                                   Not yet
                               </c:if>     
                            </c:if>
                        </c:forEach>
                    </td>
                </c:forEach>
            </tr>  
            </c:forEach>
        </table>    
    </body>
</html>


