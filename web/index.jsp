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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome!</title>
        <!--<link rel="stylesheet" href="styles/main.css" type="text/css"/>-->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--<div class="wrapper">-->
        <jsp:include page="nav.jsp" />
        <!--            <h1>Login</h1>
                    <h3>${message}</h3>
                    <form action="Private" method="post">
                        <input type="hidden" name="action" value="attemptLogin">
        
                        <label>user name</label>
                        <input type="text" name="userName" value="<c:out value="" />">
                        <br>
        
                        <label>password</label>
                        <input type="password" name="password" value="<c:out value="" />">
                        <br>
        
                        <input type="submit" value="submit" style="align-content: center;">
                    </form>
                </div>-->
        <hr>
        <div class="w3-content" style="max-width:800px;position:relative">
            <form class="w3-container w3-card-4" action="Private" method="post">
                <input type="hidden" name="action" value="attemptLogin">
                <h2>Login</h2>
                <h3>${message}</h3>
                <div class="w3-section">      
                    <input class="w3-input" type="text" name="userName" value="<c:out value="" />" required>
                    <label>User Name</label>
                </div>
                <div class="w3-section">      
                    <input class="w3-input"type="password" name="password" value="<c:out value="" />" required>
                    <label>Password</label>
                </div>
                <div class="w3-center">
                    <br>
                    <!--<a class="w3-button w3-theme" value="submit">Login</a>-->
                    <input class="w3-button w3-theme" type="submit" value="submit" ">
                </div>
                <hr>
            </form>
        </div>
        <!--</form>-->
    </body>

</html>
