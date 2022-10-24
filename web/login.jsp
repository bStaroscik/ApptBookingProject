<%-- 
    Document   : login
    Created on : Oct 11, 2022, 10:43:50 AM
    Author     : Haiyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="yustyle.css" rel="stylesheet" type="text/css"/> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
        }
        a:hover{color:orange;}       
        
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
            <h1>Login Form</h1>
        </header>
            <div class="registercontainer">
                <form action="login" method="post">
                    
                    <div style="padding-bottom:20px;">
                        <label>Email: </label> 
                        <input type="email" placeholder="abc123@mail.com" name="email" size="38"><br/>
                    </div>
                    <div style="padding-bottom:60px;">
                        <label>Password: </label> 
                        <input type="password" placeholder="" name="password" size="34"><br/>
                    </div>

                    <div  style="padding-bottom:5px;">
                    <input id="login" type="submit" value="Login"><br/>
                    </div>
                </form>
                  
            </div>
        </main>
    </body>
</html>
