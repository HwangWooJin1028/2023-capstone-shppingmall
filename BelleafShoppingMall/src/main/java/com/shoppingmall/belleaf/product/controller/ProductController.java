package com.shoppingmall.belleaf.product.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingmall.belleaf.paging.vo.PagingVO;
import com.shoppingmall.belleaf.product.service.ProductQnaService;
import com.shoppingmall.belleaf.product.service.ProductService;
import com.shoppingmall.belleaf.product.vo.ProductQnaNickVO;
import com.shoppingmall.belleaf.product.vo.ProductQnaVO;
import com.shoppingmall.belleaf.product.vo.ProductVO;
import com.shoppingmall.belleaf.review.service.ReviewService;


@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductQnaService productQnaService;
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/product")
	public String SearchProductList(@RequestParam String searchKeyword, ProductVO vo, Model model) {
		List<ProductVO> listByName = productService.searchProductListByName(vo);
		model.addAttribute("prdList", listByName);
		model.addAttribute("searchKeyword", searchKeyword);
		return "store/searchProduct";
	}
	
	@GetMapping("/product/category")
	public String productGetCategoryList(Model model, @RequestParam String category_code,
			@RequestParam(value="paging", required=false) PagingVO paging,
			@RequestParam(value="nowPage", required=false, defaultValue="1") String nowPage,
			@RequestParam(value="cntPerPage", required=false, defaultValue="30") String cntPerPage) {
		System.out.println("category_code: " + category_code);
		
		// 잘못 들어온 경우의 처리
		if(nowPage == null || nowPage.equals("0")) {
			nowPage = "1";
		}
		
		// 페이징 처리
		int total = productService.getAdminProductListCnt("", "", category_code, "1");
		System.out.println(total);
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStartItemNum());
		String end = Integer.toString(paging.getEndItemNum());
		
		List<Map<String, Object>> list = productService.adminGetProductList("", "", category_code, "1", start, end);
		System.out.println(list);
		model.addAttribute("prdList", list);
		model.addAttribute("category_code", category_code);
		model.addAttribute("paging", paging);
		
		return "store/ProductCategoryList";
	}
	
	@GetMapping("/product/info")
	public String productGetInfo(Model model, ProductVO pv, ProductQnaNickVO nv,
			@RequestParam(value="paging", required=false) PagingVO paging,
			@RequestParam(value="nowPage", required=false, defaultValue="1") String nowPage,
			@RequestParam(value="cntPerPage", required=false, defaultValue="4") String cntPerPage) {
		
		// 해당하는 상품 상세정보 가져오기
		ProductVO product = productService.getProduct(pv);
		
		// 페이징 정보를 기반으로 문의 정보 가져오기
		int qna_total = productQnaService.QnaListCntByProductID(nv.getProduct_id());
		int qna_lastPage = 0;
		if(nowPage == null && cntPerPage == null) {
			cntPerPage = "4";
			qna_lastPage = (int)Math.ceil(((double)qna_total / (double)Integer.parseInt(cntPerPage)));
			nowPage = Integer.toString(qna_lastPage);
		} else if(nowPage == null) {
			cntPerPage = "4";
			qna_lastPage = (int)Math.ceil(((double)qna_total / (double)Integer.parseInt(cntPerPage)));
			nowPage = Integer.toString(qna_lastPage);
		} else if(cntPerPage == null) {
			cntPerPage = "4";
		}
		
		paging = new PagingVO(qna_total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<ProductQnaNickVO> qnaList = productQnaService.qnaListByProductID(nv.getProduct_id(), paging.getStartItemNum(), paging.getEndItemNum());
		
		// 페이징을 기반으로 리뷰정보 가져오기
		int review_lastPage=0;
		int review_total = reviewService.productReviewCntSelectR(nv.getProduct_id());
		if(nowPage == null && cntPerPage == null) {
			review_lastPage = (int)Math.ceil(((double)review_total / (double)Integer.parseInt(cntPerPage)));
			nowPage = Integer.toString(review_lastPage);
		} else if(nowPage == null) {
			review_lastPage = (int)Math.ceil(((double)review_total / (double)Integer.parseInt(cntPerPage)));
			nowPage = Integer.toString(review_lastPage);
		}
		
		PagingVO reviewPaging = new PagingVO(review_total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<Map<String, Object>> reviewList = reviewService.productReviewSelectR(nv.getProduct_id(), reviewPaging.getStartItemNum(), reviewPaging.getEndItemNum());
		
		// model에 데이터 넣기
		model.addAttribute("qnaPaging", paging);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("reviewPaging", reviewPaging);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("product", product);
		
		return "store/ProductInfo";
	}
	
	@PostMapping("/product/qna/insert")
	@ResponseBody
	public String productQnaInsert(ProductQnaVO vo, ProductVO pv, HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		vo.setUser_id(user_id);
		
		productQnaService.insertMyQna(vo);
		
		return "성공하였습니다!";
	}
}
