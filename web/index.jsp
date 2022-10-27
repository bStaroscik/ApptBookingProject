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
        <title>Home</title>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>

    </head>
        
   <body>
       
        <div class="container">
            <nav>
                <ul>
                    <li><a href="index.html">HOME</a></li> 
                    <li><a href="#">CLINIC INFO</a></li> 
                    <li><a href="#">ABOUT</a></li>
                    <li><a href="register.jsp">REGISTER</a></li> 
                    <li><a href="login.jsp">LOGIN</a></li>   
                      
                </ul>                    
            </nav>
        </div>
    
        <main>
            <div>   
            <h1>Welcome to schedule doctor appointments</h1><br><br>
            </div>
        <div class='welcome'>
            <p>It looks like you are first time here. Can we help you set up?</p><br>
            <h3><c:out value="${message}" /></h3>
            <form action="Private" method="post">
                <input type="hidden" name="action" value="attemptLogin">
                <table>
            <tr>
                <td>
                    UserName:
                </td>
                <td>
                    <input type="text" name="uname">
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <input type="password" name="upass">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Submit">
                </td>
                <td>
                    <input type="reset" value="Reset">
                </td>
            </tr>
            
        </table>
            </form>
        <p>I'm a returning user to <a href="login.jsp"> <b><i>Log in</i></b> >></a></p>
        <p>Please help me <a href="register.jsp"><b><i>Sign up</i></b> >></a></p>
        </div>
        </main>
        
    </body>


</html>
