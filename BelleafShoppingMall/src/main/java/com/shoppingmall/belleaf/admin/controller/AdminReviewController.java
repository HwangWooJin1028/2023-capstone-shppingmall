package com.shoppingmall.belleaf.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingmall.belleaf.paging.vo.PagingVO;
import com.shoppingmall.belleaf.review.service.ReviewService;
import com.shoppingmall.belleaf.review.vo.ReviewVO;

@Controller
public class AdminReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/admin/product/review") 
	public String adminProductReview(Model model,
			@RequestParam(value="searchCondition", required=false) String searchCondition, 
			@RequestParam(value="searchKeyword", required=false) String searchKeyword,
			@RequestParam(value="product_category", required=false) String prd_category,
			@RequestParam(value="paging", required=false) PagingVO paging,
			@RequestParam(value="nowPage", required=false, defaultValue="1") String nowPage,
			@RequestParam(value="cntPerPage", required=false, defaultValue="10") String cntPerPage) {
		System.out.println("AdminHomeController -> [/product/review]");
				
		// 잘못 들어온 경우의 처리
		if(nowPage == null || nowPage.equals("0")) {
			nowPage = "1";
		}
		
		// 페이징 처리
		int total = reviewService.adminReviewListCnt(searchKeyword, searchCondition, prd_category);
		System.out.println(total);
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStartItemNum());
		String end = Integer.toString(paging.getEndItemNum());
		
		System.out.println("start, end"+start+"," + end);
		
		// mybatis를 위한 map 생성
		List<Map<String, Object>> list = reviewService.adminReviewList(searchKeyword, searchCondition, prd_category, start, end);
		System.out.println(list);
		model.addAttribute("reviewList", list);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("product_category", prd_category);
		model.addAttribute("paging", paging);
		
		return "admin/adminProductReview";
	}
	
	@GetMapping("/admin/product/review/delete")
	public String adminProductReview(ReviewVO review) {
		reviewService.ReviewDelete(review);
		return "redirect:/admin/product/review";
	}
}
