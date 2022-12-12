<%-- 
    Document   : AreYouSure
    Created on : Nov 14, 2022, 6:33:38 PM
    Author     : Ashbb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Appointment</title>
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
                <h2>Cancel Appointment</h2>
                <p>${message}</p>
                <h3 class="w3-center">Are you sure?</h3>

                <div class="w3-center">
                    <br>
                    <input type="hidden" name="action" value="submitCancelPatientAppointment">
                    <input class="w3-button w3-theme" type="submit" name="submitCancelPatientAppointment" value="Yes">
                </div>
                <div class="w3-center">
                    <br>
                    <a href="Private?action=getUserAppointments"><input class="w3-button w3-theme" type="button" value="No"></a>
                </div>
                <br>
            </form>
        </div>
        <br><br>
    </body>
</html>
