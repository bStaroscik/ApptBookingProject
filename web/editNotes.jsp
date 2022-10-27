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
        <title>Edit Post</title>
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
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
    </body>
</html>
