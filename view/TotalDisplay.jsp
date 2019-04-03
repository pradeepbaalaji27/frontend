
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> 
<body>
<form action="<c:url value="/addcart/${productt.productId}"/>">	
<div class="container-fluid">
    <div class="content-wrapper">	
		<div class="item-container">	
			<div class="container">	
				<div class="col-md-12">
					<div class="product col-md-5 service-image-left">
                    <div class="col-xs-2 item-photo">
	
				
	<img  src="<c:url value="/resources/images/${productt.productId}.jpg"/>"></img>
					
					</div>
					</div>
					<br/>
		
				<div class="col-md-8">
				<h3>${product.productName}</h3>
					   
					<h4 class="tittle-desc">
					   <small>Description : ${productt.productDescription}</small>
					</h4>
					<h4 class="tittle-Price">
					  <small>Price : INR ${productt.price}/-</small>
					  </h4>
					  
					  <p>Stock : ${productt.stock} </p>
					<p data-th="Quantity" >
					<input name="quantity" type="number" class="form-control text-center" value="1"></p>
					 
					<div class="btn-group cart">
					
						<input type="submit" class="btn btn-success" value="Add To cart">
						</div>
					</div>
			
				</div>
			</div> 
		</div>
			</div>
		</div> 
	</form>
</body>

	
	
	
	