<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<body>
  <form:form action="AttachProduct" modelAttribute="productt" method="post" enctype="multipart/form-data">
  <table style="width:30%" style="height:20%" align="left" class="table table-bordered">
<tr>
  <td>ProductName</td>
  <td><form:input path="ProductName"/></td>
</tr>

<tr>
  <td>ProductDescription</td>
  <td><form:input path="productDescription"/></td>
</tr>

<tr>
  <td>CategoryId</td>
  <td><form:select path="categoryId">
    <form:option value="0" label="----List selection-----"/>
    <form:options items="${listcategory}"/>
    </form:select></td>
</tr>

<tr>
  <td>SupplierId</td>
  <td><form:select path="SupplierId">
  <form:option value="0" label="-------Id selection------"/>
  <form:options items="${listsupplier}"/>
  </form:select></td>
</tr>

<tr>
  <td>Price</td>
  <td><form:input path="Price"/></td>
</tr>

<tr>
  <td>Stock</td>
  <td><form:input path="Stock"/></td>
</tr>

<tr>
  <td>ProductImage</td>
  <td><form:input type="file" path="Pimage"/></td>
</tr>

<tr>
   <td colspan="2"><input type="submit" value="Attach"/></td>
</tr>
</table>
   </form:form>
 
 
   <table style="width:70%" style="height:70%" align="center" class="table table-bordered">
  
  
<tr bgcolor="blue">
  
   <th>ProductId</th>
   <th>ProductName</th>
   <th>CategoryId</th>
   <th>Price</th>
   <th>Stock</th>
   <th>SupplierId</th>
   <th>Operation</th>
</tr>

<c:forEach items="${productList}" var="product">
<tr>
   <td>${product.productId}</td>
   <td>${product.productName}</td>
   <td>${product.categoryId}</td>
   <td>${product.price}</td>
   <td>${product.stock}</td>
   <td>${product.supplierId}</td>
   <td> 
     <a class="btn btn-success" href="<c:url value="/editProduct/${product.productId}"/>">Edit</a>
     <a class="btn btn-danger" href="<c:url  value="/deleteProduct/${product.productId}"/>">Delete</a>
   </td> 
</tr>
   </c:forEach>

</table>

</body>
    
</html>