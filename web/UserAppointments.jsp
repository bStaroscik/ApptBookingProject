<%-- 
    Document   : UserAppointments
    Created on : Oct 26, 2022, 6:15:58 PM
    Author     : Ashbb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <body>
        <div class="w3-container">
            <div class="w3-center">
                <p><c:out value='${errorMessage}'/></p>
                <p>${message}</p>
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
                        <input type="hidden" name="apptID" value="<c:out value='${item.value.apptID}'/>">
                        <fmt:parseDate value="${item.value.apptDate}" pattern="yyyy-MM-dd" var="apptDate" type="date"/>
                        <tr>
                            <td><fmt:formatDate pattern="MMM. dd, yyyy" value="${apptDate}"/></td>
                            <td><c:out value="${item.value.apptTime}" /></td>
                            <td><c:out value="${item.value.doctorFirstName}" /> <c:out value="${item.value.doctorLastName}" /></td>
                            <td>
                                <%--<c:out value="${item.value.apptType}" />--%>
                                <c:choose>
                                    <c:when test="${item.value.apptType == '2'}">
                                        Chronic Care Visit
                                    </c:when> 
                                    <c:when test="${item.value.apptType == '3'}">
                                        Diagnostic and Labs Visit
                                    </c:when> 
                                    <c:when test="${item.value.apptType == '4'}">
                                        Follow-Up Visit
                                    </c:when> 
                                    <c:when test="${item.value.apptType == '5'}">
                                        Inpatient Procedure Visit
                                    </c:when> 
                                    <c:when test="${item.value.apptType == '6'}">
                                        Medication Update Visit
                                    </c:when>
                                    <c:when test="${item.value.apptType == '7'}">
                                        Mental Health Visit
                                    </c:when> 
                                    <c:when test="${item.value.apptType == '8'}">
                                        New Patient Visit
                                    </c:when> 
                                    <c:when test="${item.value.apptType == '9'}">
                                        Physical Visit
                                    </c:when> 
                                    <c:when test="${item.value.apptType == '10'}">
                                        Routine Visit
                                    </c:when> 
                                    <c:otherwise>
                                        Well Woman Visit
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><c:out value="${item.value.reasonForVisit}" /></td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.value.confirmed == true}">
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
                    </tbody>
                </table>
            </div>
        </div>
        <br><br>
    </body>
</html>