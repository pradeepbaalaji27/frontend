package com.ecom.controller;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecom.dao.CategoryDao;
import com.ecom.model.Category;
@ComponentScan("com.ecom.*")
@Transactional
@Controller

public class CategoryController {
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping(value="/category")
	public String showCategory(Model l)
	{   
		List<Category> listdata=categoryDao.listcategories();
		l.addAttribute("datalist", listdata);
		
		return "Category";
	}
	
	@RequestMapping(value="/addCategory",method=RequestMethod.POST)
	public String addCategory(@RequestParam("categoryName")String categoryName,@RequestParam("categoryDescription")String categoryDescription,Model l)
	{
		Category category = new Category();
		category.setCategoryName(categoryName);
		category.setCategorydescription(categoryDescription);
		categoryDao.add(category);
		List<Category> listcate=categoryDao.listcategories();
		l.addAttribute("datalist",listcate);
		
		return "Category";
	}
	
	@RequestMapping(value="/editCategory/{categoryId}")
	public String editCategory(@PathVariable("categoryId")int categoryId,Model l)
	{
		Category category = categoryDao.getCategory(categoryId);
		l.addAttribute("category",category);
		List<Category> listcate=categoryDao.listcategories();
		l.addAttribute("datalist", listcate);
		return "Updatecategory";
	}
	
	@RequestMapping(value="/Update",method=RequestMethod.POST)
	public String updateCategory(@RequestParam("categoryId")int categoryId,@RequestParam("categoryName")String Name,@RequestParam("categorydescription")String Description,Model l)
	{
		Category category = categoryDao.getCategory(categoryId);
		category.setCategoryName(Name);
		category.setCategorydescription(Description);
		
		categoryDao.update(category);
		
		List<Category> listcate=categoryDao.listcategories();
		l.addAttribute("datalist", listcate);

		return "Category";
	}
	
	
	@RequestMapping(value="/deleteCategory/{categoryId}")
	public String deletCategory(@PathVariable("categoryId")int categoryId,Model l)
	{
		Category category = categoryDao.getCategory(categoryId);
		categoryDao.delete(category);
		
		List<Category> listdata=categoryDao.listcategories();
		l.addAttribute("datalist", listdata);
		
		return "Category";
	}
}
	
