<%@page import="java.sql.Connection" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.Book_dtls"%>
<%@page import="java.util.List" %>
<%@page import="com.DAO.BookDAOImpl" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:All Books</title>
<%@include file="allcssjsp.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp" />
	</c:if>
   <h3 class="text-center">Hello Admin</h3>
  
  	<c:if test="${not empty succmsg }">
	  <p class="text-center text-success">${succmsg}</p>
	 <c:remove var="succmsg" scope="session"/>
	 </c:if>
		                 
	<c:if test="${not empty failedmsg }">
		<p class="text-center text-danger">${failedmsg}</p>
		 <c:remove var="failedmsg" scope="session"/>
	 </c:if>
		                 
   
     <table class="table table-striped">
  <thead class="bg-danger text-white">
    <tr>
   	  <th scope="col">Id</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author Name</th>
      <th scope="col">Price</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    <%
    BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
    List<Book_dtls> list=dao.getAllBooks();
    for(Book_dtls b: list)
    {%>
    <tr>
      <td><%=b.getBookId()%></td>
      <td><img src="../book/<%=b.getPhotoname()%>" 
      style="width: 50px; height:50px;"></td>
      <td><%=b.getBookname()%></td>
      <td><%=b.getAuthor() %></td>
       <td><%=b.getPrice() %></td>
      <td><%=b.getBookcategory()%></td>
      <td><%=b.getStatus() %></td>
      <td>
      <a href="edit_books.jsp?id=<%=b.getBookId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
      <a href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
      </td>
    </tr>
    <% 
 	}
    %>
     
    	  
    	
  </tbody>
</table>
<div style="margin-top: 190px;">
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>