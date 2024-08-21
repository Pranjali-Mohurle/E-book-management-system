<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="all_component/allcssjsp.jsp"%>
</head>
<body style="background-color:#f0f1f2;">

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>
<%@include file="all_component/navbar.jsp" %>

<div class="container">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					
					<h4 class="text-center text-primary p-2">Edit Profile</h4>
					<c:if test="${not empty failedmsg }">
							<h5 class="text-center text-danger">${failedmsg }</h5>
							<c:remove var="failedmsg" scope="session"/>
							</c:if>
							
							<c:if test="${not empty succmsg }">
							<h5 class="text-center text-success">${succmsg }</h5>
							<c:remove var="succmsg" scope="session"/>
							</c:if>
						<form action="updateprofile" method="post">
						<input type="hidden" value="${userobj.id }" name="id">
						<div class="form-group">
						    <label for="exampleInputName">Enter Name*</label>
						    <input type="text" class="form-control" id="exampleInputName" aria-describedby="Name" required="required" name="fname" value="${userobj.name}">
						    
						  </div>
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address*</label>
						    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email" value="${userobj.email }" >
						    
						  </div>
						  <div class="form-group">
						    <label for="exampleInputContact">Contact*</label>
						    <input type="number" class="form-control" id="exampleInputContact" aria-describedby="Contact" required="required" name="phone" value="${userobj.phone }">
						    
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password*</label>
						    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password" ">
						  </div>
						  
			
						  <div class="text-center p-2">
							<div class="text-center p-2">
							  <button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>
							  </div>  
						</form>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>