
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vestigecom.model.*"%>
<%@page import="vestigecom.connection.DBCon"%>
<%@page import="java.util.*"%>
<%@page import="vestigecom.Dao.productDao"%>
<%@page import="java.text.DecimalFormat"%>

<%
   
     user auth =(user) request.getSession().getAttribute("auth");
     if(auth != null){
    	 request.setAttribute("person",auth);
     }
     productDao pd = new productDao(DBCon.getConnection());
     List<product> product = pd.getAllProducts();
     
     ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
     if (cart_list != null) {
     	request.setAttribute("cart_list", cart_list);
     }
     
     
     %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Vestige family</title>

<link rel="shortcut icon" href="Product-images/vestige.png">

<link rel="stylesheet" href="css/styles.css">

<!-- link Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<%@include file="/includes/head.jsp"%>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>

	<section class="hero" id="home">
		<div class="contnaier">
			<div class="content">
				<p>Health is wealth</p>
				<h1>
					Vestige <br> <span>Marketing</span>
				</h1>
				<p>up to 40% off final sale items.</p>
				<p class="last-p">caught in the moment!</p>
				<a href="#" class="btn">shop now</a>
			</div>
		</div>
	</section>
	<section class="banner" id="">
		<div class="boxs contnaier">
			<div class="box">
				<img src="images/show5jpg.jpg" alt="">
				<div class="text">
					<span>Agri product</span>
					<h5>How whose our product</h5>
					<a href="#" class="btn">Discover Now</a>
				</div>
			</div>

			<div class="box">
				<img src="images/hd3.jpg" alt="">
				<div class="text">
					<span>Food product</span>
					<h5>How whose our product</h5>
					<a href="#" class="btn">Discover Now</a>
				</div>
			</div>

			<div class="box">
				<img src="images/hd6.jpg" alt="">
				<div class="text">
					<span>Skin product</span>
					<h5>How whose our product</h5>
					<a href="#" class="btn">Discover Now</a>
				</div>
			</div>
		</div>
	</section>



	<section class="products" id="product">
		<div class="contnaier">

			<% 
            Map<String, List<product>> categoryProducts = new HashMap<>();
            for (product p : product) {
                categoryProducts.putIfAbsent(p.getCategory(), new ArrayList<>());
                categoryProducts.get(p.getCategory()).add(p);
            }
            
            for (Map.Entry<String, List<product>> entry : categoryProducts.entrySet()) {
        %>

			<!-- Category Section -->
			<div class="category-section">
				<h3 class="category-title"><%= entry.getKey() %></h3>
				<div class="items">

					<% int count = 0; %>
					<% for (product p : entry.getValue()) { %>
					<% if (count % 4 == 0 && count != 0) { %>
				</div>
				<div class="items">
					<% } %>
					<div class="item">
						<img src="images/<%=p.getImage() %>" alt="">
						<div class="product-desc">
							<a href="#" class="title-prod"><%=p.getName() %></a>
							<div class="stars">
								<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star-half-stroke"></i>
							</div>
							<div class="price">
								₹<%=p.getPrice() %>
								<del>₹89</del>
								<button type="submit">
									<a href="order-now?quantity=1&id=<%=p.getId()%>">BUY NOW</a>
								</button>
							</div>
							<div class="icon-product">
								<a href="#"><i class="fa-regular fa-heart"></i></a> <a
									href="add-to-cart?id=<%=p.getId()%>"><i
									class="fa-solid fa-cart-shopping"
									onclick="alert( 'Add to cart' )"></i></a> <a href="#"><i
									class="fa-solid fa-right-left"></i></a>
							</div>
						</div>
					</div>
					<% count++; %>
					<% } %>
				</div>
			</div>
			<% } %>
		</div>
	</section>
	
	

<section class="review" id="reviews">
    <h1>Customer Reviews<span></span></h1>
    <div class="review_box">
      <div class="review_card">
        <div class="card_top">
          <div class="profile">
            <div class="profile_image">
                <img src="images/akya.jpg" alt="">
            </div>
            <div class="name">akash waje</div>
          </div>
          <div class="rating">
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star-half-stroke"></i>
        </div>
        </div>
        <div class="comment">
          <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet libero eros. Proin scelerisque urna non ligula fermentum tristique."</p>
        </div>
      </div>
      <div class="review_card">
        <div class="card_top">
          <div class="profile">
            <div class="profile_image">
                <img src="images/mauli.jpg" alt="Image">
            </div>
            <div class="name">mauli</div>
          </div>
          <div class="rating">
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star-half-stroke"></i>
        </div>
        </div>
        <div class="comment">
          <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet libero eros. Proin scelerisque urna non ligula fermentum tristique."</p>
        </div>
      </div>
      <div class="review_card">
        <div class="card_top">
          <div class="profile">
            <div class="profile_image">
                <img src="images/parshya.jpg" alt="Image">
            </div>
            <div class="name">parshant</div>
          </div>
          <div class="rating">
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star-half-stroke"></i>
        </div>
        </div>
        <div class="comment">
          <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet libero eros. Proin scelerisque urna non ligula fermentum tristique."</p>
        </div>
      </div>
      <div class="review_card">
        <div class="card_top">
          <div class="profile">
            <div class="profile_image">
                <img src="images/sahil.jpg" alt="Image">
            </div>
            <div class="name">sahil</div>
          </div>
          <div class="rating">
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star-half-stroke"></i>
        </div>
        </div>
        <div class="comment">
          <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet libero eros. Proin scelerisque urna non ligula fermentum tristique."</p>
        </div>
      </div>
      <div class="review_card">
        <div class="card_top">
          <div class="profile">
            <div class="profile_image">
                <img src="images/vp.jpg" alt="Image">
            </div>
            <div class="name">vp</div>
          </div>
          <div class="rating">
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star-half-stroke"></i>
        </div>
        </div>
        <div class="comment">
          <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet libero eros. Proin scelerisque urna non ligula fermentum tristique."</p>
        </div>
      </div>
      <div class="review_card">
        <div class="card_top">
          <div class="profile">
            <div class="profile_image">
                <img src="images/aftab.jpg" alt="Image">
            </div>
            <div class="name">Aftab</div>
          </div>
          <div class="rating">
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star-half-stroke"></i>
        </div>
        </div>
        <div class="comment">
          <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet libero eros. Proin scelerisque urna non ligula fermentum tristique."</p>
        </div>
      </div>
    </div>
  </section>
  

    <div class="newsletter">
        <div class="contnaier">
            <div class="text">
                <h4>sign up to vestige</h4>
                <p>Get email updates about our latest shop...and receive</p>
            </div>

            <div class="subscribe-form">
                <form action="">
                    <input type="email" placeholder="enter your email here...">
                    <button class="btn-srch">Subscribe</button><br>
                  
                </form>
            </div>
        </div>
    </div>
	
	
	




	<%@include file="/includes/footer.jsp"%>
</body>
</html>