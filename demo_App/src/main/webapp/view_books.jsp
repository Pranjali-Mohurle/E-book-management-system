<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.Book_dtls"%>
<%@page import="com.DAO.BookDAOImpl" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allcssjsp.jsp" %>
</head>
<body style="background-color:#f0f1f2">
<%@include file="all_component/navbar.jsp" %>

<%

int bid=Integer.parseInt(request.getParameter("bid"));
BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
Book_dtls b=dao.getBookById(bid);

%>
	<div class="container p-3">
		<div class="row p-5">
		 <div class="col-md-6 text-center p-5 border bg-white">
		 <img src="book/<%=b.getPhotoname() %>" style="height: 200px; width:150px"><br>
		 <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookname() %></span></h4>
		 <h4>author Name:<span class="text-success"><%=b.getAuthor() %></span></h4>
		 <h4>Category:<span class="text-success"><%=b.getBookcategory() %></span></h4>
		 </div>
		 <div class="col-md-6 text-center p-5 border bg-white">
		 <h2><%=b.getBookname() %></h2>
		 
		 <%
		 if("old".equals(b.getBookcategory()))
		 {%>
		 <h5 class="text-primary">Contact to Seller</h5>
			<h5 class="text-primary"><i class="fa-solid fa-envelope"></i>Email:<%=b.getUseremail() %></h5> 
		 <%}
		  %>
		 
		<div class="row">
		<div class="col-md-4 text-danger text-center p-2">
		 <i class="fa-solid fa-sack-dollar fa-2x"></i>
		 <p>Payment Method</p>
		 </div>
		 
		  <div class="col-md-4 text-danger text-center p-2">
		  <i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
		  <p>Return Available</p>
		  </div>
		  
		   <div class="col-md-4 text-danger text-center p-2">
		   <i class="fa-solid fa-truck fa-2x"></i>
		   <p>Free Shipping</p>
		   </div>
		  
		 </div>
		 
		 <%
		 if("old".equals(b.getBookcategory()))
		 {%>
			<div class="text-center p-">
		 <a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-shopping"></i>Continue Shopping</a>
		 <a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
		 </div> 
		 <%}
		 else
		 {%>
			<div class="text-center p-">
		 <a href="" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
		 <a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
		 </div>
		 
		 <%}
		 %>
		 
		 
		 </div> 
		</div>
	
	</div>
</body>
</html>