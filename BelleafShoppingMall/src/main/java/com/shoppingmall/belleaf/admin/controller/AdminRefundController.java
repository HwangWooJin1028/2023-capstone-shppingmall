package com.shoppingmall.belleaf.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingmall.belleaf.pay.service.AdminRefundService;
import com.shoppingmall.belleaf.pay.vo.RefundTotalVO;

@Controller
public class AdminRefundController {
	@Autowired
	private AdminRefundService adminRefundService;
	
	@GetMapping("/admin/order/refundlist") 
	public String adminOrderRefundList(Model model) {
		System.out.println("AdminHomeController -> [/order/refundlist]");
		
		List<RefundTotalVO> list = adminRefundService.adminRefundList();
		model.addAttribute("refundList", list);
		
		return "admin/adminOrderRefundList";
	}
	
	@PostMapping("/admin/order/refundlist")
	public String adminRefundStatusUpdate(@RequestParam int refund_id, @RequestParam int refund_status, 
			@RequestParam String user_id, @RequestParam String order_id, @RequestParam int order_detail_id, 
			RefundTotalVO refundTotalVO, Model model) {
		
		RefundTotalVO vo = new RefundTotalVO();
		vo.setRefund_id(refund_id);
		vo.setRefund_status(refund_status);
		adminRefundService.adminUpdateStatus(vo);
		
		int check = adminRefundService.adminCheckRefund(refund_id);
		if(check==2) {
			refundTotalVO.setUser_id(user_id);
			refundTotalVO.setOrder_detail_id(order_detail_id);
			adminRefundService.adminDeletePoint(refundTotalVO);
		}
		
		return "redirect:/admin/order/refundlist";
	}
	
}
