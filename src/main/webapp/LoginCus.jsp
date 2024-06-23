<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style/style.css"/>
<title>THM Company</title>
</head>
<body>
<%
   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
 %>
 <div id="loginPopup" class="login-popup">
    <div class="login-content">
    	<div class="login-row">
    				<h1>LOGIN</h1>
    				<button class="close-button" onclick="hideLoginPopup()">&#10006;</button>
				</div>
        <form action="<%=request.getContextPath()%>/LoginCusController" method="post">
        
        		<input type="hidden" name="check" value ="cus"/>
            <table style="width: 100%">
            
                <tr>
                    <td>UserName</td>
                    <td><input type="text" name="username" /></td>
                    
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" /></td>
                </tr>
                 
            </table>
            <input type="submit" value="Login" />
        </form>
        
    </div>
   
</div>
 <div id="forgetPopup" class="login-popup">
    <div class="login-content">
    	<div class="login-row">
    				<h1>Forget</h1>
    				<button class="close-button" onclick="hideforgetPopup()">&#10006;</button>
				</div>
        <form action="<%=request.getContextPath()%>/forgetPass" method="post">
            <table style="width: 100%">
            
                <tr>
                    <td>UserName</td>
                    <td><input type="text" name="username" /></td>
                    
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="contact" /></td>
                </tr>
                 
            </table>
            <input type="submit" value="Send" />
        </form>
        
    </div>
   
</div>
 <div id="signinPopup" class="signin-popup">
    <div class="sign-content">
    	<div class="sign-row">
    				<h1>SIGN UP</h1>
    				<button class="close-button" onclick="hideSigninPopup()">&#10006;</button>
				</div>
        <form action="<%=request.getContextPath()%>/signup" method="post">
        
        		<input type="hidden" name="check2" value ="cus"/>
            <table style="width: 100%">
            
                <tr>
                    <td>UserName</td>
                    <td><input type="text" name="username" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" /></td> 
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" /></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="email" name="contact" /></td>
                </tr>
            </table>
            <input type="submit" value="Sign Up" />
        </form>
        
    </div>
   
</div>
<% String errMsg = (String) request.getAttribute("error"); %>
<% if (errMsg != null) { %>
  <div class="error-message" style="background-color: #ffcccc; color: #ff0000; padding: 10px; margin-bottom: 10px; border-radius: 5px;">
    <%= errMsg %>
  </div>
<% } %>
   <header class ="Header">
        <div class="logo-name">
          <img src="image/logo.png" class="logo"></img>
          <span class="Name-Company">THM</span>  
          <span class="Name-Company1">Company</span>
        </div>
        <nav class="Navigation">
     
            <a href="#" class="Navigation-item" onclick="event.preventDefault(); showLoginPop('<%=request.getContextPath()%>/LoginCusController')">LOGIN</a>
			<a href="#" class="Navigation-item" onclick="event.preventDefault(); showLoginPop('<%=request.getContextPath()%>/LoginAdController')">ADMIN</a>
            <a href="#" class="Navigation-item" onclick="event.preventDefault(); showSigninPop()">SIGN UP</a>
        </nav>
    </header>

<nav id="left">
    <table>
        <tr>
            <td class="home-item">
                <div class="home-container">
                    <img src="image/home.png" class="logoHome">
                    <a href="LoginCus.jsp" class="menu-link">Home</a>
                </div>
            </td>
        </tr>
         <tr>
            <td class="shop-item">
                <div class="shop-container">
                    <img src="image/shop.png" class="logoHome">
                     <a href="#" onclick="submitForm()" class="Navigation-item">Product</a>

			<form id="showCartForm" action="<%=request.getContextPath()%>/getPrd" method="post">
			    
			</form>
                </div>
            </td>
        </tr>
        <tr>
            <td class="contact-item">
                <div class="contact-container">
                    <img src="image/contact.png" class="logoHome">
                    <a href="#" class="Navigation-item" onclick="event.preventDefault(); showforgetPop()">Forget Pass</a>
                </div>
            </td>
        </tr>
    </table>
</nav>

    
    <section id="content">
         <h1>Welcome to our store   !</h1><br>
         <p>We are proud to be a leading car rental company, providing customers with flexible and convenient transportation solutions. With many years of experience in the industry and a team of professional staff, we are committed to providing quality services and meeting all customer needs.<br><br>
            
            With diverse and abundant car rentals, we can meet all your car rental needs. Whether you need a small car to move around the city, a spacious family car for travel or a luxury car to make a special impression, we will advise and provide the right solution. best.<br><br>
            Quality and safety are always our top priorities. All of our rental cars are regularly maintained and quality checked before being delivered to customers. Our team of professional technicians ensures that each vehicle is in good working order and reliable.<br><br>
            
            Not only providing car rental services, we are also committed to providing the best customer experience. Our staff is always ready to assist you from the car booking process, consulting on suitable options, to the car rental and return process. We understand that your time is valuable, so we are committed to responding to all your requests quickly and efficiently.<br><br>
            
            With us, renting a car becomes easy and hassle-free. Let us become your trusted partner in every trip. Contact us today for more information and to experience our quality service.<br><br>
            
            Thank you very much for choosing our car rental company. We will constantly strive to meet all your expectations and provide complete satisfaction.</p>
    </section>

    <footer id = "footer">
        <p>&copy; Copyright ${currentYear} Mike Murach &amp; Associates, Inc.All rights reserved.</p>
    </footer>
    <script>
    function showLoginPop(formAction) {
        var popup = document.getElementById("loginPopup");
        var loginForm = popup.querySelector("form");
        loginForm.action = formAction;
        popup.style.display = "block";
    }

    function hideLoginPopup() {
        var popup = document.getElementById("loginPopup");
        popup.style.display = "none";
    }
    function showSigninPop() {
        var popup = document.getElementById("signinPopup");
        popup.style.display = "block";
    }
    function hideSigninPopup() {
        var popup = document.getElementById("signinPopup");
        popup.style.display = "none";
    }
    function showforgetPop() {
        var popup = document.getElementById("forgetPopup");
        popup.style.display = "block";
    }
    function hideforgetPopup() {
        var popup = document.getElementById("forgetPopup");
        popup.style.display = "none";
    }
</script>
<script>
			    function submitForm() {
			        document.getElementById("showCartForm").submit();
			    }
			</script>

			<script>
			    function submitForm() {
			        var form = document.createElement('form');
			        form.method = 'post';
			        form.action = '<%=request.getContextPath()%>/getPrd';
			
			        document.body.appendChild(form);
			        form.submit();
			    }
			</script>
</body>
</html>