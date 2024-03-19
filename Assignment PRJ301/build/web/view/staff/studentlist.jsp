<%-- 
    Document   : studentmanagement
    Created on : 19 Mar 2024, 18:24:31
    Author     : leanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
        <title>Student Management</title>
        <script>
            function deleteStudent(id)
            {
                var result = confirm('are you sure?');
                if (result)
                {
                    document.getElementById("frmDelete" + id).submit();
                }
            }

        </script>
    </head>
    <body class="stulist-body">
        <h1>Student Management</h1>
        <a class="backButton" href="staffhome">Back</a>
        <input class="insert-button" type="button" value="Insert" 
               onclick="window.location.href = 'insertstudent'"/>
        <table class="stulist-tb" border="1px"> 
            <tr>
                <td>Id</td>
                <td>Username</td>
                <td>Full Name</td>
                <td>Update Information</td>
                <td>Delete Student</td>
            </tr>
            <c:forEach items="${requestScope.students}" var="s">
                <tr>
                    <td>${s.id}
                        <form id="frmDelete${s.id}" action="deletestudent" method="POST">
                            <input type="hidden" value="${s.id}" name="id"/>
                        </form>
                    </td>
                    <td>${s.name}</td>
                    <td>${studentDetails[s.name]}</td>
                    <td>
                        <input class="update-button" type="button" value="Update"
                               onclick="window.location.href = 'updatestudent?id=${s.id}'"
                               />
                    </td> 
                    <td>
                        <input class="delete-button" type="button" value="Delete"
                               onclick="deleteStudent(${s.id})"
                               />
                    </td>
                </tr>   
            </c:forEach>
        </table>
        
    </body>
</html>
