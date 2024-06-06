package com.shoppingmall.belleaf.user.controller;

import javax.
servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shoppingmall.belleaf.user.UserVO;
import com.shoppingmall.belleaf.user.service.UserJoinService;


@Controller
@SessionAttributes("joinUser")  
public class UserJoinController {

	@Autowired
	private UserJoinService userJoinService;
	

	
	public UserJoinController() {
		System.out.println(">>UserJoinController() 객체 생성~");
	}
	
	@GetMapping("/join")
	public String joinView() {
		System.out.println(">>회원가입 페이지로 이동 -> joinView()");
		
		return "common/joinForm";
	}
	
	@PostMapping("/joinAction")
	public String joinAction(UserVO vo, HttpServletRequest request, String user_phone1, String user_phone2, String user_phone3) {
		System.out.println(">>회원가입 - joinAction()");
		
		System.out.println("VO : " + vo);
	
		
		
		String user_phone = user_phone1 + user_phone2 + user_phone3;//전화번호
		vo.setUser_phone(user_phone);
		System.out.println("user_phone : " + user_phone);
		userJoinService.insertUser(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("joinUser", vo);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/idCheck",method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		
		String user_id = request.getParameter("user_id");
		int result=userJoinService.idCheck(user_id);
		return Integer.toString(result);
	}
	

	
	
	
	
	
	
	

}
