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
import com.shoppingmall.belleaf.product.service.ProductQnaService;
import com.shoppingmall.belleaf.product.vo.ProductQnaNickVO;


@Controller
public class MyProductQnaController {
	@Autowired
	private ProductQnaService productQnaService;
	
	public MyProductQnaController() {
		// TODO Auto-generated constructor stub
	}
	
	// 문의 전체 페이지
	@RequestMapping("/myinfo/prdqna/list")
	public String mypagePrdQnaView(HttpSession session, Model model,
			@RequestParam(value="paging", required=false) PagingVO paging,
			@RequestParam(value="nowPage", required=false, defaultValue="1") String nowPage,
			@RequestParam(value="cntPerPage", required=false, defaultValue="10") String cntPerPage) {
		
		String user_id = (String)session.getAttribute("user_id");
		
		// 잘못 들어온 경우의 처리
		if(nowPage == null || nowPage.equals("0")) {
			nowPage = "1";
		}
		
		
		// 페이징 처리
		int total = productQnaService.myPrdQnaListCnt(user_id);
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStartItemNum());
		String end = Integer.toString(paging.getEndItemNum());
		
		List<Map<String,Object>> list = productQnaService.myPrdQnaList(user_id, start, end);
		model.addAttribute("paging", paging);
		model.addAttribute("myPrdQnaList", list);
		
		return "user/myinfoPrdQnaList";
	}
	
	
	// 상품 문의 상세 페이지 
	@GetMapping("/myinfo/prdqna/info")
	public String mypagePrdQnaInfo(ProductQnaNickVO vo, Model model) {
		
		List<ProductQnaNickVO> qna = productQnaService.adminPrdQnaSelectSet(vo);
		
		model.addAttribute("prdAsk", qna);
		System.out.println(qna);
		
		return "user/myinfoPrdQnaInfo";
	}

	// 상품 문의 삭제
	@PostMapping("/myinfo/prdqna/info/delete")
	public String mypagePrdQnaDelete(ProductQnaNickVO vo) {
		productQnaService.adminQnaDel(vo);
		return "redirect:/myinfo/prdqna/list";
	}
	
	// 상품 무늬 수정
	@PostMapping("/myinfo/prdqna/info/edit")
	public String mypagePrdQnaEdit(ProductQnaNickVO vo) {
		System.out.println("adminProductAnswerEdit" + vo.toString());
		productQnaService.adminAnsUpdate(vo);
		return "redirect:/myinfo/prdqna/list";
	}
}
