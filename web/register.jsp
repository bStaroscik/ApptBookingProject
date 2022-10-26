<%-- 
    Document   : register
    Created on : Oct 11, 2022, 10:43:28 AM
    Author     : Haiyan
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!--<!DOCTYPE html>-->
<!--<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
        <link href="yustyle.css" rel="stylesheet" type="text/css"/>
        <style>
        .container{
            width: 100%;
            height: 100px;
            background:darkseagreen;
            
        }
        li{
            float:left;
            text-decoration: none;
            list-style: none;
            padding:10px;
        }
        li a{float:left;
             display: block;
             padding: 20px;
             font-size:25px;
             color:whitesmoke;
             text-decoration: none;
            }
        
        nav ul li a:hover {
            background-color: forestgreen;
        }a:hover{color:orange;}       
       
        
    </style>
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
      <h1 style="text-align: center; color: darkseagreen; font-size: 3em; padding-top: 10px;">
          Doctor Appointment Booking
      </h1>
        <main>
        <header>
            <h1>Register Form</h1>
        </header>
            <div class="registercontainer">
                <form action="register" method="post">
                    <div style="padding-top: 10px; padding-bottom:10px;">
                        <label class="pad">First name: </label>                          
                        <input type="text" placeholder="" name="fname" size="11">&nbsp;
                    
                        <label class="pad">Last name: </label> 
                        <input type="text" placeholder="" name="lname" size="11"><br/>
                    </div>
                    <div style="padding-bottom:20px;">
                        <label>Address: </label> 
                        <input type="text" placeholder="" name="address" size="43"><br/>
                    </div>
                    <div style="padding-bottom:10px;">
                        <label class="pad">City:</label> 
                        <input type="text" placeholder="" name="city" size="6">&nbsp;
                        <label class="pad">State:</label> 
                        <input type="text" placeholder="i.e. NE" name="state" size="2"> &nbsp;
                        <label class="pad">Zip Code:</label> 
                        <input type="text" placeholder="i.e:12345" name="zipcode" size="5"><br/>&nbsp;
                    </div>
                    <div style="padding-bottom:20px;">
                        <label>Phone number: </label> 
                        <input type="text" placeholder="" name="phone" size="30"><br/>
                    </div>
                    <div style="padding-bottom:20px;">
                        <label>Email: </label> 
                        <input type="email" placeholder="abc123@mail.com" name="email" size="38"><br/>
                    </div>
                    <div style="padding-bottom:60px;">
                        <label>Password: </label> 
                        <input type="password" placeholder="" name="password" size="35"><br/>
                    </div>

                    <div style="padding-bottom:20px;">
                    <input id="register" type="submit" value="Register"><br/>
                    </div>
                </form>
                  
            </div>
        </main>
    </body>
</html>-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="newcss.css" type="text/css"/>
    </head>

    <body>
        <!--        <div class="wrapper">-->
        <div>
            <h1>Registration</h1>

            <%--<jsp:include page="nav.jsp" />--%> 

            <h3>${message}</h3> 
            <h3>${success}</h3>

            <p>${error}</p>
            <div>
                <form action="public" method="post">
                    <input type="hidden" name="action" value="register"> 

                    <label>First Name</label>
                    <input type="text" name="firstName" value="<c:out value="${users.firstName}" />">
                    <br>

                    <label>Last Name</label>
                    <input type="text" name="lastName" value="<c:out value="${users.lastName}" />">
                    <br>

                    <label>Address</label>
                    <input type="date" name="address" value="<c:out value="${users.address}" />">
                    <br>

                    <label>City</label>
                    <input type="date" name="city" value="<c:out value="${users.city}" />">
                    <br>
                    
                    <label>State</label>
                    <input type="text" name="state" value="<c:out value="${users.state}" />">
                    <br>

                    <label>Zip Code</label>
                    <input type="text" name="zipCode" value="<c:out value="${users.zipCode}" />">
                    <br>

                    <label>Phone Number</label>
                    <input type="text" name="phoneNumber" value="<c:out value="${users.phoneNumber}" />">
                    <br>

                    <label>Email</label>
                    <input type="date" name="email" value="<c:out value="${users.email}" />">
                    <br>

                    <label>Password</label>
                    <input type="date" name="password" value="<c:out value="" />">
                    <br>

                    <input type="submit" value="submit">
                </form>
            </div>
        </div>
    </body>

</html>
