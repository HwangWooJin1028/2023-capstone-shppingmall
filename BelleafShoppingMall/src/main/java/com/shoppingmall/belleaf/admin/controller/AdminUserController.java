package com.shoppingmall.belleaf.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingmall.belleaf.paging.vo.PagingVO;
import com.shoppingmall.belleaf.user.UserVO;
import com.shoppingmall.belleaf.user.service.AdminUserService;



@Controller
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;
	
	public AdminUserController() {
		// TODO Auto-generated constructor stub
	}
	
	@GetMapping("/admin/user/list") 
	public String adminUserList(Model model,
			@RequestParam(value="searchCondition", required=false) String searchCondition, 
			@RequestParam(value="searchKeyword", required=false) String searchKeyword,
			@RequestParam(value="paging", required=false) PagingVO paging,
			@RequestParam(value="nowPage", required=false, defaultValue="1") String nowPage,
			@RequestParam(value="cntPerPage", required=false, defaultValue="10") String cntPerPage) {
		
		System.out.println("AdminHomeController -> [/admin/user/list]");
		// 잘못 들어온 경우의 처리
		if(nowPage == null || nowPage.equals("0")) {
			nowPage = "1";
		}
		int total = adminUserService.getAdminIFUserListCnt(searchCondition, searchKeyword);
		
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStartItemNum());
		String end = Integer.toString(paging.getEndItemNum());
		
		List<Map<String, Object>> list = adminUserService.adminIFUserList(searchCondition, searchKeyword, start, end);
		model.addAttribute("userList", list);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("paging", paging);	

		
		return "admin/adminUserList";
	}
	
	@GetMapping("/admin/user/info")
	public String adminUser(UserVO user, Model model) {
		System.out.println(": adminUser -> adminUser" );
		UserVO vo = adminUserService.adminSelectUser(user);
		model.addAttribute("editUser",vo);
		
		return "admin/adminUser";
	}
	
	@GetMapping("/admin/user/delete")
	public String adminUser(UserVO user) {
		System.out.println(": adminUser -> adminUser" );
		adminUserService.adminSleeperUser(user);
		
		return "redirect:/admin/user/list";
	}
	
	
}
