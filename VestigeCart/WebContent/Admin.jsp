<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vestigecom.model.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: #f4f4f4;
	margin: 0;
	padding: 0;
}

.navbar {
	background: #c72092;
	color: white;
	padding: 20px;
	text-align: center;
	font-size: 28px;
	font-weight: bold;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.admin-container {
	max-width: 1100px;
	margin: 40px auto;
	padding: 0 20px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	gap: 20px;
}

.admin-section {
	background: white;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	flex: 1 1 30%;
	padding: 30px 20px;
	transition: transform 0.2s ease;
}

.admin-section:hover {
	transform: translateY(-5px);
}

.admin-section h3 {
	color: #333;
	margin-bottom: 20px;
	font-size: 22px;
	text-align: center;
}

.btn {
	display: block;
	background: #c72092;
	color: white;
	padding: 12px;
	margin: 10px auto;
	border: none;
	border-radius: 5px;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	width: 80%;
	transition: background 0.3s;
}

.btn:hover {
	background: #a91d7a;
}

@media ( max-width : 768px) {
	.admin-container {
		flex-direction: column;
		align-items: center;
	}
	.admin-section {
		width: 90%;
	}
}
</style>

</head>
<body>


	<div class="navbar">Admin Dashboard
	</div>

	<div class="admin-container">

		<div class="admin-section">
			<h3>Manage Users</h3>
			<a href="view-user-servlet" class="btn">View All Users</a>
		</div>

		<div class="admin-section">
			<h3>Manage Products</h3>
			<a href="view-products-servlet" class="btn">View Products</a> <a
				href="addProduct.jsp" class="btn">Add New Product</a>
		</div>

		<div class="admin-section">
			<h3>Manage Orders</h3>
			<a href="view-orders-servlet" class="btn">View Orders</a>
		</div>

	</div>
	<div class="back-link">
            <a href="index.jsp">← Back</a>
        </div>

</body>
</html>
