<%-- 
    Document   : index
    Created on : Oct 20, 2022, 10:08:47 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>

    </head>
       
    <body>
        <div class="wrapper">
            <h1>Appointment Booking Login!</h1>

            <jsp:include page="nav.jsp" /> 

            <h3><c:out value="${message}" /></h3>
            <div>
                <form action="Private" method="post">
                    <input type="hidden" name="action" value="attemptLogin">

                    <label>user name</label>
                    <input type="text" name="userName" value="<c:out value="" />">
                    <br>

                    <label>password</label>
                    <input type="text" name="password" value="<c:out value="" />">
                    <br>

                    <input type="submit" value="submit">
                </form>
            </div>
        </div>
    </body>

</html>
