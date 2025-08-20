<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vestigecom.model.orders" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - View Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #c72092;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            background: white;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #c72092;
            color: white;
        }
    </style>
</head>
<body>

    <h2>All Orders</h2>

    <table>
        <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Product</th>
            <th>Category</th>
            <th>Price (Per Unit)</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Order Date</th>
        </tr>

        <%
            List<orders> orderList = (List<orders>) request.getAttribute("orderList");
            if (orderList != null && !orderList.isEmpty()) {
                for (orders o : orderList) {
        %>
        <tr>
            <td><%= o.getOrderId() %></td>
            <td><%= o.getUid() %></td>
            <td><%= o.getName() %></td>
            <td><%= o.getCategory() %></td>
            <td>₹<%= o.getPrice() %></td>
            <td><%= o.getQuantity() %></td>
            <td>₹<%= o.getPrice() * o.getQuantity() %></td>
            <td><%= o.getDate() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="8">No orders found.</td>
        </tr>
        <% } %>
    </table>
    <div class="back-link">
            <a href="index.jsp">← Back</a>
        </div>
    

</body>
</html>
