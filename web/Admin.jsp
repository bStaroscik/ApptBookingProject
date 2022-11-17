<%-- 
    Document   : Admin
    Created on : Oct 12, 2022, 6:34:03 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="styles/main.css" type="text/css"/>-->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        <title>Admin Home Page</title>
    </head>
    <body>
        <div class="wrapper">
            <h1>This is an Admin Page</h1>

            <jsp:include page="AdminNav.jsp" /> 
            <%
                String str = (String) session.getAttribute("username");
                out.print("Welcome" + str);
            %>
            </font>
            <h1>This is a placeholder for All Appointments Link</h1>
            <h1>This is a placeholder for Accept/Decline Appointments Link</h1>
            <h1>This is a placeholder for Booking Appointments Link</h1>
            <h1>This is a placeholder for Recent Appointments Link</h1>
        </div>
    </body>
</html>
