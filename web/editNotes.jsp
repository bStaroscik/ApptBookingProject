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
        <!--<link rel="stylesheet" href="styles/main.css" type="text/css"/>-->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    </head>
    <jsp:include page="nav.jsp" /> 
    <body>
        <hr>
        <div class="w3-content" style="max-width:800px;position:relative">
            <form class="w3-container w3-card-4" action="Private" method="post">
                <input type="hidden" name="idValue" value="${idValue}"> 
                <h2>Edit Notes</h2>
                <h3>${message}</h3>
                <input type="hidden" name="action" value="submitNotesEdit"> 
                <input type="hidden" name="idValue" value="${idValue}"> 
                <div>
                    <textarea style="width: 100%" name="postText" rows='10' autofocus='true' maxlength='1024'>${noteText}</textarea>
                </div>
                <br>
                <input type="submit" value="Submit Edit">
                <hr>
            </form>
        </div>




        <!--    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Edit Post</title>
                <link rel="stylesheet" href="styles/main.css" type="text/css"/>
                <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
                <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
            </head>
            <body>
                <div class="wrapper">
        <jsp:include page="nav.jsp" />
        <h1>Edit Notes</h1>
        <h2>${message}</h2>
        <form action="Private" method="post">
            <input type="hidden" name="action" value="submitNotesEdit"> 
            <input type="hidden" name="idValue" value="${idValue}"> 
            <div style="text-align: center;"><textarea style="text-align: center; width: 75%" type="text" name="postText" rows='10'cols='100' autofocus='true' maxlength='1024'>${noteText}</textarea></div>
            <br>
            <input type="submit" value="Submit Edit">
        </form>
    </div>
</body>-->
</html>
