<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Product</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 50px;
    }

    h2 {
        text-align: center;
        color: #c72092;
        margin-bottom: 30px;
    }

    form {
        width: 400px;
        margin: 0 auto;
        background: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0px 0px 12px rgba(0,0,0,0.1);
    }

    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 18px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 15px;
    }

    button {
        width: 100%;
        padding: 12px;
        background-color: #c72092;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    button:hover {
        background-color: #a41d7d;
    }
</style>
</head>
<body>

<h2>Add New Product</h2>

<form action="add-product" method="post">
    <input type="text" name="name" placeholder="Product Name" required />
    <input type="text" name="category" placeholder="Category" required />
    <input type="number" step="0.01" name="price" placeholder="Price" required />
    <input type="text" name="image" placeholder="Image URL (Optional)" />
    <button type="submit">Add Product</button>
    <div class="back-link">
            <a href="index.jsp">← Back</a>
        </div>
    
</form>



</body>
</html>
