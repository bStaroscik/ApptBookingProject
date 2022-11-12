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
                <p>Name: <c:out value="${user.firstName}" /> <c:out value="${user.lastName}" /></p>
                <p>Address: <c:out value="${user.address}" /></p>
                <p>City, State, Zip Code: <c:out value="${user.city}" /> <c:out value="${user.state}" />, <c:out value="${user.zipCode}" /></p>
                <p>Username: <c:out value="${user.email}" /></p>
                
                <table style="margin: auto">
                    <thead>
                    <th colspan="9">Appointments</th>
                    </thead>
                    <tr>
                        <th>Appt Date</th>
                        <th>Appt Time</th>
<!--                        <th>Patient Name</th>-->
                        <th>Doctor Name</th>
                        <th>Appt Type</th>
                        <th>Reason for Visit</th>
                        <th>Insurance Provider</th>
                        <th>Insurance Plan</th>
                        <th>Edit Appt</th>
                    </tr>
                    <c:forEach var="item" items="${appointments}" varStatus="status">
                        <tr>
                            <input type="hidden" name="apptID" value="<c:out value='${item.value.apptID}'/>">
                            <td><c:out value="${item.value.apptDate}" /></td>
                            <td><c:out value="${item.value.apptTime}" /></td>
<!--                            <td><c:out value="${item.value.userFirstName}" /> <c:out value="${item.value.userLastName}" /></td>-->
                            <td><c:out value="${item.value.doctorFirstName}" /> <c:out value="${item.value.doctorLastName}" /></td>
                            <td><c:out value="${item.value.apptType}" /></td>
                            <td><c:out value="${item.value.reasonForVisit}" /></td>
                            <td><c:out value="${item.value.insuranceProvider}" /></td>
                            <td><c:out value="${item.value.insurancePlanNum}" /></td>
                        <form action="Private" method="post">
                            <input type="hidden" name="action" value="editPatientAppointment"> 
                            <input type="hidden" name="idValue" value="<c:out value='${item.value.apptID}'/>">
                            <td><input type="submit" value="Edit Appt"></td>
                        </form>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </body>
    </div>
</html>