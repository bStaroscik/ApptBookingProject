<%-- 
    Document   : AdminNewAppt
    Created on : Oct 24, 2022, 3:16:25 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: New Appointment</title>
        <link rel="stylesheet" href="newcss.css" type="text/css"/>
    </head>

    <body>
        <div class="wrapper">
            <h1>Create New Appointment</h1>

            <jsp:include page="AdminNav.jsp" /> 

            <h3>${message}</h3> 
            <h3>${success}</h3>

            <p>${error}</p>
            <div>
                <form action="public" method="post">
                    <input type="hidden" name="action" value="newAppts"> 

                    <label>Appointment Date</label>
                    <input type="text" name="userName" value="<c:out value="${users.username}" />">
                    <br>

                    <label>Appointment Time</label>
                    <input type="text" name="email" value="<c:out value="${users.email}" />">
                    <br>

                    <label>User ID</label>
                    <input type="text" name="password" value="<c:out value="" />">
                    <br>

                    <label>Patient First Name</label>
                    <input type="date" name="birthDate" value="<c:out value="${users.birthDate}" />">
                    <br>
                    
                    <label>Patient Last Name</label>
                    <input type="text" name="userName" value="<c:out value="${users.username}" />">
                    <br>

                    <label>Doctor First Name</label>
                    <input type="text" name="email" value="<c:out value="${users.email}" />">
                    <br>

                    <label>Doctor Last Name</label>
                    <input type="text" name="password" value="<c:out value="" />">
                    <br>

                    <label>Appointment Type</label>
                    <input type="date" name="birthDate" value="<c:out value="${users.birthDate}" />">
                    <br>
                    
                    <label>Reason for Visit</label>
                    <input type="text" name="userName" value="<c:out value="${users.username}" />">
                    <br>

                    <label>Insurance Provider</label>
                    <input type="text" name="email" value="<c:out value="${users.email}" />">
                    <br>

                    <label>Insurance Plan Number</label>
                    <input type="text" name="password" value="<c:out value="" />">
                    <br>

                    <input type="submit" value="submit">
                </form>
            </div>



        </div>
    </body>

</html>

