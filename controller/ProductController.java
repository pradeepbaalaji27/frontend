package com.ecom.controller;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ecom.dao.CategoryDao;
import com.ecom.dao.ProductDao;
import com.ecom.dao.SupplierDao;
import com.ecom.model.Category;
import com.ecom.model.Product;
import com.ecom.model.Supplier;

@Controller

public class ProductController {
	@Autowired
	ProductDao productDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	SupplierDao supplierDao;

      @RequestMapping(value="/productt")
	public String showProductPage(Model l)
	{
	List<Product> listproducts=productDao.listproducts();
	l.addAttribute("productList",listproducts);
	
	Product product=new Product();
	l.addAttribute("productt",product);
	
	l.addAttribute("listcategory",this.getCategoryList(categoryDao.listcategories()));
	l.addAttribute("listsupplier",this.getSupplier(supplierDao.listsupplier()));
    return "Product";
	}
      @RequestMapping(value="/categorywise/{categoryId}")
      public String categorywiseProduct(@PathVariable("categoryId")int categoryId,Model l)
      {
        List<Product> listproducts=productDao.listcategorywiseProducts(categoryId);
    	l.addAttribute("productList",listproducts);
        return "UserHome";
      }
      
	@RequestMapping(value="/AttachProduct",method=RequestMethod.POST)
	public String AttachProduct(@ModelAttribute("productt")Product product,@RequestParam("Pimage")MultipartFile productImage,Model l)
	{
		System.out.println("Product Name:"+product.getProductName());
		System.out.println("Product Desc:"+product.getProductDescription());
		System.out.println("Category ID:"+product.getCategoryId());
		System.out.println("Price:"+product.getPrice());
		System.out.println("Stock:"+product.getStock());
		productDao.add(product);
     
		String path="D:\\Eclipse project workspace\\Foremost\\src\\main\\webapp\\resources\\images\\";
		
		path=path+String.valueOf(product.getProductId())+".jpg";
		
		File imageFile=new File(path);
		
		if(!productImage.isEmpty())
		{
			try
			{
				byte[] buffer=productImage.getBytes();
				FileOutputStream fos=new FileOutputStream(imageFile);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(buffer);
				bs.close();
			}
			catch(Exception e)
			{
				System.out.println("Exception occured"+e);
				l.addAttribute("Error","Exception Occured during the Image Uploading"+e);	
			}
		}
		else
		{
			System.out.println("error occured");
			l.addAttribute("Error","Error Occured when the Image Uploaded");
		}
		
            	
		Product product0=new Product();
		l.addAttribute("productt",product0);
	
		List<Product> listproducts=productDao.listproducts();
		l.addAttribute("productList",listproducts);
		l.addAttribute("listcategory",this.getCategoryList(categoryDao.listcategories()));
		return "Product";	
	}
	
	
	@RequestMapping(value="/deleteProduct/{ProductId}")
	public String deleteProduct(@PathVariable("ProductId")int ProductId,Model l)
	{
		Product product=productDao.getProduct(ProductId);
		productDao.delete(product);
		
		Product productN=new Product();
		l.addAttribute("productt",productN);
	
		List<Product> listproducts=productDao.listproducts();
		l.addAttribute("productList",listproducts);
		return "Product";
	}
	
	public LinkedHashMap<Integer,String> getCategoryList(List<Category> listCategory)
	{
		LinkedHashMap<Integer,String> listCategories=new LinkedHashMap<Integer,String>();
		for(Category cate:listCategory)
		{
			listCategories.put(cate.getCategoryId(),cate.getCategoryName());
		}
		 return listCategories;
	}
	
	public LinkedHashMap<Integer,String> getSupplier(List<Supplier> listSupplier)
	{
		LinkedHashMap<Integer,String> listsupplier=new LinkedHashMap<Integer,String>();
		for(Supplier supplier:listSupplier)
		{
			listsupplier.put(supplier.getSupplierId(),supplier.getSupplierName());
		}
		 return listsupplier;
	}
	

	@RequestMapping(value="/editProduct/{productId}")
	public String editProduct(@PathVariable("productId")int productId,Model l)
	{
		Product product1 = productDao.getProduct(productId);
		l.addAttribute("productt",product1);
		
		List<Product> listProducts=productDao.listproducts();
		l.addAttribute("productList",listProducts);
		l.addAttribute("listcategory",this.getCategoryList(categoryDao.listcategories()));
		
		return "UpdateProduct";
	}
	
	@RequestMapping(value="/UpdatePro",method=RequestMethod.POST)
	public String Updateproduct(@RequestParam("productId")int productId,@RequestParam("productDescription")String Description,@RequestParam("ProductName")String productName,@RequestParam("Stock")int stock,@RequestParam("Price")int price,Model l)
	{
		Product product = productDao.getProduct(productId);
		l.addAttribute("productt",product);
		
		product.setProductName(productName);
		product.setStock(stock);
		product.setProductDescription(Description);
		product.setPrice(price);
		productDao.update(product);
		
		List<Product> listProducts=productDao.listproducts();
		l.addAttribute("productList", listProducts);

        return "Product";
	}
		 
	@RequestMapping(value="/productdisplay")
   public String DisplayProduct(Model l)
   {
	List<Product> listProducts=productDao.listproducts();
	l.addAttribute("productList",listProducts);
	
	return "DisplayProduct";
   }
	
   @RequestMapping(value="/totalpro/{productId}")
    public String TotalDisplay(@PathVariable("productId")int productId,Model l)
	   {
		Product product=productDao.getProduct(productId);
		l.addAttribute("productt",product);
		
		return "TotalDisplay";
	   }
}


