package com.shoppingmall.belleaf.mypage.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingmall.belleaf.order.service.OrderService;
import com.shoppingmall.belleaf.pay.service.UserRefundService;
import com.shoppingmall.belleaf.pay.vo.UserOrderRefundVO;
import com.shoppingmall.belleaf.review.service.ReviewService;
import com.shoppingmall.belleaf.user.UserVO;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;

@Controller
public class MyOrderController {
	
	@Autowired 
	private OrderService orderService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired 
	private UserRefundService userRefundService;
	
	
	public MyOrderController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/myinfo")
	public String myinfo(HttpSession session, MyInfoVO myinfo, Model model) {
		// session에 저장된 사용자의 id 가져오기
		String user_id = (String)session.getAttribute("user_id");
		myinfo.setUser_id(user_id);
		
		// 사용자의 주문 내역 가져오기 및 model에 저장
		List<MyInfoVO> myOrder = orderService.getMyOrder(user_id);
		model.addAttribute("orderList", myOrder);
		session.setAttribute("myOrderList", myOrder);
		// 리뷰 존재 여부 확인하기 및 model에 저장
		List<Integer> existList = new ArrayList<Integer>();
		for(MyInfoVO info : myOrder) {
			System.out.println(info);
			int exist = reviewService.existReview(info);
			System.out.println(exist);
			existList.add(exist);
		}
		
		model.addAttribute("existList", existList);
				
		return "user/MyPageTemplate";
	}
	
	@RequestMapping("/myinfo/order")
	public String myinfoOrder(HttpSession session, MyInfoVO myinfo, Model model) {
		// session에 저장된 사용자의 id 가져오기
		String user_id = (String)session.getAttribute("user_id");
		myinfo.setUser_id(user_id);
		
		// 사용자의 주문 내역 가져오기 및 model에 저장
		List<MyInfoVO> myOrder = orderService.getMyOrder(user_id);
		model.addAttribute("orderList", myOrder);
		session.setAttribute("myOrderList", myOrder);
		// 리뷰 존재 여부 확인하기 및 model에 저장
		List<Integer> existList = new ArrayList<Integer>();
		for(MyInfoVO info : myOrder) {
			System.out.println(info);
			int exist = reviewService.existReview(info);
			System.out.println(exist);
			existList.add(exist);
		}
		
		model.addAttribute("existList", existList);
		
		return "user/myinfo";
	}
	
	@GetMapping("/myinfo/refund")
	public String myinfoRefund(MyInfoVO myinfo, HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("user_id");
		
		myinfo.setUser_id(user_id);
		MyInfoVO orderInfo = userRefundService.getOrderInfo(myinfo);
		model.addAttribute("oneOrder",orderInfo);
		
		return "user/refundForm";
	}
	
	@PostMapping(value="/myinfo/refund", produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertRefund(
            @RequestParam("refund_reason") String refund_reason,
            @RequestParam("order_detail_id") int order_detail_id,
            @RequestParam int refundTotal, UserOrderRefundVO refund) {
		
		// refund에 데이터를 세팅하기
		refund.setRefund_total((int)refundTotal);
		refund.setRefund_reason(refund_reason);
		refund.setOrder_detail_id(order_detail_id);
		
		// refund를 insert하기 (return 값은 insert된 row 값.)
		int result = userRefundService.insertRefund(refund);
		
		// 만약 result가 1이면 정상적으로 insert에 성공한 것. 만약 아니면 실패 문구 보내기
		if(result == 1) {
			return "환불신청을 성공하였습니다.";
		} else {
			return "환불신청을 실패하였습니다.\n다시 환불 신청을 하시거나 고객센터에 문의해주세요";
		}
		
	}

}
