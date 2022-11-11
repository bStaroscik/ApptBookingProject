<%-- 
    Document   : editPost
    Created on : Apr 19, 2022, 9:22:26 PM
    Author     : Jeremy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Patient Appointment</title>
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="nav.jsp" />
            <h1>Edit Appointment</h1>
            <h2>${message}</h2>
            <form action="Private" method="post">
                <input type="hidden" name="idValue" value="${idValue}"> 
                <label>Appointment Date</label>
                <input type="text" name="apptDate" value="${apptDate}" />
                <br>

                <label>Appointment Time</label>
                <input type="text" name="apptTime" value="${apptTime}" />
                <br>

                <!--<div style="text-align: center;"><textarea style="text-align: center; width: 75%" type="text" name="postText" rows='10'cols='100' autofocus='true' maxlength='1024'>${noteText}</textarea></div>-->
                <br>
                <input type="hidden" name="action" value="submitPatientApptEdit">
                <input type="submit" value="Submit Edit">
            </form>
        </div>
    </body>
</html>

<!--<form action="private" method="post">
                    <label>First Name</label>
                    <input type="text" name="firstName" value="<c:out value="${users.firstName}" />">
                    <br>

                    <label>Last Name</label>
                    <input type="text" name="lastName" value="<c:out value="${users.lastName}" />">
                    <br>

                    <label>Address</label>
                    <input type="text" name="address" value="<c:out value="${users.address}" />">
                    <br>

                    <label>City</label>
                    <input type="text" name="city" value="<c:out value="${users.city}" />">
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
                    <input type="text" name="email" value="<c:out value="${users.email}" />">
                    <br>

                    <label>Password</label>
                    <input type="text" name="password" value="<c:out value="" />">
                    <br>

                    <input type="hidden" name="action" value="submitProfileEdit">
                    <input type="submit" name ="submitProfileEdit" value="Submit Edit">

                    <input type="hidden" name="action" value="logout"> 
                    <td><input type="submit" value="Logout"></td>
                </form>-->