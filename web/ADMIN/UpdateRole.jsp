<%-- 
    Document   : UpdateRole
    Created on : Nov 16, 2022, 5:34:37 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <title>Admin: Update Role</title>
    </head>
    <body>
        <h1>Update Role</h1>
        
        <jsp:include page="AdminNav.jsp" />
        <br>
        
        <table id="users">
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Role</th>
                <th>Update Role</th>
            </tr>
            
            <c:forEach var="item" items="${users}" varStatus="status">
                <tr>

                    <td><c:out value="${item.value.firstName}" /></td>
                    <td><c:out value="${item.value.lastName}" /></td>
                    <td><c:out value="${item.value.role}" /></td>
                    <c:set var="authors" value="aaa,bbb,ccc,ddd" scope="application" />
                    <c:out value="Before : ${param.Author}" />
                <form action="TestSelect.action">
                    <label>Role
                        <select id="Author" name="Author">
                            <c:forEach items="${fn:split(authors, ',')}" var="author">
                                <option value="${author}" ${author== param.Author ? 'selected' : ''}>${author}</option>
                            </c:forEach>
                        </select>
                    </label>
                    <button type="submit" value="submit" name="Submit"></button>
                    <br>
                    <c:out value="After : ${param.Author}" />
                </form>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
