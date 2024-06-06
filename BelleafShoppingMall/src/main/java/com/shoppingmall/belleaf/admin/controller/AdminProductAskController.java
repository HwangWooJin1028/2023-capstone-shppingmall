package com.shoppingmall.belleaf.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingmall.belleaf.paging.vo.PagingVO;
import com.shoppingmall.belleaf.product.service.ProductQnaService;
import com.shoppingmall.belleaf.product.vo.ProductQnaNickVO;


@Controller
public class AdminProductAskController {
	@Autowired
	public ProductQnaService productQnaService;	
	
	// 상품 문의 삭제
	@PostMapping("/admin/ask/delete")
	public String adminProductAskDelete(ProductQnaNickVO vo) {
		System.out.println("adminProductAskDelete");
		productQnaService.adminQnaDel(vo);
		return "redirect:/admin/product/ask";
	}
	// 상품 답변 삭제
	@PostMapping("/admin/ask/answer/delete")
	public String adminProductAnswerDelete(ProductQnaNickVO vo, @RequestParam String qna_ask_id) {
		productQnaService.adminAnsDel(vo);		
		productQnaService.adminAnsStateUpdate("0", qna_ask_id);
		return "redirect:/admin/product/ask";
	}
	// 상품 답변 수정
	@PostMapping("/admin/ask/answer/edit")
	public String adminProductAnswerEdit(ProductQnaNickVO vo) {
		System.out.println("adminProductAnswerEdit" + vo.toString());
		productQnaService.adminAnsUpdate(vo);
		return "redirect:/admin/product/ask";
	}
	
	// 상품 문의 상세 페이지 
	@GetMapping("/admin/ask/info")
	public String adminProductAskInfo(ProductQnaNickVO vo, Model model) {
		
		List<ProductQnaNickVO> qna = productQnaService.adminPrdQnaSelectSet(vo);
		
		model.addAttribute("prdAsk", qna);
		System.out.println(qna);
		
		return "admin/adminProductAsk";
	}
	
	// 상품 문의 전체 리스트 출력
	@GetMapping("/admin/product/ask") 
	public String adminProductAsk(Model model,
			@RequestParam(value="searchCondition", required=false) String searchCondition, 
			@RequestParam(value="searchKeyword", required=false) String searchKeyword,
			@RequestParam(value="product_category", required=false) String prd_category,
			@RequestParam(value="product_state", required=false) String prd_state,
			@RequestParam(value="paging", required=false) PagingVO paging,
			@RequestParam(value="nowPage", required=false, defaultValue="1") String nowPage,
			@RequestParam(value="cntPerPage", required=false, defaultValue="10") String cntPerPage) {
		System.out.println("AdminHomeController -> [/product/ask]");
		
		// 잘못 들어온 경우의 처리
		if(nowPage == null || nowPage.equals("0")) {
			nowPage = "1";
		}
		
		// 페이징 처리
		int total = productQnaService.adminPrdQnaListCnt(searchKeyword, searchCondition, prd_category, prd_state);
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStartItemNum());
		String end = Integer.toString(paging.getEndItemNum());
		
		List<Map<String,Object>> list = productQnaService.adminPrdQnaList(searchKeyword, searchCondition, prd_category, prd_state, start, end);
		System.out.println(total+ "  " +list);
		model.addAttribute("prdAskList", list);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("product_category", prd_category);
		model.addAttribute("product_state", prd_state);
		model.addAttribute("paging", paging);	
		
		return "admin/adminProductAskList";
	}
	
	// 상품 답변 작성 페이지 
	@GetMapping("/admin/product/ask/answer")
	public String adminProductAnswer(ProductQnaNickVO vo, Model model) {
		
		ProductQnaNickVO qna = productQnaService.adminPrdQnaNickSelectID(vo);
		model.addAttribute("prdAsk", qna);
		
		return "admin/adminProductAnswer";
	}
	
	// 상품 답변 작성 페이지 - 제출 	
	@PostMapping("/admin/product/ask/answer")
	public String adminProductAnswer(ProductQnaNickVO vo, HttpServletRequest request) {
		System.out.println(vo);
		
		ProductQnaNickVO prd = productQnaService.adminPrdQnaNickSelectID(vo);
		String user_id = (String)request.getSession().getAttribute("user_id");
		// String user_id = "test33";
		productQnaService.adminAnsInsert(vo.getQna_content(), Integer.toString(vo.getProduct_id()), user_id, Integer.toString(prd.getQna_group()));
		productQnaService.adminAnsStateUpdate("1", Integer.toString(vo.getQna_id()));
		return "redirect:/admin/product/ask";
	}

}
