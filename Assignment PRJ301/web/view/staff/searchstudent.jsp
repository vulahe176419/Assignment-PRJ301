<%-- 
    Document   : searchstudent
    Created on : 19 Mar 2024, 18:52:05
    Author     : leanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
    </head>
    <body>
        <form id="frmSearch" action="searchstudent" method="GET"> 
        </form>
        <table border="1px"> 
            <tr>
                <td>Id</td>
                <td>Name</td>
            </tr>
            <c:forEach items="${requestScope.students}" var="s">
             <tr>
                <td>${s.id}
                    <form id="frmDelete${s.id}" action="deletestudent" method="POST">
                        <input type="hidden" value="${s.id}" name="id"/>
                    </form>
                </td>
                <td>${s.name}</td>
                <td>
                    
                    <input type="button" value="Update"
                           onclick="window.location.href='updatestudent?id=${s.id}'"
                           />
                    
                    <input type="button" value="Delete"
                           onclick="deleteStudent(${s.id})"
                           />
                    
                </td>
            </tr>   
            </c:forEach>
        </table>
    </body>
</html>
