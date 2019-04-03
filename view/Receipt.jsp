<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 
  <div class="container">
  <h3 align="center">Receipt Page</h3>
<table class="table table-bordered" style="width:100%">
<tr> 
   <th>Order Id</th>
   <td>${paymentDetail.orderId}
   <th>Order Date</th>
   <td>${paymentDetail.orderDate}
</tr>
<tr> 
   <th>Customer</th>
   <td>${userdetail.userName}
   <th>Payment Mode</th>
   <td>${paymentDetail.paymentmode}
</tr>
<tr>
  <th>Address</th>
  <td colspan="3">${userdetail.address}</td>
</tr>
</table>

<table class="table table-bordered" style="width:100%">

<tr bgcolor="pink">
  <th>Image</th>
  <th>ProductName</th>
  <th>Price</th>
  <th>Quantity</th>
  <th>TotalPrice</th>
</tr>
  <c:forEach items="${labelcart}" var="cart">
  <tr>
    <td><img src="<c:url value="/resources/images/${cart.productId}.jpg"/>" width="50" height="35"></img></td>
    <td>${cart.productName}</td> 
    <td>${cart.price}</td>
    <td><input type="text" name="quantity" value="${cart.quantity}"/></td>
    <td>${cart.quantity * cart.price}</td>
  </tr>
  </c:forEach>
  </table>
  <br/>
  <br/>
  <table align="center" width="25%" height="10%">
 <tr bgcolor="yellow">
   <td>Total Amount to Pay:::</td>
   <td>INR.${paymentDetail.totalAmount}/-</td>
 </tr>
 </table>
  
 </div>
    