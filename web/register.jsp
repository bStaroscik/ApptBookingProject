<%-- 
    Document   : register
    Created on : Oct 11, 2022, 10:43:28 AM
    Author     : Haiyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <!--<link rel="stylesheet" href="styles/main.css" type="text/css"/>-->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    </head>
    <jsp:include page="nav.jsp" /> 

    <body>
        <hr>
        <div class="w3-content" style="max-width:800px;position:relative">
            <form class="w3-container w3-card-4" action="Public" method="post">
                <input type="hidden" name="action" value="register">
                <h2>Register</h2>
                <p>${message}</p>
                <div class="w3-section">      
                    <input class="w3-input" type="text" name="firstName" value="<c:out value="${users.firstName}" />" required>
                    <label>First Name</label>
                </div>
                    <div class="w3-section">      
                    <input class="w3-input" type="text" name="lastName" value="<c:out value="${users.lastName}" />" required>
                    <label>Last Name</label>
                </div>
                    <div class="w3-section">      
                    <input class="w3-input" type="text" name="address" value="<c:out value="${users.address}" />" required>
                    <label>Address</label>
                </div>
                    <div class="w3-section">      
                    <input class="w3-input" type="text" name="city" value="<c:out value="${users.city}" />" required>
                    <label>City</label>
                </div>
                    <div class="w3-section">      
                    <input class="w3-input" type="text" name="state" value="<c:out value="${users.state}" />" required>
                    <label>State</label>
                </div>
                    <div class="w3-section">      
                    <input class="w3-input" type="text" name="zipCode" value="<c:out value="${users.zipCode}" />" required>
                    <label>Zip Code</label>
                </div>
                    <div class="w3-section">      
                    <input class="w3-input" type="tel" name="phoneNumber" value="<c:out value="${users.phoneNumber}" />" required>
                    <label>Phone Number</label>
                </div>
                    <div class="w3-section">      
                    <input class="w3-input" type="email" name="email" value="<c:out value="${users.email}" />" required>
                    <label>Email Address</label>
                </div>
                <div class="w3-section">      
                    <input class="w3-input" type="text" name="password" value="<c:out value="" />" required>
                    <label>Password</label>
                </div>
                <div class="w3-center">
                    <br>
                    <input class="w3-button w3-theme" type="submit" value="submit" ">
                </div>
                <hr>
            </form>
        </div>
                    
                    
<!--        <div  class="wrapper">
            <h1>Registration</h1>

            <h3>${message}</h3> 
            <h3>${success}</h3>

            <p>${error}</p>
            <div>
                <form action="Public" method="post">
                    <input type="hidden" name="action" value="register"> 

                    <label>First Name</label>
                    <input type="text" name="firstName" value="<c:out value="${users.firstName}" />">
                    <br>

                    <label>Last Name</label>
                    <input type="text" name="lastName" value="<c:out value="${users.lastName}" />">
                    <br>

                    <label>Address</label>
                    <input type="text" name="address" value="<c:out value="${users.address}" />">
                    <br>

                    <label>City</label>
                    <input type="text" name="city" value="<c:out value="${users.city}" />">
                    <br>

                    <label>State</label>
                    <input type="text" name="state" value="<c:out value="${users.state}" />">
                    <br>

                    <label>Zip Code</label>
                    <input type="text" name="zipCode" value="<c:out value="${users.zipCode}" />">
                    <br>

                    <label>Phone Number</label>
                    <input type="text" name="phoneNumber" value="<c:out value="${users.phoneNumber}" />">
                    <br>

                    <label>Email</label>
                    <input type="text" name="email" value="<c:out value="${users.email}" />">
                    <br>

                    <label>Password</label>
                    <input type="text" name="password" value="<c:out value="" />">
                    <br>

                    <input type="submit" value="submit">
                </form>
            </div>
        </div>-->
    </body>

</html>
