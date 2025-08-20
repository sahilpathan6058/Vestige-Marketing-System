<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vestigecom.model.admin" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login | Vestige System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <style>
        body {
            background: #f0f0f0;
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #6c14d0;
        }

        .btn-primary {
            background-color: #c72092;
            border: none;
        }

        .btn-primary:hover {
            background-color: #a11878;
        }

        .back-link {
            text-align: center;
            margin-top: 15px;
        }

        .back-link a {
            color: #6c14d0;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="login-box">
        <h2>Admin Login</h2>
        <form action="admin-login" method="post">
            <div class="mb-3">
                <label for="admin-email" class="form-label">Email address</label>
                <input type="email" name="admin-email" class="form-control" id="admin-email" placeholder="admin@example.com" required>
            </div>
            <div class="mb-3">
                <label for="admin-password" class="form-label">Password</label>
                <input type="password" name="admin-password" class="form-control" id="admin-password" placeholder="******" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
        <div class="back-link">
            <a href="index.jsp">← Back to Home</a>
        </div>
    </div>

</body>
</html>
