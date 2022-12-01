<%-- 
    Document   : EditUserProfile
    Created on : Oct 26, 2022, 6:51:39 PM
    Author     : Ashbb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <div class="wrapper">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Profile Page</title>
            <!--<link rel="stylesheet" href="styles/main.css" type="text/css"/>-->
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        </head>
        <jsp:include page="nav.jsp" /> 
        <body>
            <hr>
            <div class="w3-content" style="max-width:800px;position:relative">
                <form class="w3-container w3-card-4" action="Private" method="post">
                    <h2>Profile Page</h2>
                    <p><c:out value='${errorMessage}'/></p>
                    <p>${message}</p>
                    <p>Username: <c:out value="${user.email}" /></p>
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
                        <input type="hidden" name="action" value="submitProfileEdit">
                        <input class="w3-button w3-theme" type="submit" name ="submitProfileEdit" value="Submit Edit">
                    </div>
                    <br>
                </form>
            </div>
            <br><br>
        </body>
</html>
