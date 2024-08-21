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
<title>Ebook: Index</title>
<%@include file="all_component/allcssjsp.jsp" %>
<style type="text/css">
.back-img
{
background: url("img/image.jpg");
height: 40vh;
width: 100%;
background-size: cover;
background-repeat: no repeat;
}
.crd-ho:haver{
background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

<%
User u=(User)session.getAttribute("userobj");
%>

<%@include file="all_component/navbar.jsp" %>
 <div class="container-fluid back-img">
    <h2 class="text-center "><i class="fa-duotone fa-books"></i>EBook Management</h2></div>
    
    <!-- recent book -->
    
    
    <div class="container">
    <h3 class="text-center text-success">Recent Book</h3>
    <div class="row">
    <%
    BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
    List<Book_dtls> list2=dao2.getRecentBooks() ;
    
    for(Book_dtls b:list2)
    {%>
    <div class="col-md-3">
    	
    		<div class="card crd-ho">
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
    
	<div class="text-center mt-1">
	    <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
	    </div>
    </div>
    
    <hr>
    <!-- New book -->
    
    <div class="container">
    <h3 class="text-center text-success">New Book</h3>
    <div class="row">
    	
   <%
    	BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
    	List<Book_dtls> list=dao.getNewBook();
    	for(Book_dtls b:list)
    	{
    	%>
    	<div class="col-md-3">
    		<div class="card crd-ho">
    			<div class="card-body text-center">
   					 <img alt="" src="book/<%=b.getPhotoname() %>" style="width: 100px; height:150px" class="img-thumblin">
    					<p><%=b.getBookname() %></p>
    					<p><%=b.getAuthor() %></p>
    					<p>Categories: <%=b.getBookcategory() %></p>
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
    					<a href="" class="btn btn-danger btn-sm "><i class="fa-solid fa-indian-rupee-sign"><%=b.getPrice() %></i></a>
    					</div>
   				 </div>
  		  </div>
    </div>	
    	<%
    	}
    	%>
   
    	
    	</div>
    <div class="text-center mt-1">
    <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
    </div>
    	
    		
    
    <hr>
    
    <!-- old book -->
    
    <div class="container">
    <h3 class="text-center text-success">Old Book</h3>
    <div class="row">
    	
    	<%
    BookDAOImpl dao3=new BookDAOImpl(DBConnect.getConn());
    List<Book_dtls> list3=dao3.getOldBooks() ;
    
    for(Book_dtls b:list3)
    {%>
    <div class="col-md-3">
    	
    		<div class="card crd-ho">
    			<div class="card-body text-center">
   					 <img alt="" src="book/<%=b.getPhotoname() %>" style="width: 100px; height:150px" class="img-thumblin">
    					<p><%=b.getBookname() %></p>
    					<p><%=b.getAuthor() %></p>
    					<p><%=b.getBookcategory() %></p>
    					<div class="row ">
    					<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
    					<a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"><%=b.getPrice() %></i></a>
    					</div>
    					
    				</div>
    		</div>
    </div>
    <% 
    }
  	%>
   
    
    </div>
    <div class="text-center mt-1">
    <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
    </div>
    <hr>
    <%@include file="all_component/footer.jsp" %>
</body>
</html>