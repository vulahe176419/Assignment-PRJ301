<%-- 
    Document   : att
    Created on : 2 Mar 2024, 20:32:44
    Author     : leanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>University Academic Portal</title>
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
    </head>
    <body>

        <form action="att" method="POST">
            <input type="hidden" name="id" value="${param.id}"/>
            <table border="1px">
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Presented</td>
                    <td>Description</td>
                    <td>Time</td>
                </tr>
                <c:forEach items="${requestScope.atts}" var="a">
                    <tr>
                        <td>${a.student.id}</td>
                        <td>${studentDetails[a.student.name]}</td>
                        <td>
                            <input 
                                ${!a.present?"checked=\"checked\"":""}
                                type="radio" value="no" name="present${a.student.id}"/> No
                            <input type="radio"
                                   ${a.present?"checked=\"checked\"":""}
                                   value="yes" name="present${a.student.id}" /> Yes
                        </td>
                        <td>
                            <input name="description${a.student.id}" type="text" value="${a.description}"/>
                        </td>
                        <td><fmt:formatDate value="${a.time}" pattern="HH:mm - dd/MM/yyyy"/></td>
                    </tr>   
                </c:forEach>
            </table>
            <input type="submit" value="Save"/><br>
            <a href="timetable?id=1" class="backButton">Back</a>
        </form>
        <button id="backButton">Back</button>
        <script>
            document.getElementById("backButton").addEventListener("click", function () {
                window.history.back();
            });
        </script>
    </body>
</html>

