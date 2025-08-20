
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>navbar</title>
<style>
  
header{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    background-color: #fff;
    border-bottom: 1px solid #94949450;
    box-shadow: 0px 0px 8px #4a3f3f41;
    z-index: 100;
}
header nav{
    width: 85%;
    margin: auto;
    height: 90px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
header nav .logo{
    color: #c72092;
    font-size: 50px;
    font-weight: 800;
    font-family: pyxidium quick;
    
}
header nav .logo span{
    color: #6020c7;
}
header nav .nav-links a{
    color: #111;
    font-weight: 600;
    letter-spacing: 1.2px;
    font-size: 18px;
    margin: 0 35px;
    text-transform: capitalize;
   
}
header nav .nav-links a:hover
{
    color: #c72092;
}

header nav .icons div{
    margin: 0 4px;
    cursor: pointer;
    font-size: 20px;
    transition: 0.3s;
    
}

header nav .icons div:hover{
    color: #c72092;
}

#menu-btn{
    display: none;
}


header nav .search-form{
    position: absolute;
    top: 110%;
    right:-100%;
    background: white;
    width: 350px;
    height: 40px;
    background: #fff;
    box-shadow: 5px 20px 20px rgba(3, 3, 3, 0.1);
    border-radius: 5px;
    overflow: hidden;
    display: flex;
    align-items: center;
}

header nav  .search-form.active{
    right: 0%;
  
}
header nav .search-form input{
    height: 100%; 
    width: 100%;
    background: none;
    text-transform: none;
    font-size: 15px;
    padding-left: 68px;
    outline: none;
    border: none;
}
header nav  .search-form label{
    font-size: 20px;
    padding-right: 24px;
    color: rgb(41, 38, 38);
    cursor: pointer;
}
header nav  .search-form label:hover{
    color: #c72092;
}

header nav .login-form{
    border: 0 solid;
    position: absolute;
    top: 110%;
    right: -100%;
    box-shadow: 5px 30px 10px rgba(7, 7, 7, 0.1);
    padding: 20px;
    border-radius: 8px;
    text-align: center;
    background: #fff;
    width: 350px;
   
    
}

header nav .login-form.active{
    right: 0%;
    transition: .4s linear;
}
    
   

header nav .login-form h3{
    font-size: 30px;
    text-transform: uppercase;
    color: black;
}


header nav .login-form .box{
    border: 0 solid;
    margin: 11.2px 0;
    background: #eee;
    border-radius: 4px;
    padding: 10px 10px;
    color: black;
    text-transform: none;
    width: 100%;

}

header nav .login-form p{
    font-size: 17px;
    padding: 5px 0;
    

}

header nav .login-form .btn{
    font-size: 20px;
    border: 1px solid;
    border-radius: 5px;
    padding: 2px;
    transition: 0.3s;
 
}

header nav .login-form .btn:hover {
  background: #c72092;
  color: #fff;
}

#menu-btn{
    display: none;
}

header nav .nav-links.active{
    right: -6%;
    transition: .4s linear;
}
@media only screen and (max-width: 768px) {
    
    header nav .nav-links {
        display: flex;
        position: absolute;
        top: 110%;
        right:-100%;
        transform: translateX(-50%);
        flex-direction: column;
        background:#fff;
        width: 150px;
        height: 250px;
        padding: 30px 10px;
        box-shadow: 5px 30px 10px rgba(7, 7, 7, 0.1);
        
        
        
    }
    header nav .nav-links a{
        padding: 0 10px;
        margin: 10px 10px;
        text-align: center;
      
    }
    #menu-btn{
        display: inline-block;
    }

    header nav .icons {
        display: flex;
        position: absolute;
        right: 7%;
    }
    header nav .search-form,
    header nav .login-form {
        top: 90%;
    } 
   }
  @media only screen and (max-width: 1024px) {
    header nav {
        width: 90%;
        height: 80px;
    }

    header nav .logo {
        font-size: 40px;
    }

    header nav .nav-links {
        position: fixed;
        top: 0;
        left: -100%;
        width: 250px;
        height: 100vh;
        background: rgba(255, 255, 255, 0.95);
        box-shadow: 2px 0px 10px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding-top: 50px;
        transition: 0.4s ease-in-out;
    }

    header nav .nav-links.active {
        left: 0;
    }

    header nav .nav-links a {
        padding: 15px 20px;
        font-size: 20px;
        font-weight: bold;
        color: #333;
        display: block;
        text-align: center;
        width: 100%;
        transition: background 0.3s ease;
    }

    header nav .nav-links a:hover {
        background: #c72092;
        color: #fff;
    }

    /* Menu icon styling */
    #menu-btn {
        display: inline-block;
        font-size: 30px;
        cursor: pointer;
        padding: 10px;
        transition: 0.3s ease-in-out;
    }

    /* Animation for menu button */
    #menu-btn.active {
        transform: rotate(90deg);
    }

    /* Overlay effect when menu opens */
    .overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100vh;
        background: rgba(0, 0, 0, 0.5);
        z-index: 50;
        display: none;
    }

    .overlay.active {
        display: block;
    }
}


    </style>
</head>
<body>
    <header>
        <nav>
            <a href="#" class="logo">vestige<span>e</span></a>
            <div class="nav-links" id="nav-links">
                <a href="index.jsp">home</a>
                <a href="https://www.leadmlmsoftware.com/vestige-mlm-company/">About Us</a>
                <a href=#product>product</a>

			  
			   <%
			   
			   if (auth != null) {	%>
				
                <a href="orders.jsp">orders</a>
                <a href="userLogout">LogOut</a>
        
			<%
				} else {
				%>
				            
            </div>

        <div class="icons">
          <div class="fa fa-user" id="login-btn"></div>
             	
               <%
				}
				%>
            <div class="fa fa-bars" id="menu-btn"></div>
            <div class="fa fa-shopping-cart" id="cart-btn"><span id="cart-count">>${cart_list.size()}</span></div>
                <div class="fa fa-search" id="search-btn"></div>
             </div>
            <form class="search-form" id="search-form">
                <input type="search" id="search-box" placeholder="Search Here...." />
                <label for="search-box" class="fa fa-search"></label>
            </form>

           
        </nav>
    </header>

    <script>
    
    let searchForm= document.querySelector('.search-form');

    document.querySelector('#search-btn').onclick = () => {
        searchForm.classList.toggle('active');
    };
    
    
    document.getElementById("cart-btn").addEventListener("click", function () {
        window.location.href = "cart.jsp"; 
    });
    
    document.getElementById("login-btn").addEventListener("click", function () {
        window.location.href = "login.jsp";
    });
    

        


        
        const menuBtn = document.getElementById("menu-btn");
        const navLinks = document.querySelector(".nav-links");
        const overlay = document.createElement("div");
        overlay.classList.add("overlay");
        document.body.appendChild(overlay);

        menuBtn.addEventListener("click", function () {
            navLinks.classList.toggle("active");
            menuBtn.classList.toggle("active");
            overlay.classList.toggle("active");
        });

        // Close menu when clicking outside
        overlay.addEventListener("click", function () {
            navLinks.classList.remove("active");
            menuBtn.classList.remove("active");
            overlay.classList.remove("active");
        });


    </script>
</body>
</html>
