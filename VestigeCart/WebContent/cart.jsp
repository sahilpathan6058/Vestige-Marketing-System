<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vestigecom.model.*"%>
<%@page import="vestigecom.connection.DBCon"%>
<%@page import="java.util.*"%>
<%@page import="vestigecom.Dao.productDao"%>
<%@page import="java.text.DecimalFormat"%>
    
    
    <%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    user auth =(user) request.getSession().getAttribute("auth");
    if(auth != null){
   	 request.setAttribute("auth",auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
    	productDao pDao = new productDao(DBCon.getConnection());
    	cartProduct = pDao.getCartProducts(cart_list);
    	request.setAttribute("cart_list", cart_list);
    	double total = pDao.getTotalCartPrice(cart_list);
    	request.setAttribute("total", total);
    }
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vestige Cart</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


 <style>
 
 
     body {
        background-color: #f5f5f5;
    }

    .center-wrapper {
        margin-top: 20vh; /* shifts content below navbar */
    }

    .cart-summary {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 1rem;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        margin-bottom: 1rem;
    }

    .table-container {
        background-color: #fff;
        padding: 1.5rem;
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }

    .table thead th {
        text-align: center;
        vertical-align: middle;
    }

    .table tbody td {
        vertical-align: middle;
        text-align: center;
    }
   .checkout-btn {
    background: linear-gradient(45deg, #c72092, #6020c7);
        color: white;
        padding: 12px 28px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        text-decoration: none;
        display: inline-block;
        transition: background-color 0.3s ease, transform 0.2s ease;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .checkout-btn:hover {
        background-color: #218838;
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        background: linear-gradient(45deg, #6020c7, #c72092);
    }
    .btn-increase, .btn-decrease {
        font-size: 1.2rem;
        border: none;
        background: transparent;
        color: #333;
        transition: color 0.2s ease;
    }

    .btn-increase:hover, .btn-decrease:hover {
        color: #007bff;
    }

    .quantity-box {
        width: 60px;
        text-align: center;
        border: none;
        background-color: #f8f9fa;
        font-weight: bold;
    }
    </style>

</head>
<body>
	<%@include file="/includes/navbar.jsp"%>

	<div class="container center-wrapper">
    <div class="cart-summary">
        <h4>Total Price: ₹ ${(total>0)?dcf.format(total):0}</h4>
<a href="Cart-Check-Out" class="checkout-btn">
    <i class="fas fa-shopping-cart"></i> Proceed to Checkout
</a>
    </div>

    <div class="table-container">
        <table class="table table-bordered table-hover">
            <thead class="table-light">
                <tr>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Buy Now</th>
                    <th>Cancel</th>
                </tr>
            </thead>
            <tbody>
            <%
            if (cartProduct != null) {
                for (Cart c : cartProduct) {
            %>
                <tr>
                    <td><%= c.getName() %></td>
                    <td><%= c.getCategory() %></td>
                    <td>₹ <%= dcf.format(c.getPrice()) %></td>
                    <td>
                        <form action="order-now" method="post">
                            <input type="hidden" name="id" value="<%= c.getId() %>">
                            <div class="d-flex justify-content-center align-items-center">
                                <a class="btn-increase me-2" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>">
                                    <i class="fas fa-plus-circle"></i>
                                </a>
                                <input type="text" name="quantity" class="quantity-box" value="<%= c.getQuantity() %>" readonly>
                                <a class="btn-decrease ms-2" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>">
                                    <i class="fas fa-minus-circle"></i>
                                </a>
                            </div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>

							</form>
                    </td>
                    <td>
                        <a href="remove-from-cart?id=<%=c.getId()%>" class="btn btn-sm btn-danger">Remove</a>
                    </td>
                </tr>
            <%
                }
            } else {
            %>
                <tr>
                    <td colspan="5" class="text-center">Your cart is empty.</td>
                </tr>
            <%
            }
            %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>