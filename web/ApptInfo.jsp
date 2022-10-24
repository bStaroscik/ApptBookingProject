<%-- 
    Document   : apptInfo
    Created on : Oct 19, 2022, 11:21:19 AM
    Author     : Haiyan
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    Object fname = session.getAttribute("fname");
    Object lname = session.getAttribute("lname");
    Object email = session.getAttribute("email");

    Object address = session.getAttribute("address");
    Object City = session.getAttribute("City");
    Object State = session.getAttribute("State");
    Object ZipCode = session.getAttribute("ZipCode");
    Object phoneNumber = session.getAttribute("phoneNumber");
    Object userID = session.getAttribute("userID");

    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    String connectionUrl = "jdbc:sqlserver://p3nwplsk12sql-v18.shr.prod.phx3.secureserver.net:1433;databaseName=BAHR;encrypt=true;trustServerCertificate=true;";
    Connection con = DriverManager.getConnection(connectionUrl, "BAHRdata", "Fall@2022");
    Statement stm = con.createStatement();

    String sql2 = "select * from AppointmentInfo where userID='" + userID + "'";
    ResultSet rs2 = stm.executeQuery(sql2);
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
                     
                    <li><a href="ApptInfo.jsp">LOGIN</a></li>   
                    <li><a href="ApptInfo.jsp">My ACCOUNT</a></li>
                    <li><a href="logout.jsp">LOGOUT</a></li> 
                </ul>                    
            </nav>
        </div>
        <h1></h1>

        
        
        <div style="margin-left: 30px;">
            <h2><i>Your information:</i></h2>


            <form  action="edit.jsp" method="post">

                <div style="padding-top: 10px; padding-bottom:10px;">
                    <label class="pad">Name: </label>                          
                    <label><% out.print(fname + " " + lname); %></label>&nbsp;                                     
                </div>

                <div style="padding-bottom:20px;">
                    <label>Address: </label> 
                    <label><% out.print(address); %></label><br>
                </div>

                <div style="padding-bottom:10px;">
                    <label class="pad">City:</label> 
                    <label><% out.print(City); %></label>&nbsp;
                    <label class="pad">State:</label> 
                    <label><% out.print(State); %></label> &nbsp;
                    <label class="pad">Zip Code:</label> 
                    <label><% out.print(ZipCode); %></label><br>&nbsp;
                </div>
                <div style="padding-bottom:20px;">
                    <label>Phone number: </label> 
                    <label><% out.print(phoneNumber); %></label><br>
                </div>

                <div style="padding-bottom:20px;">
                    <label>Email: </label> 
                    <label><% out.print(email);%></label><br>
                </div>
                <br>
                <br>
                </form>
            
                <div>
                    <h2><i>Your Appointment Notification:</i></h2>
                </div>

                <div align="left">
                    <table border="1" cellpadding="5">
                        <caption><h3> </h3></caption>
                        <tr>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Doctor</th>
                            <th>Reason</th>
                            <th>Insurance provider</th>
                            <th>Insurance #</th>
                            <th>Edit</th>
                            <th>Cancel</th>
                        </tr>
                        <% while (rs2.next()) {
                        %>

                        <tr>
                            <td><c:out value="" /><%out.println(rs2.getDate("apptDate"));%></td>
                        <td><c:out value="" /><%out.println(rs2.getTime("apptTime"));%></td>
                        <td><c:out value="" /><%out.println(rs2.getString("doctorFirstName") + " " + rs2.getString("doctorLastName"));%></td>
                        <td><c:out value="" /><%out.println(rs2.getString("reasonForVisit"));%></td>
                        <td><c:out value="" /><%out.println(rs2.getString("insuranceProvider"));%></td>
                        <td><c:out value="" /><%out.println(rs2.getString("insurancePlanNum"));%></td>
                        <td><c:out value="" /><a href="edit.jsp?id=<%out.println(rs2.getInt("apptID"));%>">Edit</a></td>
                        <td><c:out value="" /><a href="cancel.jsp?id=<%out.println(rs2.getInt("apptID"));%>">Cancel</a></td>
                        </tr>
                        <% }%>
                        </c:forEach>
                    </table>
                </div><br><br>   
                
               
             
                <form  action="makeAppointment.jsp" method="post">  
                        <div>
            <p>  <input style="padding:10px; font-size:1.5em; color: forestgreen;
                        font-weight: bold; float: left; margin-right:150px;" 
                        id="toMakeAppoint" type="submit" value="Make an appointment >>"><br/>
            </p>
        </div>

            </form>
        </div>
        <br>
        <br>
        <br>
     
    </body>
</html>
