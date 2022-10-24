<%-- 
    Document   : cancel
    Created on : Oct 20, 2022, 10:55:25 PM
    Author     : haiyan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <%
     String apptid = (String)request.getParameter("id");
     
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    String connectionUrl = "jdbc:sqlserver://p3nwplsk12sql-v18.shr.prod.phx3.secureserver.net:1433;databaseName=BAHR;encrypt=true;trustServerCertificate=true;";
    Connection con = DriverManager.getConnection(connectionUrl, "BAHRdata", "Fall@2022");
    Statement stm = con.createStatement();

    String sql3 = "delete from AppointmentInfo where apptID='" + apptid + "'";
    stm.executeUpdate(sql3);
        %>
        
<html>
    <head>    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login Info Page</title>
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
                    <li><a href="ApptInfo.jsp">My ACCOUNT</a></li>
                    <li><a href="logout.jsp">LOGOUT</a></li> 
                </ul>                    
            </nav>
        </div> <br> <br>
        <main>
       
        <div style= "marging-top: 20px;">
        <p>The appointment has been canceled!</p>
        <p>Go to check your appointments in your account...</p>
        </div>
        </main>
    </body>
</html>
