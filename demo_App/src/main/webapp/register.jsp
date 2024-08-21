<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Register</title>
<%@include file="all_component/allcssjsp.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="all_component/navbar.jsp" %>
<div class="container p-2">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Registration Page</h4>

<c:if test="${not empty succmsg }">
<p class="text-center text-success">${succmsg}</p>
<c:remove var="succmsg" scope="session"/>
</c:if>

<c:if test="${not empty failedmsg}">
<p class="text-center text-danger">${failedmsg}</p>
<c:remove var="failedmsg" scope="session"/>
</c:if>

<form action="register" method="post">

<div class="form-group">
    <label for="exampleInputName">Name*</label>
    <input type="text" class="form-control" id="exampleInputName" aria-describedby="Name" required="required" name="fname">
    
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address*</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email" >
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password*</label>
    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
  </div>
  <div class="form-group">
    <label for="exampleInputContact">Contact*</label>
    <input type="number" class="form-control" id="exampleInputContact" aria-describedby="Contact" required="required" name="phone">
    
  </div>
  <div class="form-check">
    <input type="checkbox" class="form-check-input" name="check" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms & Condition</label>
  </div>
  <div class="text-center p-2">
  <button type="submit" class="btn btn-primary btn-block btn-sm">Register</button>
  </div>
</form>
</div>
</div>
</div>
</div>
</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>