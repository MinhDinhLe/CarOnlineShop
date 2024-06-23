<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Lineitem"%>
<%@page import="model.Product"%>
<%@page import="model.Customer"%>
<%@page import="DAO.invoiceDAO"%>
<%@page import="DAO.prdDAO"%>
<%@page import="DAO.lineitemDAO"%>
   
<!DOCTYPE html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="style/style.css"/>
<%
   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
 %>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
    }

    tfoot td {
        font-weight: bold;
    }
</style>
<body>
    <header class ="Header">
        <div class="logo-name">
          <img src="image/logo.png" class="logo"></img>
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
                    <a href="LoginSuccess.jsp" class="menu-link">Home</a>
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
    	<% 
		    Object cartObject = session.getAttribute("cart");
		    List<Lineitem> cart = new ArrayList<Lineitem>();
		    cart = (List<Lineitem>) cartObject;
		    prdDAO prdData = new prdDAO();
		%>
    	<% prdDAO prd = new prdDAO(); %>
        <h1>Your Cart</h1><br>
		<table>
		    <thead>
		        <tr>
		            <th>Item</th>
		            <th>Price</th>
		            <th>Quantity</th>
		            <th>Total</th>
		            <th>Update quantity</th>
		            <th>Action</th>
		        </tr>
		    </thead>
		    <tbody>
		        <% for (Lineitem item : cart) { %>
		        <tr>
		            <td><%= prdData.getPrd(item.getCarID()).getCarName() %></td>
		            <td><%= String.format("%.2f", prdData.getPrd(item.getCarID()).getPrice()) + " $" %></td>
		            <td><%= item.getQuantity() %></td>
		            <td><%= String.format("%.2f", prdData.getPrd(item.getCarID()).getPrice() * item.getQuantity()) + " $" %></td>
		            <td>
		            <form action="Cart" method="post">
						<input type="hidden" name="productID" value="<%= item.getCarID() %>">
						<input type=text name="quantity" value="<%= item.getQuantity() %>" id="quantity">
						<input type="hidden" name="update" value="true">
						<input type="submit" value="Update">
                    </form>
                    </td>
		            <td>
		            	<form id="removeItemForm_<%= item.getCarID() %>" action="<%= request.getContextPath() %>/Cart" method="post">
						    <input type="hidden" name="rm" value="Remove Item">
						    <input type="hidden" name="productID" value="<%= item.getCarID() %>">
						    <div>
						        <a href="#" onclick="submitForm2(<%= item.getCarID() %>)">Remove</a>
						    </div>
						</form>
						
						<script>
			                function submitForm2(carID) {
			                    document.getElementById("removeItemForm_" + carID).submit();
			                }
			            </script>
                    </td>
		        </tr>
		        <% } %>
		    </tbody>
		    <tfoot>
		        <tr>
		            <td colspan="3">Total</td>
		            <td>
		                <% 
		                    double total = 0;
		                    for (Lineitem item : cart) {
		                        total += prdData.getPrd(item.getCarID()).getPrice() * item.getQuantity();
		                    }
		                    out.print(String.format("%.2f", total) + " $" );
		                %>
		            </td>
		        </tr>
		    </tfoot>
		</table>
        <br><div class = "PayOrShop">
        	<% Customer cs = (Customer) session.getAttribute("user"); %>
			<% if (cs != null) { %>
			    <button class="Pay" onclick="window.location.href = 'payment.jsp';">Purchase</button>
			<% } else { %>
			    <button class="Pay" onclick="window.location.href = 'LoginPayment.jsp';">Purchase</button>
			<% } %>
            <button class="Shop" onclick = "window.location.href = 'showCatalog.jsp';">Go on shopping</button>
        </div>
    </section>

    <footer id = "footer">
        <p>&copy; Copyright ${currentYear} Mike Murach &amp; Associates, Inc.All rights reserved.</p>
    </footer>
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
