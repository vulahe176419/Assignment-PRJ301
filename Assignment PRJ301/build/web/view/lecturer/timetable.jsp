<%-- 
    Document   : timetable
    Created on : 2 Mar 2024, 20:29:07
    Author     : leanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Lecturer Timetable</h2>
        <form action="timetable" method="GET">
            <input type="hidden" name="id" value="${param.id}"/>
            Period: <input type="date" value="${requestScope.from}" name="from"/> - <input value="${requestScope.to}" type="date" name="to"/> 
        <input type="submit" value="Show"/>
        </form>
        <table border="1px">
            <tr>
                <td> </td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>${d}</td>
                </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
              <tr>
                <td>${slot.name}</td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        <c:forEach items="${requestScope.lessions}" var="les">
                            <c:if test="${d eq les.date and les.slot.id eq slot.id}">
                                ${les.group.name} - ${les.group.subject.name}
                                <a href="att?id=${les.id}"> 
                                    <c:if test="${les.attended}">
                                        Edit
                                    </c:if>
                                   <c:if test="${!les.attended}">
                                        Take
                                    </c:if>     
                                </a>
                            </c:if>
                        </c:forEach>
                    </td>
                </c:forEach>
            </tr>  
            </c:forEach>
        </table>    
    </body>
</html>
