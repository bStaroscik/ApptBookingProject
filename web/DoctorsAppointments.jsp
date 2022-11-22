<%-- 
    Document   : profile
    Created on : Oct 12, 2022, 6:45:25 PM
    Author     : majle
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Appointments</title>
        <!--<link rel="stylesheet" href="styles/main.css" type="text/css"/>-->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    </head>
    <jsp:include page="nav.jsp" /> 
    <br>
    <body>
        <div class="w3-container">
            <div class="w3-responsive w3-card-4">
                <h2 class="w3-center">Current Scheduled Appointments</h2>
                <table class="w3-table w3-striped w3-bordered">
                    <thead>
                        <tr class="w3-theme">
                            <td>Appt. Date</td>
                            <td>Appt. Time</td>
                            <td>Appt. Type</td>
                            <td>Patient Name</td>
                            <td>Assigned Doctor</td>
                            <td>Reason for visit</td>
                            <td>Notes</td>
                            <td>Edit</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="Appointment" items="${Appointments}">
                            <tr>
                                <td><c:out value='${Appointment.value.apptDate}'/></td>
                                <td><c:out value='${Appointment.value.apptTime}'/></td>
                                <td><c:out value='${Appointment.value.apptType}'/></td>
                                <td><c:out value='${Appointment.value.userFirstName}'/> <c:out value='${Appointment.value.userLastName}'/></td>
                                <td><c:out value='${Appointment.value.doctorFirstName}'/> <c:out value='${Appointment.value.doctorLastName}'/></td>
                                <td><c:out value='${Appointment.value.reasonForVisit}'/></td>
                                <td><c:out value='${Appointment.value.notes}'/></td>
                        <form action="Private" method="post">
                            <input type="hidden" name="action" value="editNotes"> 
                            <input type="hidden" name="idValue" value="<c:out value='${Appointment.value.apptID}'/>">
                            <td><input type="submit" value="Edit Notes"></td>
                        </form>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>






</html>
