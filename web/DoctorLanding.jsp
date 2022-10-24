<%-- 
    Document   : profile
    Created on : Oct 12, 2022, 6:39:36 PM
    Author     : majle
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="wrapper">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Doctor Landing</title>
            <link rel="stylesheet" href="styles/main.css" type="text/css"/>
        </head>
        <jsp:include page="nav.jsp" /> 
        <body>
            <h1>Doctor Information</h1>
            <h2><c:out value='${errorMessage}'/></h2>
            <h2>${message}</h2>
            <form>
                <input type="hidden" name="action" value="logout"> 
                <td><input type="submit" value="Logout"></td>
            </form>
            <!--        listed user info and allow to edit-->
            <div class="center">
                <form action="Private" method="post">
                    <input type="hidden" name="keyEdit" value="<c:out value='${user.getUserName()}'/>">
                    <input type="hidden" name="action" value="edit" >


                    <label>Email</label>
                    <input type="text" name="email" value="<c:out value='${email}'/>">
                    <br>

                    <label>Password</label>
                    <input type="text" name="password" value="<c:out value='${loginPassword}'/>">
                    <br>


                    <input type="submit" value="Edit">

                </form>
            </div>
        </body>
    </div>
</html>
