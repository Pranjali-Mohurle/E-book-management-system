<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
<%@include file="all_component/allcssjsp.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>
<%@include file="all_component/navbar.jsp" %>

<div class="conatiner">
 <div class="row">
  <div class="col=md-4 offset-md-4">
   <div class="card">
    <div class="card-body">
    	<h5 class="text-center text-primary p-1" >Sell Old Book</h5>
    	
    	 <c:if test="${not empty succmsg }">
		                 <p class="text-center text-success">${succmsg}</p>
		                 <c:remove var="succmsg" scope="session"/>
		                 </c:if>
		                 
		                  <c:if test="${not empty failedmsg }">
		                 <p class="text-center text-danger">${failedmsg}</p>
		                 <c:remove var="failedmsg" scope="session"/>
		                 </c:if>
		                 
      <form action="addoldbook" method="post" enctype="multipart/form-data">
		              <input type="hidden" value="${userobj.email}" name="user">
		              
		                 <div class="form-group">
		                     <label for="exampleInputEmail">Book Name*</label>
		                     <input name="bname" type="text" class="form-control" id="exampleInputEmail" aria-describedy="emailHelp">
		                 </div>
		                 <div class="form-group">
		                     <label for="exampleInputEmail">Author Name*</label>
		                     <input name="author" type="text" class="form-control" id="exampleInputEmail" aria-describedy="emailHelp">
		                 </div>
		                 <div class="form-group">
		                     <label for="exampleInputPassword">Price*</label>
		                     <input name="price" type="number" class="form-control" id="exampleInputPassword" >
		                 </div>
		                 
		                 <div class="form-group">
		                     <label for="exampleFormControlFile">Upload photo</label>
		                     <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile" >
		                 </div>
		                 <button type="submit" class="btn btn-primary">Sell</button>
		              </form>
    </div>
   </div>
  </div>
 </div>
</div>

</body>
</html>