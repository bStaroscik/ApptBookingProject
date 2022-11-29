<%-- 
    Document   : AdminAllAppts
    Created on : Oct 24, 2022, 1:21:22 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        <title>Admin: All Appointments</title>
        
    </head>

    <body>
        <jsp:include page="/ADMIN/AdminNav.jsp" />
        <div class="w3-container">
            <h1>All Appointments</h1>

            
            <br>

            <table id="appointments" class="w3-table w3-striped w3-bordered">
                <thead>
                    <tr class="w3-theme">
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
                </thead>
                <tbody>
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
                        <td>
                            <form>
                                <input type="hidden" name="action" value="confirmAppt">
                                <input type="submit" name ="confirm" value="Confirm">
                            </form>
                        </td>
                        <td>
                            <form>
                                <input type="hidden" name="action" value="editAppt">
                                <input type="submit" name ="edit" value="Edit">
                            </form>
                        </td>
                        <td>
                            <form>
                                <input type="hidden" name="action" value="deleteAppt">
                                <input type="submit" name="delete" value="Delete">
                            </form>
                        </td>
                    
                    
                    </tr>
                </c:forEach>
              </tbody>
            </table>
            
        </div>
    </body>

</html>
