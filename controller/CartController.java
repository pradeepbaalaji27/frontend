package com.ecom.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecom.dao.CartDao;
import com.ecom.dao.ProductDao;
import com.ecom.model.Cart;
import com.ecom.model.Product;

@Controller

public class CartController {
	@Autowired
	CartDao cartDao;
	
	@Autowired
	ProductDao productDao;

	
	@RequestMapping(value="/cart")
	public String viewcart(Model l,HttpSession session)
	{
		
		String UserName=(String)session.getAttribute("Username");
		List<Cart> listcarts=cartDao.listcartitems(UserName);
		l.addAttribute("labelcart",listcarts);
		l.addAttribute("grandtotal",this.calcGrandtotal(listcarts));
		return "Cart";
	}
	
	@RequestMapping(value="/checkout")
	public String Checkout(Model l,HttpSession session)
	{
		String UserName=(String)session.getAttribute("Username");
		List<Cart> listcarts=cartDao.listcartitems(UserName);
		
		l.addAttribute("labelcart",listcarts);
		l.addAttribute("grandtotal",this.calcGrandtotal(listcarts));
		
		return "ShoppingConfirmation";
	}
	
	@RequestMapping(value="/addcart/{productId}")
	public String AddToCart(@PathVariable("productId")int productId,@RequestParam("quantity")int Quantity,Model l,HttpSession session)
  {
	Cart cart=new Cart();
	String user=(String)session.getAttribute("Username");
	
	Product product=productDao.getProduct(productId);
	cart.setProductId(productId);
	cart.setProductName(product.getProductName());
	cart.setQuantity(Quantity);
	cart.setStatus("N");
	cart.setPrice(product.getPrice());
	cart.setUserName(user);
	
	cartDao.addToCart(cart);
	List<Cart> listcarts=cartDao.listcartitems(user);
	l.addAttribute("labelcart",listcarts);
	l.addAttribute("grandtotal",this.calcGrandtotal(listcarts));
	return "Cart";
	
  }
	public int calcGrandtotal(List<Cart> listcartitems)
	{
		int grandtotal=0;
		int count=0;
		while(count<listcartitems.size())
		{
		Cart cart=listcartitems.get(count);
		grandtotal=grandtotal+(cart.getQuantity()*cart.getPrice());
		count++;
		}
	  return grandtotal;
	}
@RequestMapping(value="/updatecart/{cartId}")
public String updatecart(@PathVariable("cartId")int CartId,Model l,HttpSession session,@RequestParam("quantity")int Quantity)
{
	String Username=(String)session.getAttribute("Username");
	Cart cart=cartDao.getCartitem(CartId);
	cart.setQuantity(Quantity);
	cartDao.updateCart(cart);
	
	List<Cart> listcarts=cartDao.listcartitems(Username);
	l.addAttribute("labelcart",listcarts);
	l.addAttribute("grandtotal",this.calcGrandtotal(listcarts));
	
	return "Cart";
	
}

@RequestMapping(value="/deletecart/{cartId}")
public String deletecart(@PathVariable("cartId")int CartId,Model l,HttpSession session)
{
	String Username=(String)session.getAttribute("Username");
	Cart cart=cartDao.getCartitem(CartId);
	cartDao.deleteFromCart(cart);
	
	List<Cart> listcarts=cartDao.listcartitems(Username);
	l.addAttribute("labelcart",listcarts);
	l.addAttribute("grandtotal",this.calcGrandtotal(listcarts));
	
	return "Cart";
	
}
}


