<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Product"  %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Product"%>
<%@ page import="DAO.prdDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THM Company</title>
<link rel="stylesheet" type="text/css" href="style/style.css"/>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>
<div id="EditPrdPopup" class="signin-popup">
    <div class="sign-content">
        <div class="sign-row">
            <h1>EDIT PRODUCT</h1>
            <button class="close-button" onclick="hideEditPrdPopup()">&#10006;</button>
        </div>
        <form action="<%=request.getContextPath()%>/editPrd" method="post">
                        <table style="width: 100%">
                        
                <tr>
                	
                	<td>Car Name</td>
                    <td><input type="text" name="name" id="nameInput" placeholder="Car Name" disabled /></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description" id="descriptionInput" placeholder="Car Description" /></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="price" id="priceInput" placeholder="Car Price" /></td>
                </tr>
                <tr>
					<td>Brand</td>
					<td>
  					<select name="brand" id="brandInput" >
    						<option value="KIA">KIA</option>
    						<option value="TOYOTA">TOYOTA</option>
    						<option value="BMW">BMW</option>
  					</select>
					</td>
                </tr>
                <tr>
                    <td>Color</td>
                    <td><input type="text" name="color" id="colorInput" placeholder="Car Color" /></td>
                </tr>
                 <tr>
                    <td>Capacity</td>
                    <td><input type="text" name="capacity" id="capacityInput" placeholder="Car Capacity" /></td>
                </tr>
            </table>
            <input type="hidden" name="hiddenUsername" id="hiddenUsernameID"  >
            <input type="submit" value="Edit Product" />
        </form>
    </div>
</div>
<div id="addPrdPopup" class="signin-popup">
    <div class="sign-content">
        <div class="sign-row">
            <h1>Add Product</h1>
            <button class="close-button" onclick="hideAddPrdPopup()">&#10006;</button>
        </div>
        <form action="<%=request.getContextPath()%>/addPrd" method="post">
            <table style="width: 100%">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" id="nameInput" placeholder="Car Name" /></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description" id="descriptionInput" placeholder="Car Description" /></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="price" id="priceInput" placeholder="Car Price" /></td>
                </tr>
                <tr>
					<td>Brand</td>
					<td>
  					<select name="brand" id="brandInput" >
    						<option value="KIA">KIA</option>
    						<option value="TOYOTA">TOYOTA</option>
    						<option value="BMW">BMW</option>
  					</select>
					</td>
                </tr>
                <tr>
                    <td>Color</td>
                    <td><input type="text" name="color" id="colorInput" placeholder="Car Color" /></td>
                </tr>
            </table>
            <input type="submit" value="Add Product" />
        </form>
    </div>
</div>
   <header class ="Header">
        <div class="logo-name" >
          <img src="image/logo.png" onclick="window.location.href = 'LoginSuccessAD.jsp';" class="logo"></img>
          <span class="Name-Company">THM</span>  
          <span class="Name-Company1">Company</span>
        </div>
        <nav class="Navigation">
            <a href="#" class="Navigation-item" onclick="event.preventDefault(); showAddPrdPopup();">ADD PRODUCT</a>
        </nav>
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
   <tr>
            <td class="shop-item">
                <div class="shop-container">
                    <img src="image/shop.png" class="logoHome">
                    <a href="#" onclick="toggleProductForm()" class="Navigation-item">Product</a>

                    <div id="productForm" class="product-form" style="display: none;">
                       <form action="<%=request.getContextPath()%>/getPrdFilter" method="post">
                        <!-- Form lọc sản phẩm -->
                        <div class="Menu">
                        <input type="hidden" name="check" value ="pay"/>
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
                            <td><%= String.format("%.2f", product.getPrice()) + " VND" %></td>
                            <td>
                                <%-- Kiểm tra xem có liên kết hình ảnh không và hiển thị nếu có --%>
                                <% if (product.getCarDescription() != null) { %>
                                    <img src="<%= product.getCarDescription() %>" alt="Product Image" style="max-width: 150px; max-height: 200px;">
                                <% } %>
                            </td>
                            <td>
                 
                                    <button onclick="event.preventDefault(); getdataa(this);" name="newData" value="<%= product.getCarName() %>">Delete</button>
                                <form id="delPrdForm" action="<%=request.getContextPath()%>/delPrd" method="post">
                                
    							<input type="hidden" id="carnameInput" name="carname" value="">
								</form>
								  <button  style="margin-top: 10px;" onclick="event.preventDefault(); showEditPrdPop();displayProductData(this) "  value="<%= product.getCarName() %>">Update</button>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </section>
    </section>
    <footer id="footer">
        <p>&copy; Copyright ${currentYear} Mike Murach &amp; Associates, Inc.
            All rights reserved.</p>
    </footer>
    <script>
    	function displayProductData(button) {
        var row = button.closest("tr"); // Tìm phần tử cha gần nhất có thẻ <tr> chứa nút được nhấp
        var name = row.querySelector("td:nth-child(1)").innerText; // Lấy nội dung của cột thứ nhất (Tên sản phẩm)
        var description = row.querySelector("td:nth-child(6)").innerText; // Lấy nội dung của cột thứ hai (Mô tả sản phẩm)
        var capacity = row.querySelector("td:nth-child(4)").innerText; // Lấy nội dung của cột thứ hai (Mô tả sản phẩm)
        var price = row.querySelector("td:nth-child(5)").innerText; // Lấy nội dung của cột thứ ba (Giá sản phẩm)
        var brand = row.querySelector("td:nth-child(2)").innerText; // Lấy nội dung của cột thứ tư (Thương hiệu)
        var color = row.querySelector("td:nth-child(3)").innerText; // Lấy nội dung của cột thứ năm (Màu sắc)

        document.getElementById("nameInput").placeholder = name; // Thay đổi giá trị của placeholder của trường tên sản phẩm
        document.getElementById("descriptionInput").placeholder = description; // Thay đổi giá trị của placeholder của trường mô tả sản phẩm
        document.getElementById("priceInput").placeholder = price; // Thay đổi giá trị của placeholder của trường giá sản phẩm
        document.getElementById("brandInput").value = brand; // Chọn giá trị trong trường thương hiệu
        document.getElementById("colorInput").placeholder = color; // Thay đổi giá trị của placeholder của trường màu sắc
        document.getElementById("capacityInput").placeholder = capacity; // Thay đổi giá trị của placeholder của trường mô tả sản phẩm
        document.getElementById("hiddenUsernameID").value = name;
    	}
        function getdataa(button) {
            var carName = button.value; // Lấy giá trị từ thuộc tính value của nút
            // Gán giá trị vào trường carname trong biểu mẫu
            document.getElementById("carnameInput").value = carName;
            // Gửi biểu mẫu
            document.getElementById("delPrdForm").submit();
        }
        function showAddPrdPopup() {
            var popup = document.getElementById("addPrdPopup");
            popup.style.display = "block";
        }

        function hideAddPrdPopup() {
            var popup = document.getElementById("addPrdPopup");
            popup.style.display = "none";
        }
        function showEditPrdPop() {
            var popup = document.getElementById("EditPrdPopup");
            popup.style.display = "block";
        }

        function hideEditPrdPopup() {
            var popup = document.getElementById("EditPrdPopup");
            popup.style.display = "none";
        }
    </script>
</body>
</html>