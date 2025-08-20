<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vestigecom.model.*"%>
<%@page import="vestigecom.connection.DBCon"%>
<%@page import="java.util.*"%>
<%@page import="vestigecom.Dao.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 30px;
	background-color: #f9f9f9;
}

h2 {
	text-align: center;
	color: #c72092;
	margin-bottom: 30px;
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: white;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 14px 18px;
	border: 1px solid #ddd;
	text-align: center;
}

th {
	background-color: #c72092;
	color: white;
}

tr:hover {
	background-color: #f1f1f1;
}

.btn-delete {
	background-color: #e74c3c;
	color: white;
	padding: 8px 14px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
	transition: background 0.3s ease;
}

.btn-delete:hover {
	background-color: #c0392b;
}

@media ( max-width : 768px) {
	table, thead, tbody, th, td, tr {
		display: block;
	}
	th {
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	td {
		position: relative;
		padding-left: 50%;
		border: none;
		border-bottom: 1px solid #eee;
	}
	td:before {
		content: attr(data-label);
		position: absolute;
		left: 15px;
		top: 12px;
		font-weight: bold;
		color: #c72092;
	}
}
</style>
</head>
<body>

	<h2>All Products</h2>

	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Category</th>
			<th>Price (₹)</th>
			<th>Action</th>
		</tr>
		<%
		List<product> products = (List<product>) request.getAttribute("products");
		if (products != null && !products.isEmpty()) {
			for (product p : products) {
		%>
		<tr>
			<td data-label="ID"><%=p.getId()%></td>
			<td data-label="Name"><%=p.getName()%></td>
			<td data-label="Category"><%=p.getCategory()%></td>
			<td data-label="Price">₹<%=p.getPrice()%></td>
			<td data-label="Action">
				<form action="delete-products-Servlet" method="post"
					style="display: inline;">
					<input type="hidden" name="id" value="<%=p.getId()%>" />
					<button class="btn-delete" type="submit">Delete</button>
				</form>
			</td>
		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td colspan="5">No products found.</td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>
