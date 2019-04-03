package com.ecom.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	
	@RequestMapping(value="/login")
	public String showLogin()
	{
		return "Login";
	}

	@RequestMapping(value="/register")
	public String showRegister()
	{
		return "Register";
	}
	@RequestMapping(value="/aboutus")
	public String showAboutus()
	{
		return "Aboutus";
	}
 
	@RequestMapping(value="/contactus")
	public String showContactus()
	{
		return "Contactus";
	}

	@RequestMapping(value="/product")
	public String showProduct()
	{
		return "Product";
	}
	
}


