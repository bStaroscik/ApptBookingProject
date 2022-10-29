<%-- 
    Document   : index
    Created on : Oct 20, 2022, 10:08:47 PM
    Author     : Haiyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java Project</title>
    </head>

    <body>
        <div class="wrapper">
            <h1>Social Media Fun Site Login!</h1>

            <jsp:include page="nav.jsp" /> 

            <h3><c:out value="${message}" /></h3>
            <div>
                <form action="private" method="post">
                    <input type="hidden" name="action" value="attemptLogin">

                    <label>user name</label>
                    <input type="text" name="userName" value="<c:out value="" />">
                    <br>

                    <label>password</label>
                    <input type="text" name="password" value="<c:out value="" />">
                    <br>

                    <input type="submit" value="submit">
                </form>
            </div>
        </div>
    </body>

</html>
