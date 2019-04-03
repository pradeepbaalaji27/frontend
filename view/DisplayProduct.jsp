<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<h3>DisplayProduct</h3>
<div class="row text-center text-lg-left">
<c:forEach items="${productList}" var="displayProd">

<div class="col-lg-3 col-md-4 col-6">
<a href="<c:url value="/totalpro/${displayProd.productId}"/>">
<img class="img-fluid img-thumbnail" src="<c:url value="/resources/images/${displayProd.productId}.jpg"/>">
</a>
<br/>
<b>Price :: ${displayProd.price}/-</b>
</div>
</c:forEach>
</div>
    