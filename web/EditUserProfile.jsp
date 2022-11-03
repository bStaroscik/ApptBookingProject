<%-- 
    Document   : EditUserProfile
    Created on : Oct 26, 2022, 6:51:39 PM
    Author     : Ashbb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="newcss.css" type="text/css"/>
    </head>

    <body>
        <div class="wrapper">
            <h1>Profile Page!</h1>

            <jsp:include page="nav.jsp" />

            <h3><c:out value="${message}"/></h3>  
            <div>
                <p>Username: <c:out value="${user.email}" /></p><!-- Display username -->
                <form action="private" method="post">
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
                    
                    <input type="hidden" name="action" value="submitProfileEdit">
                    <input type="submit" name ="submitProfileEdit" value="Submit Profile Edit">
                    
                    <input type="hidden" name="action" value="logout"> 
                <td><input type="submit" value="Logout"></td>
                </form>
            </div>
        </div>
    </body>

</html>