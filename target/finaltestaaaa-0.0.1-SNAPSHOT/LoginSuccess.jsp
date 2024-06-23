<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Customer"  %>
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
	<%Customer cs = (Customer) session.getAttribute("user"); %>
	<%
				if (cs == null) {
    					response.sendRedirect("LoginCus.jsp");
					}
						%>
<div id="EditI4Popup" class="signin-popup">
    <div class="sign-content">
        <div class="sign-row">
            <h1>INFORMATION</h1>
            <button class="close-button" onclick="hideEditI4Popup()">&#10006;</button>
        </div>
        <form action="<%=request.getContextPath()%>/editI4" method="post">
        <input type="hidden" name="check" value ="editcus"/>
            <table style="width: 100%">
                <tr>
                   <td>UserName</td>
					<td>
					<input type="text" name="username" id="usernameInput" placeholder="Loading..." disabled/></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" id="nameInput" placeholder="Loading..." /></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="contact" id="contactInput" placeholder="Loading..." /></td>
                </tr>
                <tr>
    				<td>Password</td>
    				<td><input type="text" name="password2" id="passwordInput2"placeholder="....."/></td>
				</tr>
            </table>
              <% if (cs != null) { %>
    				<input type="hidden" name="hiddenUsername" value="<%= cs.getUserName() %>">
				<% } %>
            <input type="submit" value="Login" />
        </form>
    </div>
</div>
	
	

   <header class ="Header">
        <div class="logo-name">
          <img src="image/logo.png" class="logo"></img>
          <span class="Name-Company">THM</span>  
          <span class="Name-Company1">Company</span>
        </div>
        <nav class="Navigation">
      <% if (cs != null) { %>
    				   <a href="#" class="Navigation-item" onclick="event.preventDefault(); showEditI4Pop();">Xin Chào <%= cs.getName() %></a>
				<% } %>
         
			<a href="<%=request.getContextPath()%>/LogOut" class="Navigation-item">LOG OUT</a>
            
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
         <h1>Welcome to our car rental company!</h1><br>
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
    function showEditI4Pop() {
        var popup = document.getElementById("EditI4Popup");
        popup.style.display = "block";
    }

    function hideEditI4Popup() {
        var popup = document.getElementById("EditI4Popup");
        popup.style.display = "none";
    }

    function updateInputPlaceholders() {
    	 <% if (cs != null) { %>
    	 const usernameInput = document.getElementById("usernameInput");
         const nameInput = document.getElementById("nameInput");
         const contactInput = document.getElementById("contactInput");
         const usernamePlaceholder = "<%= cs.getUserName() %>";
         const namePlaceholder = "<%= cs.getName() %>";
         const contactPlaceholder = "<%= cs.getContact() %>";

         usernameInput.setAttribute("placeholder", usernamePlaceholder);
         nameInput.setAttribute("placeholder", namePlaceholder);
         contactInput.setAttribute("placeholder", contactPlaceholder);
         document.getElementById("usernameInput").value = "<%= cs.getUserName() %>";
		<% } %>
   
    }

    // Call the function to update the input placeholders when the page loads
    window.addEventListener("DOMContentLoaded", updateInputPlaceholders);
    
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