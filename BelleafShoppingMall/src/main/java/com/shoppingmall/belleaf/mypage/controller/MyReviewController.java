package com.shoppingmall.belleaf.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingmall.belleaf.paging.vo.PagingVO;
import com.shoppingmall.belleaf.review.service.ReviewService;
import com.shoppingmall.belleaf.review.vo.ReviewVO;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;

@Controller
public class MyReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	public MyReviewController() {
		// TODO Auto-generated constructor stub
	}
	
	@GetMapping("/myinfo/review/insert")
	public String reviewWriteView(MyInfoVO myinfo, Model model) {
		Map<String, Object> myOrder = reviewService.getMyOrderByori(myinfo);
		model.addAttribute("myOrder",myOrder);
		
		return "user/reviewWriteView";
	}
	
	@PostMapping("/myinfo/review/insert")
	public String insertReview(ReviewVO review) {
		reviewService.insertReview(review);
		return "redirect:/myinfo";
	}
	
	// 마이 페이지 - 후기 내역
	@GetMapping("/myinfo/review")
	public String getMyinfoReview(HttpSession session, Model model,
			@RequestParam(value="paging", required=false) PagingVO paging,
			@RequestParam(value="nowPage", required=false, defaultValue="1") String nowPage,
			@RequestParam(value="cntPerPage", required=false, defaultValue="10") String cntPerPage) {
		
		// 잘못 들어온 경우의 처리
		if(nowPage == null || nowPage.equals("0")) {
			nowPage = "1";
		}
		
		// user_id 가져오기
		String user_id = (String)session.getAttribute("user_id");
		
		// 페이징 처리
		int total = reviewService.getMyReviewListCnt(user_id);
		// 페이징 처리
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStartItemNum());
		String end = Integer.toString(paging.getEndItemNum());
		
		List<Map<String,Object>> list = reviewService.getMyReviewList(user_id, start, end);
		
		model.addAttribute("paging", paging);
		model.addAttribute("myReviewList", list);

		return "user/myinfoReview";
	}
	
	// 마이페이지 - 후기 수정
	@GetMapping("/myinfo/review/edit")
	public String editMyReview(int review_id, Model model) {
		Map<String, Object> review = reviewService.getReviewByReviewID(review_id);
		model.addAttribute("myReview", review);
		return "user/myinfoEditReview";
	}
	
	@PostMapping("/myinfo/review/edit")
	public String editMyReview(ReviewVO review) {
		System.out.println("editMyReview -> " + review);
		reviewService.updateReview(review);
		return "redirect:/myinfo/review";
	}
	
	// 마이페이지 - 후기 삭제
	@RequestMapping("/myinfo/review/delete")
	public String deleteReview(ReviewVO review) {
		reviewService.ReviewDelete(review);
		return "redirect:/myinfo/review";
	}
	
}
