<%-- 
    Document   : index
    Created on : Oct 20, 2022, 10:08:47 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome!</title>
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="nav.jsp" />
            <h1>Login</h1>
            <h2>${message}</h2>
                <form action="Private" method="post">
                    <input type="hidden" name="action" value="attemptLogin">

                    <label>user name</label>
                    <input type="text" name="userName" value="<c:out value="" />">
                    <br>

                    <label>password</label>
                    <input type="password" name="password" value="<c:out value="" />">
                    <br>

                    <input type="submit" value="submit">
                </form>
            </div>

    </body>

</html>
