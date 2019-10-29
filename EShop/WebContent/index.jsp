<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, es.uc3m.eshop.model.*"%>

<% final int ROW_MAX_ITEMS = 4; %>

<jsp:include page="header.jsp"/>

<jsp:include page="navigation.jsp"/>

<jsp:useBean id="products" scope="request" class="java.util.ArrayList<es.uc3m.eshop.model.Product>"/>

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">Picked For You</h2>
					</div>
				</div>
				<!-- section title -->
				<% for(int i = 0; i < Math.min(ROW_MAX_ITEMS, products.size()); ++i){ %>
					<jsp:include page="product.jsp">
				        <jsp:param name="price" value="<%= products.get(i).getPrice() %>" />
				        <jsp:param name="name" value="<%= products.get(i).getName() %>"/>
				    </jsp:include>
				<% } %>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->




<jsp:include page="footer.jsp"/>


