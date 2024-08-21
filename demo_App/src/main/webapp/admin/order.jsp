<%@page import="java.sql.Connection" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.book_order"%>
<%@page import="java.util.List" %>
<%@page import="com.entity.User" %>
<%@page import="com.DAO.BookDAOImpl" %>
<%@page import="com.DAO.bookorderDAOImpl" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:All Orders</title>
<%@include file="allcssjsp.jsp" %>
</head>
<body>
<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp" />
	</c:if>
<%@include file="navbar.jsp" %>
   <h3 class="text-center">Hello Admin</h3>
   
     <table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Contact</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  <% 
  bookorderDAOImpl dao=new bookorderDAOImpl(DBConnect.getConn());
  List<book_order> blist=dao.getallorder();
  for(book_order b:blist)
  {%>
	  <tr>
      <th scope="row"><%=b.getOrderid() %></th>
      <td><%=b.getName() %> </td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getFullAdd() %></td>
       <td><%=b.getPhone() %></td>
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %></td>
       <td><%=b.getPrice() %></td>
      <td><%=b.getPayment() %></td>
     
    </tr>
	  
  <%}
  %>
    
    
  </tbody>
</table>
<div style="margin-top: 190px;">
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>