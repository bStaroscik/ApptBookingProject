<%-- 
    Document   : AdminEditAppt
    Created on : Nov 30, 2022, 11:52:43 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Edit Patient Appointment</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    </head>
    <jsp:include page="AdminNav.jsp" /> 
    <body>
        <hr>
        <div class="w3-content" style="max-width:800px;position:relative">
            <form class="w3-container w3-card-4" action="Admin" method="post">
                <input type="hidden" name="idValue" value="${editAppt.apptID}"> 
                <h2>Admin: Edit Appointment</h2>
                <p>${message}</p>
                <div class="w3-section">      
                    <input class="w3-input" type="date" name="apptDate" value="${editAppt.apptDate}" required>
                    <label>Appointment Date</label>
                </div>
                <div class="w3-section">      
                    <input class="w3-input" type="time" name="apptTime" value="${editAppt.apptTime}" required>
                    <label>Appointment Time</label>
                </div>
                <div class="w3-center">
                    <br>
                    <input type="hidden" name="action" value="submitApptEdit">
                    <input class="w3-button w3-theme" type="submit" name ="submitApptEdit" value="Submit Edit">
                </div>
                <hr>
            </form>
        </div>
    </body>
</html>
