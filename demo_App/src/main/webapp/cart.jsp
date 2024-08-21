<%@page import="com.DAO.cartDAOImp" %>
<%@page import="java.sql.Connection" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.User" %>
<%@page import="java.util.List" %>
<%@page import="com.entity.cart" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="all_component/allcssjsp.jsp" %>
</head>

<body style="background-color:#f0f1f2;">
<%@include file="all_component/navbar.jsp" %>

<c:if test="${ empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<c:if test="${empty succmsg }">
<div class="alert alert-success" role="alert">${succmsg }</div>
  <c:remove var="succmsg" scope="session"/>
</c:if>

<c:if test="${not empty failedmsg }">
<div class="alert alert-danger text-center" role="alert">${failedmsg }</div>
   <c:remove var="failedmsg" scope="session"/>
</c:if>

<div class="container">
<div class="row p-3">
<div class="col-md-6">

<div class="card" bg-white>
<div class="card-body">
<h3 class="text-center text-success">Your Selected Item</h3>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  User u=(User)session.getAttribute("userobj");
  cartDAOImp dao=new cartDAOImp(DBConnect.getConn());
  List<cart> cart=dao.getBookbyuser(u.getId());
  Double totalprice=0.00;
  for(cart c:cart)
  {
  totalprice=c.getTotalprice();
  %>
	  <tr>
      <th scope="row"><%=c.getBookName() %></th>
      <td><%=c.getAuthor() %></td>
      <td><%=c.getPrice() %></td>
      <td><a href="remove_book?bid=<%=c.getBid() %>&&uid=<%=c.getUserid() %>&&cid=<%=c.getCid() %>" class="btn btn-sm btn-danger">Remove</a></td>
    </tr>
 <%}
  %>
   <tr>
   <td>Total Price</td>
   <td></td>
   <td></td>
   <td><%=totalprice%></td>
   </tr> 
    
  </tbody>
</table>
</div>
</div>
</div>

<div class="col-md-6">
<div class="card">
<div class="card-body">
<h3>Your Order Details</h3>
<form action="order" method="post">
<input type="hidden" value="${userobj.id }" name="id">
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Name</label>
      <input type="text" name="name" class="form-control" id="inputEmail4" value="${userobj.name}" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input type="Email" name="email" class="form-control" id="inputPassword4" value="${ userobj.email}" required>
    </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
      <label for="inputEmail4">Phone Number</label>
      <input type="number" name="phone" class="form-control" id="inputEmail4" value="${ userobj.phone}" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Address</label>
      <input type="text" name="address" class="form-control" id="inputPassword4" required>
    </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
      <label for="inputEmail4">Landmark</label>
      <input type="text" name="landmark" class="form-control" id="inputEmail4" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">City</label>
      <input type="text" name="city" class="form-control" id="inputPassword4" required>
    </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
      <label for="inputEmail4">State</label>
      <input type="text" name="state" class="form-control" id="inputEmail4" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Pin Code</label>
      <input type="number" name="pincode" class="form-control" id="inputPassword4" required>
    </div>
  </div>
  
  <div class="form-group">
  <label>Payment Mode</label>
  <select class="form-control" name="payment">
  <option value="noselect">--select--</option>
  <option value="COD">Cash On Delivery</option>
  </select>
  </div>
  
  <div class="text-center">
  <button class="btn btn-warning">Order Now</button>
  <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
  </div>
  
</form>
</div>
</div>
</div>


</div>
</div>
</body>
</html>