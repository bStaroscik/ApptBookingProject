<%-- 
    Document   : Admin
    Created on : Oct 12, 2022, 6:34:03 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <title>Admin Home Page</title>
    </head>
    <body>
        <div class="wrapper">
        <jsp:include page="/ADMIN/AdminNav.jsp" /> 
        <h1>This is an Admin Page</h1>
        

        <h2>${message}</h2>

        <h1>Welcome to the Admin page! Please choose an option above!</h1>
        
        </div>
    </body>
</html>