<%-- 
    Document   : Thx
    Created on : Oct 16, 2022, 10:26:02 PM
    Author     : Haiyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    
    Object info1=session.getAttribute("info1");


%>

<html>
    
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
       <link href="yustyle.css" rel="stylesheet" type="text/css"/>
        <style> .container{
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
                   <li><a href="index.jsp">HOME</a></li> 
                    <li><a href="#">CLINIC INFO</a></li> 
                    <li><a href="#">ABOUT</a></li>
                     
                    <li><a href="login.jsp">LOGIN</a></li>    
                     
                    <li><a href="logout.jsp">LOGOUT</a></li> 
                </ul>
     
                
            </nav>

        </div> 
        <main>
        <div style= "margin-top: 20px;">
            <p><% out.print(info1); %></p>
        </div>
        </main>
    </body>
</html>

