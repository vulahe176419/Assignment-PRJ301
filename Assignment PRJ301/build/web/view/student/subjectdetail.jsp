<%-- 
    Document   : subjectdetail
    Created on : 17 Mar 2024, 17:32:16
    Author     : leanh
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject Detail</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
    </head>
    <body class="subject-detail-body">
        <h1>Subject Detail</h1>
        <table class="subdetail-table" border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>Credit</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.subjects}" var="sub">
                    <tr>
                        <td>${sub.id}</td>
                        <td>${sub.name}</td>
                        <td>${subjectDetails[sub.name]}</td>
                        <td>${sub.credit}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button id="backButton">Back</button>
        <script>
            document.getElementById("backButton").addEventListener("click", function () {
                window.history.back();
            });
        </script>
    </body>
</html>
