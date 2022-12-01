<%-- 
    Document   : Admin
    Created on : Oct 12, 2022, 6:34:03 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        <title>Admin Home Page</title>
    </head>
    <jsp:include page="/ADMIN/AdminNav.jsp" />
    <body>
        <div class="w3-container">
            <div class="w3-center">
                <!--<p>This is an Admin Page</p>-->
                <h2>Welcome to the Admin page! Please choose an option above!</h2>
                <p>${message}</p>
                <!-- Recent appointments for today will go here -->
            </div>
            <div class="w3-responsive w3-card-4">
                <h2 class="w3-center">Today's Scheduled Appointments</h2>
                <!--<table class="w3-table w3-striped w3-bordered">-->
                <table id="appointments" class="w3-table w3-striped w3-bordered">
                    <thead>
                        <tr class="w3-theme">
                            <th>Appt ID</th>
                            <th>Appt Date</th>
                            <th>Appt Time</th>
                            <!--<th>User Name</th>-->
                            <th>Patient Name</th>
                            <!--<th>Patient Last Name</th>-->
                            <th>Doctor Name</th>
                            <!--<th>Doctor Last Name</th>-->
                            <th>Appt Type</th>
                            <th>Reason for Visit</th>
                            <th>Insurance Provider</th>
                            <th>Insurance Plan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${appointments}" varStatus="status">
                            <tr>
                                <td><c:out value="${item.key}" /></td>
                                <td><c:out value="${item.value.apptDate}" /></td>
                                <td><c:out value="${item.value.apptTime}" /></td>
                                <!--<td><c:out value="${item.value.userID}" /></td>-->
                                <td><c:out value="${item.value.userFirstName}" /> <c:out value="${item.value.userLastName}" /></td>
                                <!--<td><c:out value="${item.value.userLastName}" /></td>-->
                                <td><c:out value="${item.value.doctorFirstName}" /> <c:out value="${item.value.doctorLastName}" /></td>
                                <!--<td><c:out value="${item.value.doctorLastName}" /></td>-->
                                <td><c:out value="${item.value.apptType}" /></td>
                                <td><c:out value="${item.value.reasonForVisit}" /></td>
                                <td><c:out value="${item.value.insuranceProvider}" /></td>
                                <td><c:out value="${item.value.insurancePlanNum}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <br><br>
    </body>
</html>