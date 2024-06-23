<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Product"  %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Admin"%>
<%@page import="model.Customer"%>
<%@page import="model.Invoice"%>
<%@page import="DAO.prdDAO"%>
<%@page import="DAO.invoiceDAO"%>
<%@page import="DAO.lineitemDAO"%>
<%@page import="DAO.cusDAO"%>
<%
   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="style/style.css"/>
</head>
	<%Admin ad = (Admin) session.getAttribute("admin"); %>
	<%
				if (ad == null) {
    					response.sendRedirect("LoginCus.jsp");
					}
						%>
<body>
	
	
   <header class ="Header">
        <div class="logo-name" >
          <img src="image/logo.png" onclick="window.location.href = 'LoginSuccessAD.jsp';" class="logo" ></img>
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
                    <a href="showStatistical.jsp" style="text-decoration: none; color: black;">Statistical</a><br>
                </div>
            </td>
        </tr>
    </table>
</nav>
	
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
	    .content2 {
	    	margin: 40px;
	    }
	</style>
	
		<% invoiceDAO invSta = new invoiceDAO(); %>
	 	<% if(!invSta.allInv().isEmpty()) {%>
	    <% cusDAO cusSta = new cusDAO(); %>
	    <% Customer cusVip = new Customer(); %>
	    <% prdDAO prdSta = new prdDAO(); %>
	    <% lineitemDAO litSta = new lineitemDAO(); %>
	    <% cusVip = cusSta.cus((int)invSta.Total_Highest().get(1)); %>
	    <% Product prdVip = new Product() ;%>
	    <% prdVip = prdSta.getPrd(litSta.prd_quantity().get(0)); %>
	<section id="contentSta2" style="display: flex; justify-content: center;">
	 	
	    
	    <div>
	    <table class = "class-table-vip">
		    <tr>
		        <td>Tổng doanh thu:</td>
		        <td><%= invSta.Total_Invoice() %> $</td>
		    </tr>
		    <tr>
		        <td>Khách mua nhiều nhất:</td>
		        <td><%= cusVip.getName() %></td>
		    </tr>
		    <tr>
		        <td>Sản phẩm được mua nhiều nhất:</td>
		        <td><%= prdVip.getCarName() %></td>
		    </tr>
		</table>
	 	</div>
	    
	    
	    
	</section>
	
	<section id="content3" style="display: flex; justify-content: center;">
		
	    <table class = "class-table-invoice">
	        <thead>
	            <tr>
	                <th>Invoice ID</th>
	                <th>Date</th>
	                <th>Customer ID</th>
	                <th>Total</th>
	            </tr>
	        </thead>
	        <tbody>
	            <% List<Invoice> invoices = invoiceDAO.allInv(); %>
	            
	            <% for (Invoice invoice : invoices) { %>
	            <tr>
	                <td><%= invoice.getInvoiceID() %></td>
	                <td><%= invoice.getDate() %></td>
	                <td><%= invoice.getCustomerID() %></td>
	                <td><%= String.format("%.2f", invoice.getTotal()) + " $" %></td>
	            </tr>
	            <% }} else {%>
	    			<p> Invoice is empty </p>
	    		<%} %>
	            
	        </tbody>
	    </table>
	    
	</section>
				
	<footer id = "footer">
        <p>&copy; Copyright ${currentYear} Mike Murach &amp; Associates, Inc.All rights reserved.</p>
    </footer>
    
</body>
</html>