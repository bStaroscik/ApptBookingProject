<%-- 
    Document   : editPost
    Created on : Apr 19, 2022, 9:22:26 PM
    Author     : Jeremy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Patient Appointment</title>
        <!--<link rel="stylesheet" href="styles/main.css" type="text/css"/>-->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    </head>
    <jsp:include page="nav.jsp" /> 
    <body>
        <hr>
        <div class="w3-content" style="max-width:800px;position:relative">
            <form class="w3-container w3-card-4" action="Private" method="post">
                <input type="hidden" name="idValue" value="${idValue}"> 
                <h2>Edit Appointment</h2>
                <p>${message}</p>
                <div class="w3-section">      
                    <input class="w3-input" type="date" name="apptDate" value="${apptDate}" required>
                    <label>Appointment Date</label>
                </div>
                <div class="w3-section">      
                    <input class="w3-input" type="time" name="apptTime" value="${apptTime}" required>
                    <label>Appointment Time</label>
                </div>
                <div class="w3-center">
                    <br>
                    <input type="hidden" name="action" value="submitPatientApptEdit">
                    <input class="w3-button w3-theme" type="submit" name ="submitPatientApptEdit" value="Submit Edit">
                </div>
                <br>
            </form>
        </div>
        <br><br>
    </body>
</html>
