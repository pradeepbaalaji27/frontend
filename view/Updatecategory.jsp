<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body>
<h2 align="center">UpdateCategory</h2>

<div style="text-align:center">
<form action="<c:url value="/Update"/>" method="post">

CategoryId:<input type="text" id="categoryId" name="categoryId" value="${category.categoryId}"/>
<br/>
<br/>
CategoryName:<input type="text" id="categoryName" name="categoryName" value="${category.categoryName}"/>
  <br/>
  <br/> 
 CategoryDescription:<input type="text" id="categorydescription" name="categorydescription" value="${category.categorydescription}"/>
  <br/>
  <br/>
 <input class="btn btn-success" type="submit" value="Update"/>
   
</form>
</div>
</body>

</html>