<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vestigecom.model.user, java.util.*" %>

<%
    List<user> userList = (List<user>) request.getAttribute("userList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Registered Users</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #c72092;
            margin-bottom: 30px;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 14px 16px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #c72092;
            color: #fff;
            font-weight: bold;
            letter-spacing: 1px;
        }

        tr:hover {
            background-color: #f2f2f2;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }

        form {
            margin: 0;
        }
    </style>
</head>
<body>

    <h2>All Registered Users</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Action</th>
        </tr>

        <%
            if (userList != null && !userList.isEmpty()) {
                for (user u : userList) {
        %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td>
                <form action="delete-user-servlet" method="post">
                    <input type="hidden" name="userId" value="<%= u.getId() %>"/>
                    <button class="btn-delete" type="submit">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No users found.</td>
        </tr>
        <% } %>
    </table>
<div class="back-link">
            <a href="index.jsp">← Back</a>
        </div>

</body>
</html>
