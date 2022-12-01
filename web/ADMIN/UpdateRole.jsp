<%-- 
    Document   : UpdateRole
    Created on : Nov 16, 2022, 5:34:37 PM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Admin: Update Role</title>
    </head>
    <body>
        <jsp:include page="AdminNav.jsp" />
        <h1>Update Role</h1>
        
        
        <br>
        <div class="w3-container">
        <table id="users" class="w3-table w3-striped w3-bordered">
            <tr class="w3-theme">
                <th>First Name</th>
                <th>Last Name</th>
                <th>Role</th>
                <th>Update Role</th>
            </tr>
            
            <c:forEach var="item" items="${users}" varStatus="status">
                <tr>
                <form action="Admin" method="post">
                    <td><c:out value="${item.value.firstName}" /></td>
                    <td><c:out value="${item.value.lastName}" /></td>
                    <td><c:out value="${item.value.role}" /></td>
                    <td>
                        <select name="role">
                            <c:forEach items="${allRoles}" var="roles">
                                <option value="${roles}" /><c:out value="${roles}" />
                            </c:forEach>
                        </select>
                    </td>
                    <td>

                        <input type="hidden" name="action" value="updateRole">
                        <input type="hidden" name="userEmail" value="<c:out value='${item.value.email}' />">
                        <input type="submit" name="updateRole" value="submit">
                </form>
                    </td>
                    <td>
                        <form action="Admin" method="post">
                            <input type="hidden" name="action" value="deleteUser">
                            <input type="hidden" name="userEmail" value="<c:out value='${item.value.email}' />">
                            <input type="submit" name="deleteUser" value="Delete User">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
       </div>
    </body>
</html>