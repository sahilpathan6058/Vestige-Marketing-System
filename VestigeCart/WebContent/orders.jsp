<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="vestigecom.model.*"%>
<%@page import="vestigecom.connection.DBCon"%>
<%@page import="java.util.*"%>
<%@page import="vestigecom.Dao.*"%>
<%@page import="java.text.DecimalFormat"%>
          
          	<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	user auth = (user) request.getSession().getAttribute("auth");
	List<orders> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    orderDao orderDao  = new orderDao(DBCon.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}else{
		response.sendRedirect("login.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	
	%>
          
    
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/includes/head.jsp"%>
 <style>
   <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            margin-top: 120px;
        }

        .card {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            border: none;
            border-radius: 8px;
        }

        .card-header {
            font-size: 24px;
            font-weight: 600;
            background: linear-gradient(135deg, #f20fa3, #9b4be3);
            color: white;
            padding: 15px 20px;
            border-radius: 8px 8px 0 0;
        }

        .table {
            margin: 0;
        }

        .table th {
            background-color: #e9ecef;
            text-align: center;
        }

        .table td {
            vertical-align: middle;
            text-align: center;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
            transition: background-color 0.2s ease;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .text-muted {
            font-size: 16px;
            padding: 15px 0;
        }
    </style>

</head>
<body>
	<%@include file="/includes/navbar.jsp"%>


  <div class="container">
        <div class="card">
            <div class="card-header">Your Orders</div>
            <div class="card-body p-0">
                <table class="table table-bordered table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>Date</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if (orders != null && !orders.isEmpty()) {
                            for (orders o : orders) {
                        %>
                        <tr>
                            <td><%= o.getDate() %></td>
                            <td><%= o.getName() %></td>
                            <td><%= o.getCategory() %></td>
                            <td><%= o.getQuantity() %></td>
                            <td>₹<%= dcf.format(o.getPrice()) %></td>
                            <td>
                                <a class="btn btn-sm btn-danger" href="Cancel-order?id=<%= o.getOrderId() %>">
                                    Cancel
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="6" class="text-center text-muted">No orders found.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>