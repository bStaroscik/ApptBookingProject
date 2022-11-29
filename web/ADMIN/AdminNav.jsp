<%-- 
    Document   : AdminNav
    Created on : Oct 24, 2022, 1:21:57 PM
    Author     : bstar
--%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">


    <div class="w3-container">
        <hr>
        <h2 class="w3-center">Family Medicine</h2>
        <div class="w3-bar w3-theme">
            <a href="Admin?action=adminHome" class="w3-bar-item w3-button w3-padding-16">Admin Home</a>
            <a href="Admin?action=newAppts" class="w3-bar-item w3-button w3-padding-16">Create Appointment</a>
            <a href="Admin?action=allAppts" class="w3-bar-item w3-button w3-padding-16">User Appointments</a>
            <a href="Admin?action=allUsers" class="w3-bar-item w3-button w3-padding-16">All Users</a>
            <a href="Private?action=logout" class="w3-bar-item w3-button w3-padding-16">Logout</a>
        </div>
    </div>
</html>
