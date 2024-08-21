<%@page import="com.DB.DBConnect" %>
<%@page import="com.DAO.BookDAOImpl" %>
<%@page import="com.entity.Book_dtls"%>
<%@page import="java.util.List" %>
<%@page import="com.entity.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>
<%@include file="all_component/allcssjsp.jsp" %>
<style type="text/css">
.crd-ho:haver{
background-color: #fcf7f7;
}
</style>
</head>
<body>
<%
User u=(User)session.getAttribute("userobj");
%>
<%@include file="all_component/navbar.jsp" %>
		<div class="container-fulid">
			<div class="row p-3">
				
				 <%
					    BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
					    List<Book_dtls> list2=dao2.getAllrecentBook() ;
					    
					    for(Book_dtls b:list2)
					    {%>
					    <div class="col-md-3">
					    	
					    		<div class="card crd-ho mt-2">
					    			<div class="card-body text-center">
					   					 <img alt="" src="book/<%=b.getPhotoname() %>" style="width: 100px; height:150px" class="img-thumblin">
					    					<p><%=b.getBookname() %></p>
					    					<p><%=b.getAuthor() %></p>
					    					<p>
					    					
					    					<%
					    					if(b.getBookcategory().equals("old"))
					    					{%>
					    						Categories:<%=b.getBookcategory() %></p>
					    					<div class="row ">
					    					<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-4">View Details</a>
					    					<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %></a>
					    					</div>
					    					<%}
					    					else
					    					{%>
					    						Categories:<%=b.getBookcategory() %></p>
					    					<div class="row ">
					    					<%
					    					if(u==null)
					    						{%>
					    							<a href="login.jsp" class="btn btn-danger btn-sm ml-1" > <i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
					    						<%}
					    					else
					    					{%>
					    						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-1" > <i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
					    					<%}
					    						%>
					    					
					    					<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
					    					<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %></a>
					    					</div>
					    					<%}
					    					%>
					    				</div>
					    		</div>
					    </div>
					    <% 
					    }
					  	%>
   
				</div>
		</div>
</body>
</html>