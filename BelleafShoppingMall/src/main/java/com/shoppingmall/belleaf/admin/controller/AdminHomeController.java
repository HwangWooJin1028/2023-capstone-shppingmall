package com.shoppingmall.belleaf.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoppingmall.belleaf.product.service.ProductService;
import com.shoppingmall.belleaf.user.service.AdminUserService;

// 2024-04-07 관리자 홈페이지 controller
@Controller
public class AdminHomeController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AdminUserService adminUserService;
	
	@RequestMapping("/admin")
	public String admin(Model model) {
		System.out.println("AdminHomeController -> [/admin]");
		
		
		List<Map<String, Object>> prdlist = productService.ResentGetProductList("1", "4");
		int total = adminUserService.ResentUserListCnt();
		List<Map<String, Object>> userlist = adminUserService.ResentUserList("1", "4");
		
		model.addAttribute("prdlist", prdlist);
		model.addAttribute("userlist", userlist);
		
		return "admin/adminHome";
	}
	
	
	@GetMapping("/admin/user") 
	public String adminUser() {
		System.out.println("AdminHomeController -> [/admin/user]");
		return "admin/adminUser";
	}
	
}
