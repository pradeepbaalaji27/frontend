<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body>
<h2 align="center">UpdateProduct</h2>

<div style="text-align:center">
<form action="<c:url value="/UpdatePro"/>" method="post">

ProductId:<input type="text" id="productId" name="productId" value="${productt.productId}"/>
<br/>
<br/>
ProductName:<input type="text" id="ProductName" name="ProductName" value="${productt.productName}"/>
<br/>
<br/>
Price:<input type="text" id="Price" name="Price" value="${productt.price}"/>
  <br/>
  <br/> 
ProductDescription:<input type="text" id="productDescription" name="productDescription" value="${productt.productDescription}"/>
  <br/>
  <br/>
  Stock:<input type="text" id="Stock" name="Stock" value="${productt.stock}"/>
  <br/>
  <br/>
 <input class="btn btn-success" type="submit" value="Update"/>
   
</form>
</div>
</body>
</html>