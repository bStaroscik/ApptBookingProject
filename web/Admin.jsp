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
        <title>Admin Page</title>
    </head>
    <body bgcolor="black"><font color="red">
        <h1>This is an Admin Page</h1>
        <%
            String str = (String) session.getAttribute("username");
            out.print("Welcome" + str);
        %>
        </font>
    </body>
</html>
