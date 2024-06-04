package com.shoppingmall.belleaf.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.tools.DocumentationTool.Location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.shoppingmall.belleaf.user.UserVO;
import com.shoppingmall.belleaf.user.service.UserLoginService;


@Controller
@SessionAttributes("user")
public class UserLoginController {
	@Autowired
	private UserLoginService userLoginService;

	public UserLoginController() {
		System.out.println(":::: UserLoginController() 객체 생성");
	}

	@RequestMapping("/login")
	public String loginView(Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("로그인 화면이동-loginview()");
		String referer = request.getHeader("Referer");
		System.out.println(referer);// 0. 로그인 후 이전페이지로 돌아가기위한 설정
		request.getSession().setAttribute("redirectURI", referer);
		session.setAttribute("referer", referer);

		return "common/login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, SessionStatus status) {

		System.out.println("로그아웃 처리");
		System.out.println(session.getId());
		status.setComplete();
		session.invalidate();

		return "redirect:/";
	}

	@PostMapping("/login")
	public String loginAction(UserVO vo, HttpSession session, HttpServletRequest request, Model model, String user_id,
			String user_pw) {
		System.out.println(">>>로그인-loginAction()");
		System.out.println("vo:" + vo);

		// 0.로그인후 이전페이지로 돌아가기위한 설정
		// 이전 페이지 정보 가져오기
		String refer = (String) session.getAttribute("referer");
		System.out.println(refer);//http://localhost:8089/
		

		UserVO user = userLoginService.getUser(vo);
		session = request.getSession();//세션을 가져오는것
		System.out.println(session.getId());

		String location = "redirect:/login";//controller다시 타는것
		String msg = "";
		System.out.println("user_id" + user_id);
		System.out.println("user_pw" + user_pw);

		if (user == null || user.getUser_state() == 0) {// 휴먼계정
			model.addAttribute("msg", "존재하지 않는 아이디입니다. 다시 확인해주세요");
			location = "common/login";
		} else if (user.getUser_state() == 2) {
			session.setAttribute("user", user); // user라는 이름으로 세션에 등록
			session.setAttribute("user_id", user.getUser_id());
			location = "redirect:/admin";
		} else if(user.getUser_state() == 1) {// 일반계정
			System.out.println("회원 로그인 성공");
			session.setAttribute("user", user);
			session.setAttribute("user_id", user.getUser_id());
			System.out.println(session.getId()+"getid");

			String[] url = refer.split("/");
			System.out.println(url.toString());
			/*
			 * if(url.length >= 4) { if (url[3].equals("joinAction")) { location =
			 * "redirect:/"; } else if (url[3].equals("findIdview")) { location =
			 * "redirect:/"; } else if (url[3].equals("finIdAction")) { location =
			 * "redirect:/"; } else if (url[3].equals("findpwview")) { location =
			 * "redirect:/"; } else if (url[3].equals("findPwdAction")) { location =
			 * "redirect:/"; }else { if(url[3].equals("")) { location = "redirect:/"; }else
			 * { location = "redirect:/" + request.getHeader("Referer"); } } } else {
			 * 
			 * }
			 */
			location = "redirect:/";
			/*
			 * String before = refer.substring(21); if (before.equals("joinAction")) {
			 * location = "redirect:/main"; } else if (before.equals("findIdview")) {
			 * location = "redirect:/main"; } else if (before.equals("findpwview")) {
			 * location = "redirect:/main"; }else { if(before.equals("/")) { location =
			 * "redirect:/"; }else { location = "redirect:" + before; } }
			 */

		}

		return location;

	}

	@GetMapping("/findIdview") // 경로만 가는 코드
	public String findIdView() {
		System.out.println("아이디찾기 화면 이동-findIdview()경로만가는코드");
		return "common/findIdForm";
	}

	
	@PostMapping("/finIdAction") 
  public String findIdAction(UserVO vo,HttpSession session, Model model, String user_email, @RequestParam String user_phone1,String user_phone2, String user_phone3) {
	  System.out.println(">>아이디찾기 -fINDIdView()로직타는코드"); 
	  System.out.println(user_phone1);
	  System.out.println(user_phone2);
	  System.out.println(user_phone3);
	  String msg=""; 
	  String user_phone=user_phone1+user_phone2+user_phone3;
	 
	  vo.setUser_email(user_email);//유저이메일 vo.setUser_phone(user_phone);//유저 폰번호
	  vo.setUser_phone(user_phone);
	  UserVO getUser=userLoginService.getId(vo);//DAO에서ID를 가져온다.
	  System.out.println("getUser:"+getUser);
	  model.addAttribute("getUser", getUser);
	  
	  
	  //이전 페이지 정보 가져오기
	  String refer=(String)session.getAttribute("referer");
	  
	  System.out.println(refer);
	  String before=refer.substring(21);
	  System.out.println("before"+before);
	 
	  if(getUser == null) {
		  if(before.equals("findIdAction")) {//값이 없으면 main
			  return "redirect:/main";
		  }else {
			  model.addAttribute("msg","가입된 정보가 없습니다. 다시 확인해주세요");//
			  return "common/findIdFail";
		  }
	  }else {
		
		  return  "common/findIdOK";
	  }   
  	}
	@GetMapping("/findpwview")
	public String findPwdView()
	{
		return "common/findPwdForm";
	}
	
	@PostMapping("/findPwdAction")
	public String findPwdAction(UserVO vo, HttpSession session, Model model,String user_id, String user_email)
	{
		System.out.println("/findpwdAction");
		vo.setUser_id(user_id);
		vo.setUser_email(user_email);
		UserVO getUser=userLoginService.getpwd(vo);
		System.out.println("getpwd"+getUser);
		model.addAttribute("getUser",getUser);
		//이전 페이지 정보 가져오기
		String refer=(String)session.getAttribute("referer");
		
		System.out.println(refer);
		String before=refer.substring(21);
		System.out.println(before);
		
		if(getUser == null) {
			if(before.equals("findPwdForm")) {
				return "redirect:/main";
			}else {
				model.addAttribute("msg", "가입된 정보가 없습니다. 다시 확인 해주세요");
				 	
				return "common/findIdFail";
			}
		}else {
			return "common/findPwdOK";
		}
	
		
		
	}
	
	
	
	
	
  
  

	 

}
