package com.shoppingmall.belleaf.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingmall.belleaf.order.service.OrderService;
import com.shoppingmall.belleaf.user.UserVO;
import com.shoppingmall.belleaf.user.controller.UserJoinController;
import com.shoppingmall.belleaf.user.service.UserJoinService;
import com.shoppingmall.belleaf.user.service.UserLoginService;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;

@Controller
public class MyUserController {

	@Autowired
	private UserJoinService userJoinService;
	
	@Autowired
	private UserLoginService userLoginService;
	
	@Autowired
	private OrderService orderService;
	
	public MyUserController() {
		// TODO Auto-generated constructor stub
	}
	
	@GetMapping("/myinfo/confirm")
	public String myInfoConfirm(MyInfoVO myinfo, Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		String user_id = (String)session.getAttribute("user_id");
		
		myinfo.setUser_id(user_id);
		List<MyInfoVO> myOrder = orderService.getMyOrder(user_id);
		model.addAttribute("orderList", myOrder);
		model.addAttribute("user", user);
		model.addAttribute("user_id", user_id);
		
		return "common/userConfirm";
	}
	
	@PostMapping("/myinfo/confirm")
	public String myInfoConfirm(Model model, HttpSession session, String pwCheck) {
		UserVO user = (UserVO)session.getAttribute("user");
		
		if(pwCheck.equals(user.getUser_pw())) {
			return "user/myInfoUserInfo";
		} else {
			model.addAttribute("msg", "암호가 일치하지 않습니다. 다시 입력해주세요");
			return "common/userConfirm";
		}
	}
	
	@GetMapping("/myinfo/user/delete")
	public String userDelete(UserVO user, Model model) {
		System.out.println("userDelete!!!!");
		model.addAttribute("myid", user.getUser_id());
		return "common/userDeleteForm";
	}
	@PostMapping("/myinfo/user/delete")
	@ResponseBody
	public int userDelete(UserVO user, HttpSession session, Model model, String passwdCheck) {
		String correctPW = userJoinService.userPWcheck(user);
		String user_pw = user.getUser_pw();
		int msg = 0;
		if(user_pw.equals(correctPW) && user_pw.equals(passwdCheck)) {
			userJoinService.secession(user);
			session.invalidate();
			// 성공 시, int 값 1을 반환
			msg = 1;
		} else {
			// 실패 시, int 값 2를 반환
			msg = 2;
		}
		return msg;
	}
	
	@RequestMapping("/myinfo/user")
	public String userInfoEdit(UserVO user, HttpSession session,
			@RequestParam String user_phone1,
			@RequestParam String user_phone2,
			@RequestParam String user_phone3) {
		
		String user_phone = user_phone1 + user_phone2 + user_phone3;
		user.setUser_phone(user_phone);
		userJoinService.updateUserInfo(user);
		
		UserVO myuser = userLoginService.getUser(user);
		session.setAttribute("user", myuser);
		
		return "user/myInfoUserInfo";
	}
}
