<%-- 
    Document   : nav
    Created on : Mar 22, 2022, 1:55:33 PM
    Author     : nguye
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Navigation</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    </head>
    <div class="w3-container">
        <div class="w3-third" style='height: 200px; width: 200px;'>
            <img src="${pageContext.request.contextPath}/Images/HealthCareLogo.png" alt="Health Care Logo" style="width:100%">
        </div>
        <div class="w3-third" style='height: 200px; width: 200px;'>
            <img src="${pageContext.request.contextPath}/Images/HealthCareName.png" alt="Health Care Name" style="width:100%">
        </div>
        <div class="w3-bar w3-theme">
            <a href="index.jsp" class="w3-bar-item w3-button w3-padding-16">Login</a>
            <a href="register.jsp" class="w3-bar-item w3-button w3-padding-16">Register</a>
            <a href="Private?action=getDoctorsAppointments" class="w3-bar-item w3-button w3-padding-16">Doctors</a>
            <div class="w3-dropdown-hover">
                <button class="w3-button w3-padding-16">
                    Patient <i class="fa fa-caret-down"></i>
                </button>
                <div class="w3-dropdown-content w3-card-4 w3-bar-block">
                    <a href="Private?action=getUserAppointments" class="w3-bar-item w3-button">Scheduled Appointments</a>
                    <a href="Private?action=createUserAppointments" class="w3-bar-item w3-button">Create Appointment</a>
                </div>
            </div>
            <a href="Private?action=editProfile" class="w3-bar-item w3-button w3-padding-16">Edit Profile</a>
            <a href="Private?action=logout" class="w3-bar-item w3-button w3-padding-16">Logout</a>
        </div>
    </div>
</html>