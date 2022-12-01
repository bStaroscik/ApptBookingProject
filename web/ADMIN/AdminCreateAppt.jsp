<%-- 
    Document   : AdminCreateAppt
    Created on : Nov 16, 2022, 7:21:22 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Create Appointments</title>
        <!--<link rel="stylesheet" href="styles/main.css" type="text/css"/>-->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    </head>
    <jsp:include page="/ADMIN/AdminNav.jsp" /> 
    <body>
        <hr>
        <div class="w3-content" style="max-width:800px;position:relative">
            <form class="w3-container w3-card-4" action="Admin" method="post">
                <h2>Create Appointment</h2>
                <p>${message}</p> 
                <p>${success}</p>

                <p>${error}</p>
                <div class="w3-section">      
                    <input class="w3-input" type="date" name="apptDate" value="<c:out value="${appointment.apptDate}" />" required>
                    <label>Appointment Date</label>
                </div>
                <div class="w3-section">      
                    <input class="w3-input" type="time" name="apptTime" value="<c:out value="${appointment.apptTime}" />" required>
                    <label>Appointment Time</label>
                </div>
                <div class="w3-section">
                    <label>Patient</label>
                    <select name="patient">
                        <c:forEach items="${patients}" var="patients">
                            <option value="${patients.key} ${patients.value.firstName} ${patients.value.lastName}" /><c:out value="${patients.key} ${patients.value.firstName} ${patients.value.lastName}" /></option>
                        </c:forEach>
                    </select>
                </div>
                <div class="w3-section">
                    <label>Doctor</label>
                    <select name="doctor">
                        <c:forEach items="${doctors}" var="doctor">
                            <option value="${doctor.value.firstName} ${doctor.value.lastName}"><c:out value="${doctor.value.firstName}" /> <c:out value="${doctor.value.lastName}" /></option>
                        </c:forEach>
                    </select>
                </div>
                <div class="w3-section">  
                    <label>Appointment Type</label>
                    <select name="apptType">
                        <c:forEach var="item" items="${appointmentType}">
                            <option value="${item.value.typeID}">${item.value.description}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="w3-section">      
                    <input class="w3-input" type="text" name="reasonForVisit" value="<c:out value="${appointment.reasonForVisit}" />" required>
                    <label>Reason for Visit</label>
                </div>
                <div class="w3-section">      
                    <input class="w3-input" type="text" name="insuranceProvider" value="<c:out value="${appointment.insuranceProvider}" />" required>
                    <label>Insurance Provider</label>
                </div>
                <div class="w3-section">      
                    <input class="w3-input" type="text" name="insurancePlanNum" value="<c:out value="${appointment.insurancePlanNum}" />" required>
                    <label>Insurance Plan Number</label>
                </div>
                <div class="w3-center">
                    <br>
                    <input type="hidden" name="action" value="submitNewAppt"> 
                    <input class="w3-button w3-theme" type="submit" name="submitNewAppt" value="submit">
                </div>
                    <br>
            </form>
        </div>
        <br><br>
    </body>
</html>