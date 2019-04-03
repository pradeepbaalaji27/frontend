package com.ecom.controller;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecom.dao.CategoryDao;
import com.ecom.dao.ProductDao;
import com.ecom.dao.UserDetailDao;
import com.ecom.model.Category;
import com.ecom.model.Product;
import com.ecom.model.UserDetail;

@Controller

public class UserController {
	 @Autowired
	    UserDetailDao userDao;
	    @Autowired
	    CategoryDao categoryDao;
	    @Autowired
	    ProductDao productDao;

		@SuppressWarnings("unchecked")
		@RequestMapping(value="/loginSuccess")
		public String loginsuccess(HttpSession session,Model l)
		{
			String Page="";
			boolean loggedIn=false;
			SecurityContext context=SecurityContextHolder.getContext();
		    Authentication authentication=context.getAuthentication();
		    
		    String UserName=authentication.getName();
		    Collection<GrantedAuthority> roles=(Collection<GrantedAuthority>)authentication.getAuthorities();

		    List<Product> listproducts=productDao.listproducts();
			l.addAttribute("productList",listproducts);
			List<Category> listdata=categoryDao.listcategories();
			l.addAttribute("datalist", listdata);
			
		    
		    for(GrantedAuthority role:roles)
		    {
		    	session.setAttribute("role",role.getAuthority());
		    	if(role.getAuthority().equals("ROLE_ADMIN"))
		    	{
		    		loggedIn=true;
		    		Page="AdminHome";
		    		session.setAttribute("loggedIn",loggedIn);
		    		session.setAttribute("Username",UserName);
		    	}
		    	else
		    	{
		    		loggedIn=true;
		    		Page="UserHome";
		    		session.setAttribute("loggedIn",loggedIn);
		    		session.setAttribute("Username",UserName);
		        }
		    }
		           return Page;
		}
		@RequestMapping(value="/register",method=RequestMethod.POST)
		public String Registeruser(@RequestParam("username")String Name,@RequestParam("Address")String address,@RequestParam("password")String pass,@RequestParam("Mobilenumber")String mobile,@RequestParam("email")String mailid)
		{
		
			UserDetail user=new UserDetail();
			user.setUserName(Name);
			user.setPassword(pass);
			user.setMobileNumber(mobile);
			user.setEmaild(mailid);
			user.setAddress(address);
			user.setEnabled(true);
		    userDao.registeruser(user);
		    
			return "Register";
		}
	}


