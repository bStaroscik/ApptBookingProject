<%-- 
    Document   : AdminCreateAppt
    Created on : Nov 16, 2022, 7:21:22 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <title>Admin: Create Appointment</title>
    </head>
    <body>
        <div clase="wrapper">
        <jsp:include page="/ADMIN/AdminNav.jsp" /> 
        <h1>Create a new Appointment</h1>
        <h3 style="color: red">${message}</h3>
        <h3>${success}</h3>
        
        <p>${error}</p>
        
        <form action="Admin" method="post">
            <label>Appt Date</label>
            <input type="date" name="apptDate" value="<c:out value="${appointment.apptDate}" />">
            <br>

            <label>Appt Time</label>
            <input type="time" name="apptTime" value="<c:out value="${appointment.apptTime}" />">
            <br>
            
            <label>Patient</label>
            <select name="patient">
                <c:forEach items="${patients}" var="patients">
                    <option value="${patient.value.key} ${patients.value.firstName} ${patients.value.lastName}"><c:out value="${patient.value.key}" /><c:out value="${patient.value.firstName}" /><c:out value="${patient.value.lastName}" /></option>
                </c:forEach>
            </select>
            <br>
            
            <label>Doctor</label>
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
            
            <input type="hidden" name="action" value="submitNewAppt"> 
            <input type="submit" name="submitNewAppt" value="submit">
        </form>
        </div>
    </body>
</html>

                

                

                
            </form>
        </body>
    </div>
</html>
