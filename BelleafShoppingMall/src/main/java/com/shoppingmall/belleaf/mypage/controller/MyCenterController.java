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

import com.shoppingmall.belleaf.center.service.CenterQnaService;
import com.shoppingmall.belleaf.center.vo.CenterQnaVO;
import com.shoppingmall.belleaf.user.UserVO;

@Controller
public class MyCenterController {
	
	@Autowired
	private CenterQnaService centerQnaService;
	
	public MyCenterController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/myinfo/center/list")
	public String myCenterQna(CenterQnaVO center, Model model, HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		center.setUser_id(user_id);
		
		List<Map<String,Object>> myCenterQna = centerQnaService.myCenterQna(center);
		model.addAttribute("myCenterQna", myCenterQna);
		
		return "user/myinfoCenterQna";
	}
	
	@GetMapping("/myinfo/center/info")
	public String myCenter(CenterQnaVO center, Model model, HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		center.setUser_id(user_id);
		
		Map<String, Object> myCenter = centerQnaService.mycenter(center);
		UserVO user = (UserVO)session.getAttribute("user");
		
		model.addAttribute("myCenter", myCenter);
		model.addAttribute("centerUser", user);
		
		return "user/myinfoCenterOne";
	}
	
	// 마이페이지 - 문의 수정	
	@PostMapping("/myinfo/center/info")
	public String updateMyCenter(CenterQnaVO center) {
		System.out.println(center.toString());
		centerQnaService.updateCenter(center);
		return "redirect:/myinfo/center/list";
	}
	
	// 마이페이지 - 문의 삭제
	@RequestMapping("/myinfo/center/delete")
	public String deleteReview(CenterQnaVO vo) {
		centerQnaService.deleteCenterQna(vo);
		return "redirect:/myinfo/center/list";
	}

}
