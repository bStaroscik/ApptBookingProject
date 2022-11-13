<%-- 
    Document   : register
    Created on : Oct 11, 2022, 10:43:28 AM
    Author     : Haiyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <div class="wrapper">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>User Appointments</title>
            <link rel="stylesheet" href="styles/main.css" type="text/css"/>
        </head>
        <jsp:include page="nav.jsp" /> 
        <body>
            <h1>Create Appointment</h1>

            <h3 style="color:red">${message}</h3> 
            <h3>${success}</h3>

            <p>${error}</p>

            <div class="center">
                <p>Name: <c:out value="${user.firstName}" /> <c:out value="${user.lastName}" /></p>
                <p>Address: <c:out value="${user.address}" /></p>
                <p>City, State, Zip Code: <c:out value="${user.city}" /> <c:out value="${user.state}" />, <c:out value="${user.zipCode}" /></p>
                <p>Username: <c:out value="${user.email}" /></p>
            </div>
            <form action="Private" method="post">

                <label>Appt Date</label>
                <input type="date" name="apptDate" value="<c:out value="${appointment.apptDate}" />">
                <br>

                <label>Appt Time</label>
                <input type="time" name="apptTime" value="<c:out value="${appointment.apptTime}" />">
                <br>

                <label>User ID</label>
                <input type="text" name="userID" value="<c:out value="${user.userID}" />" readOnly>
                <br>

                <label>First Name</label>
                <input type="text" name="firstName" value="<c:out value="${user.firstName}" />" readOnly>
                <br>

                <label>Last Name</label>
                <input type="text" name="lastName" value="<c:out value="${user.lastName}" />" readOnly>
                <br>

                <label>Doctor First Name</label>
                <select name="doctor">
                    <c:forEach items="${doctors}" var="doctor">
                        <option value="${doctor.value.firstName} ${doctor.value.lastName}"><c:out value="${doctor.value.firstName}" /> <c:out value="${doctor.value.lastName}" /></option>
                    </c:forEach>
                </select>
                <br>
                
                <label>Appt Type ID</label>
                <select name="apptType">
                    <c:forEach var="item" items="${appointmentType}">
                        <option value="${item.value.typeID}">${item.value.description}</option>
                    </c:forEach>
                </select>
                <br>

                <label>Reason for Visit</label>
                <input type="text" name="reasonForVisit" value="<c:out value="${appointment.reasonForVisit}" />">
                <br>

                <label>Insurance Provider</label>
                <input type="text" name="insuranceProvider" value="<c:out value="${appointment.insuranceProvider}" />">
                <br>

                <label>Insurance Plan Number</label>
                <input type="text" name="insurancePlanNum" value="<c:out value="${appointment.insurancePlanNum}" />">
                <br>

                <input type="hidden" name="action" value="submitCreateAppointment"> 
                <input type="submit" name="submitCreateAppointment" value="submit">
            </form>
        </body>
    </div>
</html>
