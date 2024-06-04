package com.shoppingmall.belleaf.product.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingmall.belleaf.banner.service.BannerService;
import com.shoppingmall.belleaf.banner.vo.BannerVO;
import com.shoppingmall.belleaf.product.service.ProductService;
import com.shoppingmall.belleaf.product.vo.ProductVO;


@Controller
public class MainController {
	@Autowired
	private ProductService productService;
	@Autowired
	private BannerService bannerService;
	
	public MainController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		System.out.println("LLLLL");
		Map<String,List<ProductVO>> categoryList = new HashMap<String,List<ProductVO>>();
		List<ProductVO> list;
		for(int i=1; i<=5; i++) {
			list = productService.getProductListByCategory(i);
			categoryList.put("categorylist_"+i, list);
			System.out.println(categoryList);
			model.addAttribute(Integer.toString(i), i);
		}
		List<Map<String, Object>> prdlist = productService.ResentGetProductList("1", "20");
		List<Map<String, Object>> prdlistByDiscount = productService.getproductListByDiscount("1", "20");

		List<BannerVO> bannerList = bannerService.SelectAllBannerList();
		model.addAttribute("categoryLists", categoryList);
		model.addAttribute("bannerList", bannerList);
		model.addAttribute("prdlist", prdlist);
		model.addAttribute("prdlistByDiscount", prdlistByDiscount);
		return "common/homepage";
	}
	
}
