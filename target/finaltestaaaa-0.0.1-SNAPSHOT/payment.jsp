<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Customer"  %>
<%@ page import="DAO.lineitemDAO"  %>
<!DOCTYPE html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="style/style.css"/>
<style>
	.info-box {
  border: 1px solid #ccc;
  padding: 20px;
  background-color: #f9f9f9;
  max-width: 400px;
  margin: 0 auto;
  text-align: center;
}

.info-box h2 {
  font-size: 20px;
  color: #333;
}

.info-box p {
  font-size: 16px;
  color: #555;
  margin: 10px 0;
}

.info-box .account-info {
  font-weight: bold;
}

.info-box .transfer-info {
  margin-top: 20px;
}

.info-box .transfer-info p {
  text-align: left;
}

.info-box .transfer-info p:first-child {
  margin-top: 0;
}

.info-box .transfer-info p:last-child {
  margin-bottom: 0;
}
</style>
<style>
    .shop-button {
        background-color: #4CAF50; /* Màu nền */
        color: white; /* Màu chữ */
        border: none; /* Không có đường viền */
        padding: 10px 20px; /* Kích thước nút */
        text-align: center; /* Canh giữa văn bản */
        text-decoration: none; /* Không có gạch chân */
        display: inline-block; /* Hiển thị như một khối inline */
        font-size: 16px; /* Cỡ chữ */
        cursor: pointer; /* Con trỏ chuột thành hình bàn tay */
        border-radius: 4px; /* Đường cong viền */
        transition-duration: 0.3s; /* Thời gian chuyển đổi */
    }

    .shop-button:hover {
        background-color: #45a049; /* Màu nền khi di chuột qua */
    }
</style>
<%
   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
 %>
<%Customer cs = (Customer) session.getAttribute("user"); %>
<%
	lineitemDAO cart = new lineitemDAO();
%>
	
<body>
    <header class ="Header">
        <div class="logo-name">
          <img src="image/logo.png" class="logo"></img>
          <span class="Name-Company">THM</span>  
          <span class="Name-Company1">Company</span>
        </div>
        <nav class="Navigation">
			<% if (cs != null) { %>
    				   <a href="#" class="Navigation-item">Xin Chào <%= cs.getName() %></a>
				<% } %>
            <a href="showcart.jsp" class="Navigation-item">SHOW CART</a>
            

        </nav>
    </header>

	<nav id="left">
    <table>
        <tr>
            <td class="home-item">
                <div class="home-container">
                    <img src="image/home.png" class="logoHome">
                    <a href="LoginSuccess.jsp" class="menu-link">Home</a>
                </div>
            </td>
        </tr>
        <tr>
            <td class="shop-item">
                <div class="shop-container">
                    <img src="image/shop.png" class="logoHome">
                     <a href="#" onclick="submitForm()" class="Navigation-item">Product</a>

			<form id="showCartForm" action="<%= request.getContextPath() %>/getPrd" method="post">
			    
			</form>
                </div>
            </td>
        </tr>
  
			
			
        <tr>
            <td class="contact-item">
                <div class="contact-container">
                    <img src="image/contact.png" class="logoHome">
                    <span class="menu-text">Contact Us</span>
                    
                </div>
            </td>
        </tr>
    </table>
</nav>


    
    <section id="content">
        <div class = "Payment_pay">
            <h1>THM Company</h1>
            <h3>Information Delivery</h3>
            	
		    		
            	
            	<% if (!cart.Cart_Cus_0(cs.getCustomerID()).isEmpty()) { %>
				    <form action="<%=request.getContextPath()%>/sendEmailController" method="post">
		            <label >Full Name: </label>
		            <input type="text" name="fullName" required><br>
		
		            <label>Email </label>
		            <input type="email" name="email" required><br>
		            
		            <label for="phone">Phone Number: </label>
		            <input type="tel" id="phone" name="phone" required><br>
		            
		            <label >Address: </label>
		            <input type="text" name="addr" required><br>
		
		            <label>Payment Method: </label>
		            <input type="radio" name ="choice" value="PayOnCre"checked>Payment by Banking
		
		            <div class="info-box">
				        <h2>TRANSFER INFORMATION:</h2>
				        <p>Joint Stock Commercial Bank for Foreign Trade of Vietnam Vietcombank Ho Chi Minh City branch</p>
				        <p class="account-info">Account Owner: Nguyen Van A<br>Account Number: 0123456789</p>
				        <p class="transfer-info">Transfer content: Customer's full name + phrase "website" (Example: Nguyen Van A website). The operator will check with you when calling to confirm your order.</p>
				        <p>Thank you.</p>
				    </div>
				    	<input class="confirm" type="submit" value="Submit">
		            </form>
				<% } else { %>
					<br><br><h1>Your cart is empty. Please add items to your cart before submitting.</h1>
					<button class="shop-button" onclick = "window.location.href = 'showCatalog.jsp';">Go on shopping</button>
				<% } %>
        </div>
    </section>
    <footer id = "footer">
        <p>&copy; Copyright ${currentYear} Mike Murach &amp; Associates, Inc.All rights reserved.</p>
    </footer>
</body>
