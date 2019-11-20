<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, es.uc3m.eshop.model.*"%>



<jsp:include page="header.jsp" />
<div style="margin:30px;">
<h2>Admin Panel</h2>
<%-- 
<jsp:useBean id="users" scope="request"
	class="java.util.ArrayList<es.uc3m.eshop.model.ApplicationUser>" />
 --%>

<%
	ApplicationUser au = (ApplicationUser) session.getAttribute("user");
%>


<img src="img/profileImage.png" width="100" height="100">
<h3><%=au.getName()%> <%= au.getSurname() %></h3>


<h4>Your Information:</h4>

<table>
	<tr>
		<th>Email</th>
		<th>Address</th>
		<th>Name</th>
		<th>Surname</th>
	</tr>
	<tr>
		<td><%=au.getEmail()%></td>
		<td><%=au.getAddress()%></td>
		<td><%=au.getName()%></td>
		<td><%=au.getSurname()%></td>
</table>

<br>
<h3>Admin Abilities</h3>
<a href="adminEditUsers.html" style="padding:20px;">View and edit all users</a>
<a href = "adminEditProducts.html" style="padding:20px;">View and edit all products</a>
</div>
<jsp:include page="footer.jsp" />
