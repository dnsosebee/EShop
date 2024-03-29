<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, es.uc3m.eshop.model.*"%>

<jsp:include page="header.jsp"/>

<jsp:useBean id="messages" scope="request" type="java.util.ArrayList<es.uc3m.eshop.model.EShopMessage>"/>

	<!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li class="active"> Inbox </li>
			</ul>
		</div>
	</div>
	<!-- /BREADCRUMB -->

<div style="margin:30px;">

<h1>Your Inbox</h1>
<br>
<span style="font-style:italic">Click on a message to read its content or to respond.</span>
<br>
<% for (EShopMessage m: messages) { %>
	<% StringBuilder sb = new StringBuilder(); %>
	<% sb.append("From "); %>
	<% sb.append(m.getSenderEmail()); %>
	<% sb.append(" ("); %>
	<% if (m.getUserType() == 0) { %>
		<% sb.append("shopper"); %>
	<% } else if (m.getUserType() == 1) { %>
		<% sb.append("seller"); %>
	<% } else if (m.getUserType() == 2) { %>
		<% sb.append("administrator"); %>
	<% } %>
	<% sb.append("): "); %>
	<% sb.append(m.getTitle()); %>
	<br>
	<form action="message.html" method="POST">
	<input type="hidden" name="title" value="<%= m.getTitle() %>" />
	<input type="hidden" name="message" value="<%= m.getMessage() %>" />
	<input type="hidden" name="isReply" value=" " />
	<input type="hidden" name="email" value="<%= m.getSenderEmail() %>" />
	<input type="hidden" name="recipientEmail" value="<%= m.getSenderEmail() %>" />
	<input type="hidden" name="userType" value="<%= m.getUserType() %>" />
	<input type="submit" value="<%= sb.toString() %>">
	</form>
<% } %>
</div>
<jsp:include page="footer.jsp"/>