<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<body>
<div class="container">

<table class="table table-bordered" style="width:100%">
<tr>
  <th>Image</th>
  <th>ProductName</th>
  <th>Price</th>
  <th>Quantity</th>
  <th>TotalPrice</th>
  <th>Operation</th>
</tr>
 <c:forEach items="${labelcart}" var="cart">
 <form action="<c:url value="/updatecart/${cart.cartId}"/>" method="get">
<tr>
     <td><img src="<c:url value="/resources/images/${cart.productId}.jpg"/>" width="50" height="35"></img></td>
     <td>${cart.productName}</td> 
    <td>${cart.price}</td>
    <td><input type="text" name="quantity" value="${cart.quantity}"/></td>
    <td>${cart.quantity * cart.price}</td>
    <td>
     <input type="submit" class="btn btn-success" value="Update"/>
     <a class="btn btn-danger" href="<c:url value="/deletecart/${cart.cartId}"/>">Delete</a>
     </td>
</tr>
</form>
   </c:forEach>
 <tr bgcolor="blue">
  <td colspan="3">Grand Total</td>
  <td colspan="3">${grandtotal}/-</td>
  </tr>
 </table>
  
  <a class="btn btn-warning" href="<c:url value="/productdisplay"/>">Continue Shopping</a>
  
  <a class="btn btn-info" href="<c:url value="/checkout"/>">Check Out</a>
</div>
</body>
  </html>  