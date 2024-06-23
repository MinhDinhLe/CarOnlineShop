<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Product"  %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Customer"%>
<%@page import="DAO.prdDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THM Company</title>
<link rel="stylesheet" type="text/css" href="style/style.css"/>
</head>
<%
   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
 %>
	<% Customer cs = new Customer(); 
     	cs = (Customer) session.getAttribute("user"); %>
<body>
	
	
   <header class ="Header">
        <div class="logo-name">
          <img src="image/logo.png" class="logo"></img>
          <span class="Name-Company">THM</span>  
          <span class="Name-Company1">Company</span>
        </div>
        <nav class="Navigation">
     
            <% if (cs != null) { %>
				    <a href="#" onclick="submitForm()" class="Navigation-item">SHOW CART</a>

					<form id="showCartForm" action="<%= request.getContextPath() %>/Cart" method="post">
						<input type = "hidden" name = "productID" value = "-999">
					</form>
					
					<script>
					    function submitForm() {
					        document.getElementById("showCartForm").submit();
					    }
					</script>
				<% } else { %>
					<a href="#" onclick="window.location.href = 'LoginPayment.jsp';" class="Navigation-item">SHOW CART</a>
				<% } %>
            
        </nav>
    </header>
<nav id="left">
    <table>
        <tr>
            <td class="home-item">
                <div class="home-container">
                    <img src="image/home.png" class="logoHome">
                    <% if (cs != null) { %>
				    <a href="LoginSuccess.jsp" class="menu-link">Home</a>
					<% } else { %>
						<a href="LoginCus.jsp" class="menu-link">Home</a>
					<% } %>
                </div>
            </td>
        </tr>
        <tr>
            <td class="shop-item">
                <div class="shop-container">
                    <img src="image/shop.png" class="logoHome">
                    <a href="#" onclick="toggleProductForm()" class="Navigation-item">Product</a>

                    <div id="productForm" class="product-form" style="display: none;">
                       <form action="<%=request.getContextPath()%>/getPrdFilter" method="post">
                        <!-- Form lọc sản phẩm -->
                        <div class="Menu">
                        <input type="hidden" name="check" value ="cus"/>
                            <section style="padding-bottom: 10px;">
                                <h5 style="font-size: 18px; font-weight: bold; text-transform: uppercase; color: #333; margin: 0; padding: 5px 0; border-bottom: 1px solid #ccc;">Categories</h5>

                                <div class="form-check pl-0 mb-3">
                                    <input value="KIA" type="radio" class="form-check-input" id="kia" name="categoryRadios">
                                    <label class="form-check-label" style="font-size: 0.875rem; text-transform: uppercase; color: #555;" for="kia">KIA</label>
                                </div>

                                <div class="form-check pl-0 mb-3">
                                    <input value="TOYOTA" type="radio" class="form-check-input" id="toyota" name="categoryRadios">
                                    <label class="form-check-label" style="font-size: 0.875rem; text-transform: uppercase; color: #555;" for="toyota">TOYOTA</label>
                                </div>

                                <div class="form-check pl-0 mb-3">
                                    <input value="BMW" type="radio" class="form-check-input" id="bmw" name="categoryRadios">
                                    <label class="form-check-label" style="font-size: 0.875rem; text-transform: uppercase; color: #555;" for="bmw">BMW</label>
                                </div>
                            </section>
                        </div>
                        <button type="submit" class="btn btn-primary" style="background-color: gray; color: white; font-size: 14px;">Filter</button>
                    </form>
                    </div>
                </div>
            </td>
        </tr>
       
    </table>
</nav>

<style>
    .product-form {
        position: absolute;
        left: -50px;
        top: 100%;
        display: none;
  		position: absolute;
  		top: 75px;
  		left: -7px;
  		width: 100%;
  		background-color: #f7f7f7;
  		padding: 10px;
  		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  		text-align: left;
    }

    .shop-container {
        position: relative;
    }
</style>

<script>
    function toggleProductForm() {
        var form = document.getElementById("productForm");
        if (form.style.display === "none") {
            form.style.display = "block";
        } else {
            form.style.display = "none";
        }
    }
</script>


<script>
    function toggleProductForm() {
        var form = document.getElementById("productForm");
        if (form.style.display === "none") {
            form.style.display = "block";
        } else {
            form.style.display = "none";
        }
    }
</script>




<section id="content">
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #000;
        color: #fff;
    }
</style>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #000;
        color: #fff;
    }
</style>

<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #000;
        color: #fff;
    }
</style>

<section id="content2" style="display: flex; justify-content: center;">
    <table>
        <thead>
            <tr>
                <th>Car Name</th>
                <th>Car Brand</th>
                <th>Color</th>
                <th>Capacity</th>
                <th>Price</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% List<Product> Products = (ArrayList<Product>) session.getAttribute("prd"); %>
            
            <% for (Product product : Products) { %>
            <tr>
                <td><%= product.getCarName() %></td>
                <td><%= product.getCarBrand() %></td>
                <td><%= product.getColor() %></td>
                <td><%= product.getCapacity() %></td>
                <td><%= String.format("%.2f", product.getPrice()) + " $" %></td>
                <td>
                    <% if (product.getCarDescription() != null) { %>
                        <img src="<%= product.getCarDescription() %>" alt="Product Image" style="max-width: 150px; max-height: 200px;">
                    <% } %>
                </td>
                <td>
				<% if (cs != null) { %>
				    <form id="addCartForm" action="<%= request.getContextPath() %>/Cart" method="post">
					    <input type="hidden" value="<%= product.getCarID() %>" name="productID" />
					    <div>
					        <input type="image" src="image/addtocart.png" onclick="submitForm1()" style="width: 20px; height: 20px;">
					    </div>
					</form>
					
					<script>
					    function submitForm1() {
					        document.getElementById("addCartForm").submit();
					    }
					</script>
				<% } else { %>
					<input type="image" src="image/addtocart.png" onclick="window.location.href = 'LoginPayment.jsp';" style="width: 20px; height: 20px;">
				<% } %>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</section>

    <footer id = "footer">
        <p>&copy; Copyright ${currentYear} Mike Murach &amp; Associates, Inc.All rights reserved.</p>
    </footer>
    
    
</body>
</html>