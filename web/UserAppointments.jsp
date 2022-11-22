<%-- 
    Document   : UserAppointments
    Created on : Oct 26, 2022, 6:15:58 PM
    Author     : Ashbb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--<div class="wrapper">-->
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>User Appointments</title>
            <!--<link rel="stylesheet" href="styles/main.css" type="text/css"/>-->
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        </head>
        <jsp:include page="nav.jsp" /> 
        <body>
            <div class="w3-container">
                <div class="w3-center">
<!--                    <h2>Current Scheduled Appointments</h2>-->
                    <h3><c:out value='${errorMessage}'/></h3>
                    <h3>${message}</h3>
                    <p>Name: <c:out value="${user.firstName}" /> <c:out value="${user.lastName}" /></p>
                    <p>Address: <c:out value="${user.address}" /></p>
                    <p>City, State, Zip Code: <c:out value="${user.city}" /> <c:out value="${user.state}" />, <c:out value="${user.zipCode}" /></p>
                    <p>Username: <c:out value="${user.email}" /></p>
                </div>
                <div class="w3-responsive w3-card-4">
                    <h2 class="w3-center">Current Scheduled Appointments</h2>
                    <table class="w3-table w3-striped w3-bordered">
                        <thead>
                            <tr class="w3-theme">
                                <th>Appt Date</th>
                                <th>Appt Time</th>
                                <th>Doctor Name</th>
                                <th>Appt Type</th>
                                <th>Reason for Visit</th>
                                <th>Confirmed</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${appointments}" varStatus="status">
                            <tr>
                            <input type="hidden" name="apptID" value="<c:out value='${item.value.apptID}'/>">
                            <td><c:out value="${item.value.apptDate}" /></td>
                            <td><c:out value="${item.value.apptTime}" /></td>
                            <td><c:out value="${item.value.doctorFirstName}" /> <c:out value="${item.value.doctorLastName}" /></td>
                            <td><c:out value="${item.value.apptType}" /></td>
                            <td><c:out value="${item.value.reasonForVisit}" /></td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.value.confirmed == '1'}">
                                        Yes (this isn't working correctly)
                                    </c:when>    
                                    <c:otherwise>
                                        No
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <form action="Private" method="post">
                                <input type="hidden" name="action" value="editPatientAppointment"> 
                                <input type="hidden" name="idValue" value="<c:out value='${item.value.apptID}'/>">
                                <td><input type="submit" value="Edit Appt"></td>
                            </form>
                            <form action="Private" method="post">
                                <input type="hidden" name="action" value="cancelPatientAppointment"> 
                                <input type="hidden" name="idValue" value="<c:out value='${item.value.apptID}'/>">
                                <td><input type="submit" value="Cancel Appt"></td>
                            </form>
                            </tr>
                            <td  style="display:none;"><c:out value="${item.value.insuranceProvider}" /></td>
                            <td  style="display:none;"><c:out value="${item.value.insurancePlanNum}" /></td>
                        </c:forEach>
                            
                        </tbody>
                    </table>
                </div>




<!--                <h1>Current Scheduled Appointments</h1>
                <h3><c:out value='${errorMessage}'/></h3>
                <h3>${message}</h3>
                <div class="center">
                    <p>Name: <c:out value="${user.firstName}" /> <c:out value="${user.lastName}" /></p>
                    <p>Address: <c:out value="${user.address}" /></p>
                    <p>City, State, Zip Code: <c:out value="${user.city}" /> <c:out value="${user.state}" />, <c:out value="${user.zipCode}" /></p>
                    <p>Username: <c:out value="${user.email}" /></p>

                    <table style="margin: auto;">
                                            <thead>
                                            <th colspan="8">Appointments</th>
                                            </thead>
                        <tr>
                            <th>Appt Date</th>
                            <th>Appt Time</th>
                            <th>Doctor Name</th>
                            <th>Appt Type</th>
                            <th>Reason for Visit</th>
                            <th>Confirmed</th>
                                                    <th>Insurance Provider</th>
                                                    <th>Insurance Plan</th>
                            <th></th>
                            <th></th>
                        </tr>
                        <c:forEach var="item" items="${appointments}" varStatus="status">
                            <tr>
                            <input type="hidden" name="apptID" value="<c:out value='${item.value.apptID}'/>">
                            <td><c:out value="${item.value.apptDate}" /></td>
                            <td><c:out value="${item.value.apptTime}" /></td>
                                <td><c:out value="${item.value.userFirstName}" /> <c:out value="${item.value.userLastName}" /></td>
                            <td><c:out value="${item.value.doctorFirstName}" /> <c:out value="${item.value.doctorLastName}" /></td>
                            <td><c:out value="${item.value.apptType}" /></td>
                            <td><c:out value="${item.value.reasonForVisit}" /></td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.value.confirmed=='1'}">
                                        Yes
                                    </c:when>    
                                    <c:otherwise>
                                        No
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <form action="Private" method="post">
                                <input type="hidden" name="action" value="editPatientAppointment"> 
                                <input type="hidden" name="idValue" value="<c:out value='${item.value.apptID}'/>">
                                <td><input type="submit" value="Edit Appt"></td>
                            </form>
                            <form action="Private" method="post">
                                <input type="hidden" name="action" value="cancelPatientAppointment"> 
                                <input type="hidden" name="idValue" value="<c:out value='${item.value.apptID}'/>">
                                <td><input type="submit" value="Cancel Appt"></td>
                            </form>
                            </tr>
                            <td  style="display:none;"><c:out value="${item.value.insuranceProvider}" /></td>
                            <td  style="display:none;"><c:out value="${item.value.insurancePlanNum}" /></td>
                        </c:forEach>

                    </table>
                </div>-->
        </body>
    <!--</div>-->
</html>