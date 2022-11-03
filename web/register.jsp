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
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    </head>
    <jsp:include page="nav.jsp" /> 

    <body>
        <div  class="wrapper">
            <h1>Registration</h1>

            <h3 style="color:red">${message}</h3> 
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
        </div>
    </body>

</html>
