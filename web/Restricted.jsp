<%-- 
    Document   : UserAppointments
    Created on : Oct 26, 2022, 6:15:58 PM
    Author     : Ashbb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="wrapper">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Restricted</title>
            <!--<link rel="stylesheet" href="styles/main.css" type="text/css"/>-->
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        </head>
        <jsp:include page="nav.jsp" /> 
        <body>
            <!--            <h1>Restricted</h1>
                        <h3><c:out value='${errorMessage}'/></h3>
                        <h3>${message}</h3>-->

            <div class="w3-center">
                <h2>Restricted</h2>
                <p><c:out value='${errorMessage}'/></p>
                <p>${message}</p>
            </div>
        </body>
    </div>
</html>