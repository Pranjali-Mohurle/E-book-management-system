<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allcssjsp.jsp" %>
<style type="text/css">
a{
text-decoration:none;
color:black;

}
a:hover{
text-decoration:none;
}
</style>
</head>
<body style="background-color:#f0f1f2;">
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>

</c:if>
<%@include file="all_component/navbar.jsp" %>

			<div class="container">
		
			<h3 class="text-center">hello,${userobj.name}</h3>
			
			
			<div class="row p-5">
			<div class="col-md-4">
					<a href="sell.jsp">
					<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-book-open fa-2x"></i>
					</div>
					<h4>Sell old Book</h4>
					</div>
					</div>
					</a>
			</div>
			
			<div class="col-md-4">
					<a href="oldbook.jsp">
					<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-book-open fa-2x"></i>
					</div>
					<h4>Old Book</h4>
					</div>
					</div>
					</a>
			</div>
			<div class="col-md-4">
					<a href="editprofile.jsp">
					<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-pen-to-square fa-2x"></i>
					</div>
					<h4>Edit Profile</h4>
					</div>
					</div>
					</a>
			</div>
			
			<div class="col-md-6 mt-3">
					<a href="userorder.jsp">
					<div class="card">
					<div class="card-body text-center">
					<div class="text-danger">
					<i class="fa-solid fa-box-open fa-2x"></i>
					</div>
					<h4>My Order</h4>
					<p>Track Your Order</p>
					</div>
					</div>
					</a>
			</div>
			<div class="col-md-6 mt-3">
					<a href="helpline.jsp">
					<div class="card">
					<div class="card-body text-center">
					<div class="text-success">
					<i class="fa-solid fa-circle-user fa-2x"></i>
					</div>
					<h4>Help Center</h4>
					<p>24*7 Service</p>
					</div>
					</div>
					</a>
			</div>
			</div>
			</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>