<%-- 
    Document   : index
    Created on : Oct 20, 2022, 10:08:47 PM
    Author     : Haiyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

 
    <head>
        <title>Home</title>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
             font-family: Arial, Helvetica, sans-serif;
        }
        nav ul li a:hover {
            background-color: forestgreen;            
        }
        body{
            background-image: url('bkgd_img1.jpg');          
            background-size: cover;
            background-attachment: fixed;
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }
        h1{ font-family: Arial, Helvetica, sans-serif;
            text-align: right;
            margin-right: 20px;
            margin-top: 125px;
            color:darkgreen;
            font-size:2.2em;  
            font-weight: bold;
        }
        .welcome{ font-family: Arial, Helvetica, sans-serif;
            text-align: left;
            float: right;
            margin-right:60px;
            font-size: 1.5em;
        }
        a{text-decoration: none;
          font-size:1.2em;        
        }
        a:hover{color:orange;}
      
        </style>
    </head>
        
    <body>
       
        <div class="container">
            <nav>
                <ul>
                    <li><a href="index.jsp">HOME</a></li> 
                    <li><a href="#">CLINIC INFO</a></li> 
                    <li><a href="#">ABOUT</a></li>
                    <li><a href="register.jsp">REGISTER</a></li> 
                    <li><a href="login.jsp">LOGIN</a></li>   
                     <li><a href="ApptInfo.jsp">My ACCOUNT</a></li> 
                       <li><a href="logout.jsp">LOGOUT</a></li> 
                </ul>                    
            </nav>
        </div>
    
        <main>
            <div>   
            <h1>Welcome to schedule doctor appointments</h1><br><br>
            </div>
        <div class='welcome'>
            <p> </p><br>
        
        </div>
        </main>
        
    </body>


</html>
