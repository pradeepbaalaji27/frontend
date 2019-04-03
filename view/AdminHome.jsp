<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-primary justify-content-center">
 
  <ul class="navbar-nav">
    
    <c:if test="${!sessionScope.loggedIn}">
    <li class="nav-item"><a class="nav-link" href="<c:url value="/login"/>">Login</a></li>
    <li class="nav-item"><a class="nav-link" href="<c:url value="/register"/>">Register</a></li>
    <li class="nav-item"><a class="nav-link" href="<c:url value="/aboutus"/>">AboutUs</a></li>
    <li class="nav-item"><a class="nav-link" href="<c:url value="/contactus"/>">ContactUs</a></li>
    </c:if>
    
    <c:if test="${sessionScope.loggedIn}">
 
       <c:if test="${sessionScope.role=='ROLE_ADMIN'}">
     <li class="nav-item"><a class="nav-link" href="<c:url value="/category"/>">Category</a></li>
     <li class="nav-item"><a class="nav-link" href="<c:url value="/productt"/>">Product</a></li>
     </c:if>
       <c:if test="${sessionScope.role=='ROLE_USER'}">
     <li class="nav-item"><a class="nav-link" href="<c:url value="/productdisplay"/>">ProductDisplay</a></li>
     <li class="nav-item"><a class="nav-link" href="<c:url value="/cart"/>">CART</a></li>
     </c:if>
</c:if>
</ul>
  <font color="blue">
  <a href="<c:url value="/performLogout"/>" class="btn btn-failure">Logout</a>
  </font>  
</nav>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>