package com.shoppingmall.belleaf.admin.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingmall.belleaf.paging.vo.PagingVO;
import com.shoppingmall.belleaf.sales.service.SalesHistoryService;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;


@Controller
public class AdminSalesController {
	@Autowired
	private SalesHistoryService salesHistoryService;
	
	public String sampleOrderIdCreate() {
		
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ymd = year+new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		ymd += new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		String sub = "";
		for(int i=0; i<=6; i++) {
			sub += (int)(Math.random()*10);
		}
		String order_id = ymd+"-"+sub;
		return order_id;
	}
	
	public AdminSalesController() {
		System.out.println("AdminSalesController");
	}
	
	@GetMapping("/admin/order/list") 
	public String adminOrderList(Model model, MyInfoVO vo,
			@RequestParam(value="paging", required=false) PagingVO paging,
			@RequestParam(value="nowPage", required=false, defaultValue="1") String nowPage,
			@RequestParam(value="cntPerPage", required=false, defaultValue="10") String cntPerPage) {
		System.out.println("AdminSalesController -> [/order/orderlist]");
		
		// 잘못 들어온 경우의 처리
		if(nowPage == null || nowPage.equals("0")) {
			nowPage = "1";
		}
		System.out.println(sampleOrderIdCreate());
		int total = salesHistoryService.adminSalesListCnt();
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<MyInfoVO> list = salesHistoryService.adminSalesListSelect(Integer.toString(paging.getStartItemNum()), Integer.toString(paging.getEndItemNum()));
		model.addAttribute("saleslist", list);
		model.addAttribute("paging", paging);
		
		return "admin/adminOrderList";
	}
	
	@GetMapping("/admin/order")
	public String adminOrderOne(Model model,@RequestParam String order_id) {
		System.out.println("AdminSalesController -> [/order/orderlist]");
		List<MyInfoVO> list = salesHistoryService.adminSalesOneSelect(order_id);
		System.out.println(list);
		model.addAttribute("orderone", list);
		return "admin/adminOrderOne";
	}
	
	
}
