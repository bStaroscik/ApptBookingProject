<%-- 
    Document   : UserAppointments
    Created on : Oct 26, 2022, 6:15:58 PM
    Author     : Ashbb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <a href="Private?action=editProfile" style="font-size: 25px; color: black;"> Edit Your Profile </a>
            <h1>Current Scheduled Appointments</h1>
            <h2><c:out value='${errorMessage}'/></h2>
            <h2>${message}</h2>
            <div class="center">
                <table style="margin: auto">
                    <thead>
                    <th colspan="8">Appointments</th>
                    </thead>
                    <tr>
                           <td class="tdFormat">Appt. Date</td>
                           <td class="tdFormat">Appt. Time</td>
                           <td class="tdFormat">Appt. Type</td>
                           <td class="tdFormat">Patient Name</td>
                           <td class="tdFormat">Assigned Doctor</td>
                           <td class="tdFormat">Reason for visit</td>
                           <td class="tdFormat">Notes</td>
                           <td class="tdFormat">Edit</td>
                    </tr>
                    <c:forEach var="Appointment" items="${Appointments}">
                        <tr>
                           <td><c:out value='${Appointment.value.apptDate}'/></td>
                           <td><c:out value='${Appointment.value.apptTime}'/></td>
                           <td><c:out value='${Appointment.value.apptType}'/></td>
                           <td><c:out value='${Appointment.value.userFirstName + " " + Appointments.value.userLastName}'/></td>
                           <td><c:out value='${Appointment.value.doctorFirstName + " " + Appointments.value.doctorLastName}'/></td>
                           <td><c:out value='${Appointment.value.reasonForVisit}'/></td>
                           <td><c:out value='${Appointment.value.notes}'/></td>
<!--                           <form action="Private" method="post">
                            <input type="hidden" name="action" value="editNotes"> 
                            <input type="hidden" name="idValue" value="<c:out value='${Appointment.value.apptID}'/>">
                            <td><input type="submit" value="Edit Notes"></td>
                           </form>-->
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </body>
    </div>
</html>