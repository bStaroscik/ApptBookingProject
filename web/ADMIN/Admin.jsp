<%-- 
    Document   : Admin
    Created on : Oct 12, 2022, 6:34:03 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        <title>Admin Home Page</title>
    </head>
    <body>
        <jsp:include page="/ADMIN/AdminNav.jsp" /> 
        <hr>
        <div class="w3-content" style="max-width:800px;position:relative">

            <h1>This is an Admin Page</h1>


            <h2>${message}</h2>

            <h1>Welcome to the Admin page! Please choose an option above!</h1>
            <!-- Recent appointments for today will go here -->

        </div>
    </body>
</html>