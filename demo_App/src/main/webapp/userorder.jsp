<%@page import="java.sql.Connection" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.book_order"%>
<%@page import="java.util.List" %>
<%@page import="com.entity.User" %>
<%@page import="com.DAO.BookDAOImpl" %>
<%@page import="com.DAO.bookorderDAOImpl" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Order</title>
<%@include file="all_component/allcssjsp.jsp"%>
</head>
<body style="background-color:#f0f1f2;">

<%@include file="all_component/navbar.jsp" %>

	<div class="container">
	<h3 class="text-center text-danger p-2">Your Order</h3>
			<table class="table table-striped mt-4">
				  <thead class="bg-primary text-white">
				    <tr>
				      <th scope="col">Order Id</th>
				      <th scope="col">Name</th>
				      <th scope="col">Book Name</th>
				      <th scope="col">Author</th>
				      <th scope="col">Price</th>
				      <th scope="col">Payment Type</th>
				    </tr>
				  </thead>
				  <tbody>
				  <%
				  User u=(User)session.getAttribute("userobj");
				  bookorderDAOImpl dao=new bookorderDAOImpl(DBConnect.getConn());
				  List<book_order> blist=dao.getbook(u.getEmail());
				  for(book_order b:blist)
				  {%>
					  <tr>
				      <th scope="row"><%=b.getOrderid() %></th>
				      <td><%=b.getName() %></td>
				      <td><%=b.getBookname() %></td>
				      <td><%=b.getAuthor() %></td>
				       <td><%=b.getPrice() %></td>
				      <td><%=b.getPayment() %></td>
				    </tr> 
				  <%}
				   %>
				   
				  </tbody>
				</table>
	</div>
</body>
</html>