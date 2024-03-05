<%-- 
    Document   : list
    Created on : 1 Mar 2024, 19:48:21
    Author     : leanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function deleteStudent(id)
            {
                var result = confirm('are you sure?');
                if(result)
                {
                    document.getElementById("frmDelete"+id).submit();
                }
            }
            
        </script>
    </head>
    <body>
        Hello: ${sessionScope.account.displayname} <br/>
        <table border="1px"> 
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Gender</td>
                <td>Dob</td>
                <td>Department</td>
                <td></td>
            </tr>
            <c:forEach items="${requestScope.students}" var="s">
             <tr>
                <td>${s.id}
                    <form id="frmDelete${s.id}" action="delete" method="POST">
                        <input type="hidden" value="${s.id}" name="id"/>
                    </form>
                </td>
                <td>${s.name}</td>
                <td>${s.gender?"male":"female"}</td>
                <td>${s.dob}</td>
                <td>${s.dept.name}</td>
                <td>
                    
                    <input type="button" value="Update"
                           onclick="window.location.href='update?id=${s.id}'"
                           />
                    
                    <input type="button" value="Delete"
                           onclick="deleteStudent(${s.id})"
                           />
                    
                </td>
            </tr>   
            </c:forEach>
        </table>
        <input type="button" value="Insert" 
               onclick="window.location.href='insert'"/>
    </body>
</html>

