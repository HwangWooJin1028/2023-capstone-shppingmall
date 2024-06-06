package com.shoppingmall.belleaf.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingmall.belleaf.order.service.AdminUserOrderService;
import com.shoppingmall.belleaf.order.vo.UserOrderVO;
import com.shoppingmall.belleaf.paging.vo.PagingVO;


@Controller
public class AdminOrderController {
	
	@Autowired
	AdminUserOrderService adminUserOrderService;
	
	// 배송 상태 보여준다.
	@GetMapping("/admin/order/delivery") 
	public String adminOrderDelivery(Model model,
			@RequestParam(value="paging", required=false) PagingVO paging,
			@RequestParam(value="nowPage", required=false, defaultValue="1") String nowPage,
			@RequestParam(value="cntPerPage", required=false, defaultValue="10") String cntPerPage) {
		System.out.println("AdminHomeController -> [/order/delivery]");
		
		// 잘못 들어온 경우의 처리
		if(nowPage == null || nowPage.equals("0")) {
			nowPage = "1";
		}
		
		int total = adminUserOrderService.adminUserOrderCntSelect();
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<UserOrderVO> list = adminUserOrderService.adminUserOrderListSelect(Integer.toString(paging.getStartItemNum()), Integer.toString(paging.getEndItemNum()));
		model.addAttribute("udlist", list);
		model.addAttribute("paging", paging);
		
		return "admin/adminOrderDelivery";
	}
	
	// 배송상태를 변경할때 사용하는 controller
	@GetMapping("/admin/order/delivery/update")
	public String adminOrderDeliveryStateUpdate(@RequestParam String order_id) {
		adminUserOrderService.adminUserOrderStateUpdate(order_id);
		return "redirect:/admin/order/delivery";
	}

	
	
	
}
