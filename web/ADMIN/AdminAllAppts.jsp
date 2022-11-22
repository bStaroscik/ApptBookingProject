<%-- 
    Document   : AdminAllAppts
    Created on : Oct 24, 2022, 1:21:22 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
        <title>Admin: All Appointments</title>
        
    </head>

    <body>
        <div class="wrapper">
            <h1>All Appointments</h1>

            <jsp:include page="/ADMIN/AdminNav.jsp" />
            <br>

            <table id="appointments">
                <tr>
                    <th>Appt ID</th>
                    <th>Appt Date</th>
                    <th>Appt Time</th>
                    <th>User Name</th>
                    <th>Patient First Name</th>
                    <th>Patient Last Name</th>
                    <th>Doctor First Name</th>
                    <th>Doctor Last Name</th>
                    <th>Appt Type</th>
                    <th>Reason for Visit</th>
                    <th>Insurance Provider</th>
                    <th>Insurance Plan</th>
                </tr>

                <c:forEach var="item" items="${appointments}" varStatus="status">
                    <tr>
                        <td><c:out value="${item.key}" /></td>
                        <td><c:out value="${item.value.apptDate}" /></td>
                        <td><c:out value="${item.value.apptTime}" /></td>
                        <td><c:out value="${item.value.userID}" /></td>
                        <td><c:out value="${item.value.userFirstName}" /></td>
                        <td><c:out value="${item.value.userLastName}" /></td>
                        <td><c:out value="${item.value.doctorFirstName}" /></td>
                        <td><c:out value="${item.value.doctorLastName}" /></td>
                        <td><c:out value="${item.value.apptType}" /></td>
                        <td><c:out value="${item.value.reasonForVisit}" /></td>
                        <td><c:out value="${item.value.insuranceProvider}" /></td>
                        <td><c:out value="${item.value.insurancePlanNum}" /></td>
                    </tr>
                </c:forEach>  
            </table>
            <form>
                <input type="hidden" name="action" value="logOut">
                <input type="submit" name ="logOut" value="Log Out">
            </form>
        </div>
    </body>

</html>
