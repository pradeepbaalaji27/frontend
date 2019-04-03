<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<div class="container">
<h4 align="center">Payment Process</h4>
<table class="table table-bordered" style="width:100%">

<tr>
  <th>Image</th>
  <th>ProductName</th>
  <th>Quantity</th>
  <th>Price</th>
  <th>TotalPrice</th>
</tr>

  <c:forEach items="${labelcart}" var="cart">
  <tr>
     <td><img src="<c:url value="/resources/images/${cart.productId}.jpg"/>" width="50" height="35"></img></td>
     <td>${cart.productName}</td>
     <td>${cart.quantity}</td>
     <td>${cart.price}</td>
     <td>${cart.quantity * cart.price}/-</td>
  </tr>
  </c:forEach>
  <tr bgcolor="pink">
    <td colspan="4">Grand Total of Products</td>
    <td colspan="2">${grandtotal}/-</td>
</tr>
</table>

</div>
<table align="center">
<tr bgcolor="white">
<td><a class="btn btn-info" href="<c:url value="/cart"/>">EditCart</a></td>
</tr>
</table>
<br/>
<br/>
<br/>
<form action="<c:url value="/pay"/>" method="post"> 
<table class="table-bordered" align="center">
<tr bgcolor="pink">
<td>PaymentDetail</td>
<td>
  <input type="radio" name="PaymentMode" value="COD"/>Cash On Delivery
  <input type="radio" name="PaymentMode" value="CC"/>CreditCard
  </td>
</tr>

<tr bgcolor="pink">
<td>CreditCard</td>
<td><input type="text" name="creditcard"/></td>
</tr>

<tr bgcolor="pink">
<td>CVV<input type="text" name="cvv"/></td>
<td>ValidUpto<input type="text" name="valid"/></td>
</tr>
<tr>
<td><input type="submit" class="btn btn-info" value="PlaceOrder"></td>
</tr> 
</table>
</form>
    