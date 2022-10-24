<%-- 
    Document   : edit
    Created on : Oct 21, 2022, 12:25:11 AM
    Author     : haiyan
--%>


<%@page import="static java.time.temporal.TemporalAdjusters.lastDayOfYear"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    LocalDate mydate = LocalDate.now();
    LocalDate lastDay = mydate.with(lastDayOfYear());

    String apptId = (String) request.getParameter("id");

    session.setAttribute("apptID", apptId);

    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    String connectionUrl = "jdbc:sqlserver://p3nwplsk12sql-v18.shr.prod.phx3.secureserver.net:1433;databaseName=BAHR;encrypt=true;trustServerCertificate=true;";
    Connection con = DriverManager.getConnection(connectionUrl, "BAHRdata", "Fall@2022");
    Statement stm = con.createStatement();

    String sql4 = "select * from AppointmentInfo where apptID='" + apptId + "'";
    ResultSet rs4 = stm.executeQuery(sql4);
    if (rs4.next()) {

    }
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
                    <li><a href="register.jsp">REGISTER</a></li> 
                    <li><a href="login.jsp">LOGIN</a></li>   
                    <li><a href="ApptInfo.jsp">My ACCOUNT</a></li>
                    <li><a href="logout.jsp">LOGOUT</a></li> 
                </ul>                    
            </nav>
        </div>

        <h1 style="text-align: center; color: darkseagreen; font-size: 3em; padding-top: 10px;">
            Edit The Appointment </h1>

        <main style="padding-left:100px; padding-right:30px;">
            <header>
                <h1>Hello, <% out.print(" " + fname + " " + lname + "!"); %></h1>
            </header>
            <div class="registercontainer"> 
                <form action="editAppt" method="post">
                    <div style="padding-bottom:20px;">
                        <label>Appointment Description: </label> 
                        <input type="text" placeholder="<%out.println(rs4.getString("reasonForVisit"));%>" name="apptDescription" size="43"><br/>
                    </div>

                    <div style="padding-top: 10px; padding-bottom:20px;">
                        <label class="pad">Doctor Name: </label> 
                        <select name="doctorName" id="docName">                           
                            <option value="Winnei Pooh">Winnie Pooh</option>
                            <option value="Chicken Little">Chicken Little</option>

                        </select> <br>
                    </div>                        
                    <div style="padding-top:10px; padding-bottom:10px;">
                        <label class="pad">Date: </label>                          
                        <input type="date" id="start" name="date"  value=<% out.print(rs4.getDate("apptDate")); %>
                               min=<% out.print(mydate); %> max=<% out.print(lastDay); %>>
                    </div>

                    <%-- <div style="padding-top: 10px; padding-bottom:20px;">--%>
                    <div>
                        <label class="pad">Time: </label> 
                        <select name="time" id="time">
                            <option value="8:00">8:00</option>
                            <option value="9:00">9:00</option>
                            <option value="10:00">10:00</option>
                            <option value="11:00">11:00</option>
                            <option value="12:00">12:00</option>
                            <option value="13:00">13:00</option>
                            <option value="14:00">14:00</option>
                            <option value="15:00">15:00</option>
                            <option value="16:00">16:00</option>
                        </select> <br>
                        <small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            (Office hours from 8am to 5pm)
                        </small> <br><br>

                    </div>

                    <div style="padding-top: 10px; padding-bottom:20px;">
                        <label>Insurance Provider: </label> 
                        <input type="text" placeholder="<%out.println(rs4.getString("insuranceProvider"));%>" name="insProvider" size="43"><br/>
                    </div>
                    <div style="padding-bottom:20px;">
                        <label>Insurance Plan Number: </label> 
                        <input type="text" placeholder="<%out.println(rs4.getString("insurancePlanNum"));%>" name="insPlanNo" size="43"><br/>
                    </div><br>

                    <div >
                        <input style="padding:10px; margin-right: 200px; margin-bottom: 20px;
                               font-size: 1em; float: right; color: forestgreen; font-weight: bold; "
                               id="bookAppointment" type="submit" value="Submit"><br>
                    </div> 
                </form>
            </div>
        </main>
    </body>
</html>

