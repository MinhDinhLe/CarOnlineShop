<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Product"  %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@page import="DAO.prdDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THM Company</title>
<link rel="stylesheet" type="text/css" href="style/style.css"/>
</head>
<body>
<%
   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
 %>
 <header class ="Header" >
        <div class="logo-name" >
        
          <img src="image/logo.png" onclick="window.location.href = 'LoginSuccessAD.jsp';" class="logo"></img>
          <span class="Name-Company">THM</span>  
          <span class="Name-Company1">Company</span>
        </div>
    </header>

  <nav id="left">
    <table>
        <tr>
            <td class="home-item">
                <div class="home-container">
                    <img src="image/home.png" class="logoHome">
                    <a href="#" onclick="submitForm()" class="menu-link">Show User</a>
                    <form id="showCartForm" action="<%= request.getContextPath() %>/showListUser" method="post">
			    
			</form>
			
			<script>
			    function submitForm() {
			        document.getElementById("showCartForm").submit();
			    }
			</script>

			<script>
			    function submitForm() {
			        var form = document.createElement('form');
			        form.method = 'post';
			        form.action = '<%=request.getContextPath()%>/showListUser';
			        document.body.appendChild(form);
			        form.submit();
			    }
			</script>
                </div>
            </td>
        </tr>
         <tr>
            <td class="shop-item">
                <div class="shop-container">
                    <img src="image/shop.png" class="logoHome">
                     <a href="#" onclick="submitForm2()" class="Navigation-item">Product</a>


			<form id="showCartForm" action="<%= request.getContextPath() %>/getPrd" method="post">
			    
			</form>
			
			<script>
			    function submitForm2() {
			        document.getElementById("showCartForm").submit();
			    }
			</script>

			<script>
			    function submitForm2() {
			        var form = document.createElement('form');
			        form.method = 'post';
			        form.action = '<%=request.getContextPath()%>/getPrd';
			
			        document.body.appendChild(form);
			        form.submit();
			    }
			</script>
                </div>
            </td>
        </tr>
        <tr>
            <td class="contact-item">
                <div class="contact-container">
                    <img src="image/contact.png" class="logoHome">
                    <span class="menu-text">Static</span>
                </div>
            </td>
        </tr>
    </table>
</nav>

<section id="content2" style="display: flex; justify-content: center;">
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Contact</th>
                <th>Username</th>
                <th>Password</th>
                <th>Action</th>

            </tr>
        </thead>
        <tbody>
            <% List<Customer> cuss = (ArrayList<Customer>) session.getAttribute("listuser"); %>
            <% for (Customer a : cuss) { %>
            <tr>
                <td><%= a.getName() %></td>
                <td><%= a.getContact() %></td>
                <td><%= a.getUserName() %></td>
                <td><%= a.getPasswd() %></td>
                <td>
 						<button onclick="event.preventDefault(); showEditI4Pop(this);" name="newData" value="<%= a.getCustomerID() %>"
                        data-username="<%= a.getUserName() %>"
                        data-name="<%= a.getName() %>"
                        data-contact="<%= a.getContact() %>">Update</button>                </td>
               
            </tr>
            <% } %>
        </tbody>
    </table>
    <div id="EditI4Popup" class="signin-popup">
    <div class="sign-content">
        <div class="sign-row">
            <h1>INFORMATION</h1>
            <button class="close-button" onclick="hideEditI4Popup()">&#10006;</button>
        </div>
        <form action="<%=request.getContextPath()%>/editI4" method="post">
        <input type="hidden" name="check" value ="editad"/>
            <table style="width: 100%">
                <tr>
                   <td>UserName</td>
					<td>
					<input type="text" name="username" id="usernameInput" placeholder="Loading..." readonly/>
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
    				<td><input type="hidden" name="password2" id="passwordInput2"placeholder="....."/></td>
				</tr>
            </table>
            <input type="hidden" name = "hiddenUsername" id="hiddenUsername2"/>
            <input type="submit" value="Login" />
        </form>
    </div>
</div>
	
</section>

    <footer id = "footer">
        <p>&copy; Copyright ${currentYear} Mike Murach &amp; Associates, Inc.All rights reserved.</p>
    </footer>
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
<script>
function showEditI4Pop(button) {
    var popup = document.getElementById("EditI4Popup");
    popup.style.display = "block";
    
    // Update input values
    var usernameInput = document.getElementById("usernameInput");
    var nameInput = document.getElementById("nameInput");
    var contactInput = document.getElementById("contactInput");
    
    hiddenUsername2.value=button.dataset.username;
    usernameInput.value = button.dataset.username;
    nameInput.value = button.dataset.name;
    contactInput.value = button.dataset.contact;
}
function hideEditI4Popup() {
    var popup = document.getElementById("EditI4Popup");
    popup.style.display = "none";
}
    </script>   
</body>
</html>