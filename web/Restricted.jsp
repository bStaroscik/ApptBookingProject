<%-- 
    Document   : UserAppointments
    Created on : Oct 26, 2022, 6:15:58 PM
    Author     : Ashbb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="wrapper">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Restricted</title>
            <link rel="stylesheet" href="styles/main.css" type="text/css"/>
        </head>
        <jsp:include page="nav.jsp" /> 
        <body>
            <h1>Restricted</h1>
            <h2><c:out value='${errorMessage}'/></h2>
            <h2>${message}</h2>
        </body>
    </div>
</html>