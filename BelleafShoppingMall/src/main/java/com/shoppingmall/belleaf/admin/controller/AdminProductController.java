package com.shoppingmall.belleaf.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shoppingmall.belleaf.common.awsImageUploader;
import com.shoppingmall.belleaf.paging.vo.PagingVO;
import com.shoppingmall.belleaf.product.service.ProductService;
import com.shoppingmall.belleaf.product.vo.ProductVO;

@Controller
public class AdminProductController {
	@Autowired
	public ProductService productService;
	
	@Autowired
	private awsImageUploader imamgeUploader;
	
	// 상품 상세 페이지 이동
	@GetMapping("/admin/product/info")
	public String adminProductInfo(ProductVO product, Model model) {
		System.out.println("AdminHomeController --> [/product/info]");
		
		// 상품 상세 목록 얻어오기
		ProductVO vo = productService.getProduct(product);
		model.addAttribute("product", vo);
		
		return "admin/adminProductInfo";
	}
	
	@PostMapping("/admin/product/info")
	public String adminProductInfoEdit(ProductVO product,
			 @RequestParam(value = "pic_File", required = false) MultipartFile pic_File,
             @RequestParam(value = "info_File", required = false) MultipartFile info_File,
             @RequestParam(value = "before_pic", required = false) String before_pic,
             @RequestParam(value = "before_info", required = false) String before_info) {
		System.out.println(product);
		if(pic_File == null) {
			product.setProduct_pic("");
			System.out.println("상품 썸네일이 없는 파일입니다");
		}
		else if(!pic_File.isEmpty()) {
			imamgeUploader.deleteFile(before_pic);
			imamgeUploader.uploadImage(pic_File);
			product.setProduct_pic(pic_File.getOriginalFilename());
		}
		
		if(info_File == null) {
			product.setProduct_info("");
			System.out.println("상품 정보가 없는 파일입니다");
		}
		else if(!info_File.isEmpty()) {
			System.out.println(info_File);
			product.setProduct_info(info_File.getOriginalFilename());
			imamgeUploader.deleteFile(before_info);
			imamgeUploader.uploadImage(info_File);
		}
		productService.updateProduct(product);
		return "redirect:/admin/product/list";
	}
	
	
	// search 할때에도 이 controller로 받는다.
	@GetMapping("/admin/product/list")
	public String adminProductlist(Model model,
			@RequestParam(value="searchCondition", required=false) String searchCondition, 
			@RequestParam(value="searchKeyword", required=false) String searchKeyword,
			@RequestParam(value="product_category", required=false) String prd_category,
			@RequestParam(value="product_state", required=false) String prd_state,
			@RequestParam(value="paging", required=false) PagingVO paging,
			@RequestParam(value="nowPage", required=false, defaultValue="1") String nowPage,
			@RequestParam(value="cntPerPage", required=false, defaultValue="10") String cntPerPage) {
		System.out.println("AdminHomeController -> [/product/list]");
		
		// 잘못 들어온 경우의 처리
		if(nowPage == null || nowPage.equals("0")) {
			nowPage = "1";
		}
		
		// 페이징 처리
		int total = productService.getAdminProductListCnt(searchCondition, searchKeyword, prd_category, prd_state);
		System.out.println(total);
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStartItemNum());
		String end = Integer.toString(paging.getEndItemNum());
		
		System.out.println("start, end"+start+"," + end);
		
		// mybatis를 위한 map 생성
		List<Map<String, Object>> list = productService.adminGetProductList(searchCondition, searchKeyword, prd_category, prd_state, start, end);
		System.out.println(list);
		model.addAttribute("prdList", list);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("product_category", prd_category);
		model.addAttribute("product_state", prd_state);
		model.addAttribute("paging", paging);	

		System.out.println(System.getProperty("user.dir"));
		
		return "admin/adminProductlist";
	}
	
	@GetMapping("/admin/product/add") 
	public String adminProductAdd() {
		System.out.println("AdminHomeController -> Get[/product/add]");
		return "admin/adminProductAdd";
	}
	
	@PostMapping("/admin/product/add") 
	public String adminProductAdd(ProductVO product) {
		System.out.println("AdminProductController -> Post[/product/add]");
		
		if(product.getPicFile() == null) {
			System.out.println("상품 썸네일이 없는 파일입니다");
		}
		else if(!product.getPicFile().isEmpty()) {
			System.out.println(product.getPicFile());
			imamgeUploader.uploadImage(product.getPicFile());
			product.setProduct_pic(product.getPicFile().getOriginalFilename());
		}
		
		if(product.getInfoFile() == null) {
			System.out.println("상품 정보가 없는 파일입니다");
		}
		else if(!product.getInfoFile().isEmpty()) {
			System.out.println(product.getInfoFile());
			imamgeUploader.uploadImage(product.getInfoFile());
			product.setProduct_info(product.getInfoFile().getOriginalFilename());
			
		}
		
		// 상품 썸네일과 정보가 없어도 insert가 되도록...
		productService.insertProduct(product);
		
		return "redirect:/admin/product/list";
	}
	
}
