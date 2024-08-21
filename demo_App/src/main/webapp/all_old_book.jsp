<%@page import="com.DB.DBConnect" %>
<%@page import="com.DAO.BookDAOImpl" %>
<%@page import="com.entity.Book_dtls"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Old Book</title>
<%@include file="all_component/allcssjsp.jsp" %>
<style type="text/css">
.crd-ho:haver{
background-color: #fcf7f7;
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>

<div class="container-fulid">
 <div class="row p-3">
    	
    	<%
    BookDAOImpl dao3=new BookDAOImpl(DBConnect.getConn());
    List<Book_dtls> list3=dao3.getAlloldBook();
    
    for(Book_dtls b:list3)
    {%>
    <div class="col-md-3">
    	
    		<div class="card crd-ho mt-2">
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
</div>
</body>
</html>