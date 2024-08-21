<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allcssjsp.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="all_component/navbar.jsp" %>
<div class="container text-center mt-3">
	<i class="fa-solid fa-circle-check fa-4x text-success "></i>
	<h1>Thank You!</h1>
	<h2>Your Order Successfully</h2>
	<h5>With in 7 days your product will be dilvered in your address..</h5>
	<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
	<a href="userorder.jsp" class="btn btn-danger mt-3">View Order</a>
</div>

</body>
</html>