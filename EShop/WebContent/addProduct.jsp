<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, es.uc3m.eshop.model.*"%>



<jsp:include page="header.jsp" />

	<!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li class="active">Add Product</li>
			</ul>
		</div>
	</div>
	<!-- /BREADCRUMB -->

<div style="margin:30px;">

<h3>Add Product</h3>
<%-- 
<jsp:useBean id="users" scope="request"
	class="java.util.ArrayList<es.uc3m.eshop.model.ApplicationUser>" />
 --%>


<form method = "post" action = "addProduct.html" enctype = "multipart/form-data">

	<input type="hidden" name="action" value="addProduct">

	Product Name:
	<input type = "text" name = "productName">
	<br>
	
	Product Description:
	<input type = "text" name = "productDescription">
	<br>
	
	Price:
	<input type = "text" name = "productPrice">
	<br>
	
	Stock:
	<input type = "number" name = "productStock">
	<br>
	
    Product Image:
    <input type="file" name="productImage" id="productImage">
    <br>
     
     
    <input type="submit" value="Add Product" name="submit">


</form>


</div>

<jsp:include page="footer.jsp" />
