<%@page import="java.sql.Connection" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.Book_dtls"%>
<%@page import="java.util.List" %>
<%@page import="com.entity.User" %>
<%@page import="com.DAO.BookDAOImpl" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Old Book</title>
<%@include file="all_component/allcssjsp.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="all_component/navbar.jsp" %>
<c:if test="${not empty succmsg }">
	<div class="alert alert-success text-center">
	${succmsg }
	</div>
<c:remove var="succmsg" scope="session"/>
<c:redirect url="login.jsp"/>
</c:if>
		<div class="container p-5">
		
		<table class="table table-striped">
		  <thead class="bg-primary text-white">
		     <tr>
		      
		      <td>Book Name</td>
		      <td>Author</td>
		      <td>Price</td>
		      <td>Category</td>
		      <td>Action</td>
		    </tr>
		  </thead>
		  <tbody>
		  
		  <%
		  User u=(User)session.getAttribute("userobj");
		  String email=u.getEmail();
		  BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
		 List<Book_dtls> list=dao.getbookbyold(email,"old");
		 
		 for(Book_dtls b:list)
		 {%>
			<tr>
		      
		      <td><%=b.getBookname() %></td>
		      <td><%=b.getAuthor() %></td>
		      <td><%=b.getPrice() %></td>
		      <td><%=b.getBookcategory() %></td>
		      <td><a href="delete_oldbook?em=<%=email%>&&id=<%=b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a>
		    </tr> 
		<%}
		  %>
		   
		    
		  </tbody>
		</table>
</div>
</body>
</html>