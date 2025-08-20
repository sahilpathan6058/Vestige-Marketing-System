<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
          <%@page import="vestigecom.model.*"%>
          <%@page import="java.util.*" %>
          
    
     <%
     user auth =(user) request.getSession().getAttribute("auth");
     if(auth != null){
    	 response.sendRedirect("index.jsp");
    	 
    	 ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    		if (cart_list != null) {
    			request.setAttribute("cart_list", cart_list);
    		}
     }
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
<%@include file="/includes/head.jsp"%>

</head>
<body>
<%@include file="/includes/navbar.jsp"%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

 <style>
      body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background-color: white;
        width: 400px;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }

    .nav {
        list-style: none;
        display: flex;
        justify-content: space-around;
        padding: 0;
        margin-bottom: 20px;
        border-bottom: 2px solid #ddd;
    }

    .nav-item {
        flex: 1;
        text-align: center;
    }

    .nav-link {
        display: inline-block;
        width: 100%;
        padding: 10px;
        font-weight: bold;
        color: #c72092;
        border: none;
        background: none;
        cursor: pointer;
        border-bottom: 3px solid transparent;
        transition: 0.3s;
    }

    .nav-link.active {
        border-bottom: 3px solid #c72092;
        color: #6c14d0;
    }

    .tab-content {
        padding: 10px 0;
    }

    .mb-3 {
        margin-bottom: 15px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #444;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
        transition: border 0.2s;
    }

    input:focus {
        border-color: #c72092;
        outline: none;
    }

    .btn {
        padding: 10px;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s;
    }

    .btn-primary {
        background-color: #c72092;
    }

    .btn-primary:hover {
        background-color: #a11878;
    }

    .btn-success {
        background-color: #28a745;
    }

    .btn-success:hover {
        background-color: #218838;
    }

    .w-100 {
        width: 100%;
    }

    .text-center {
        text-align: center;
    }
    </style>
</head>
<body>
<%@include file="/includes/navbar.jsp"%>

<div class="container">
    <div class="form-container">
        <!-- Tabs -->
        <ul class="nav nav-tabs mb-3" id="authTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button">Login</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="signup-tab" data-bs-toggle="tab" data-bs-target="#signup" type="button">Sign Up</button>
            </li>
        </ul>

        <!-- Tab content -->
        <div class="tab-content">
            <!-- Login Form -->
            <div class="tab-pane fade show active" id="login" role="tabpanel">
                <form action="userlogin" method="post">
                    <div class="mb-3">
                        <label>Email address</label>
                        <input type="email" name="login-email" class="form-control" placeholder="Enter email" required>
                    </div>
                    <div class="mb-3">
                        <label>Password</label>
                        <input type="password" name="login-password" class="form-control" placeholder="******" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary w-100" style="background-color: #c72092; border: none;">Login</button>
                    </div>
						<div class="text-center mt-2">
							<a href="adminlogin.jsp"
								style="color: #6c14d0; text-decoration: none;">Login as
								Admin</a>
						</div>
					</form>
            </div>

            <!-- Signup Form -->
            <div class="tab-pane fade" id="signup" role="tabpanel">
                <form action="sign-up" method="post">
                    <div class="mb-3">
                        <label>Full Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Your Name" required>
                    </div>
                    <div class="mb-3">
                        <label>Email address</label>
                        <input type="email" name="email" class="form-control" placeholder="Enter email" required>
                    </div>
                    <div class="mb-3">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" placeholder="******" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-success w-100"style="background-color: #c72092; border: none;" >Sign Up</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>