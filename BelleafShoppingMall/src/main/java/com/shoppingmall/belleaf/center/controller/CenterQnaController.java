package com.shoppingmall.belleaf.center.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingmall.belleaf.center.service.CenterQnaService;
import com.shoppingmall.belleaf.center.service.CenterReplyService;
import com.shoppingmall.belleaf.center.vo.CenterQnaVO;
import com.shoppingmall.belleaf.center.vo.CenterReplyVO;
import com.shoppingmall.belleaf.paging.vo.PagingVO;
import com.shoppingmall.belleaf.user.UserVO;

@Controller
public class CenterQnaController {

	@Autowired
	private CenterQnaService  centerQnaService;
	
	@Autowired
	private CenterReplyService ceterReplySerice;
	


	public CenterQnaController() {
		System.out.println("--------centerQnaController");
	}
	
	
	@ModelAttribute("contitionMap")
	public Map<String, Object> seachConditionMap(){
		System.out.println("map searchcontitionMap()실행");
		Map<String,Object> conditionMap=new HashMap<String, Object>();
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("제목", "TITLE");
		return conditionMap;
		
	} 
	
	//고객문의 상세 페이지 이동
	@RequestMapping("/center/info")
	public String getCenterQna(CenterQnaVO vo, Model model, HttpSession session) {//HttpSession session사용하는이유는 user_id의session이 클라이언트 쿠키에 저장되어있게 하는것
		Map<String, Object> getCenter=centerQnaService.getCenterQna(vo);//
		model.addAttribute("getCenter",getCenter);
		System.out.println("getCenter"+getCenter);
		
		UserVO centerUser=(UserVO)session.getAttribute("user");
		model.addAttribute("centerUser",centerUser);
		System.out.println("centerUser"+centerUser);
		System.out.println("vo"+vo);
		
		System.out.println();
		return "user/getCenter";
	}
	
	//전체 리스트
	@RequestMapping("/center/list")
	public String CenterQnaPerPageSearchlist(Model model 
			,@RequestParam (value="searchCondition",required=false)String searchCondition
			,@RequestParam (value="searchKeyword",required=false) String searchKeyword
			,@RequestParam(value="paging",required=false)PagingVO paging
			,@RequestParam(value = "nowPage", required = false, defaultValue ="1")String nowPage
			,@RequestParam(value="cntPerage", required=false,defaultValue = "10")String cntPerPage) {
		System.out.println("getCentERListpaging()실행");
		
		System.out.println("searcCondition:"+searchCondition);
		System.out.println("searchKeyword"+searchKeyword);
	
		//잘못 들어온 경우처리
		if(nowPage == null|| nowPage.contentEquals("0"))
		{
			nowPage="1";
		}
				
		//페이징 처리
		int total=centerQnaService.getCenterListCnt(searchCondition, searchKeyword);//String searchCondition가져온것
		System.out.println(total);
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStartItemNum());
		String end = Integer.toString(paging.getEndItemNum());
		
		System.out.println("start, end"+start+","+end);
		
		//mabatis를 위한 map생성
		List<Map<String, Object>> list=centerQnaService.getCenterqnaList(searchCondition, searchKeyword, start, end);
		System.out.println(list);
		model.addAttribute("searchCondition",searchCondition);
		model.addAttribute("searchKeyword",searchKeyword);
		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
	
		
		return "user/getCenterListPaging";

	}
	
	//고객문의 작성 페이지로 이동	
	@GetMapping("/center/info/insert")
	public String insertCenterQna(){
		System.out.println("..public String insertCenterQna()>>>>>>>>>>.");
		return "user/insertCenter";
	}
	
	
	
	//고객문의 등록 글쓰기 페이지
	@PostMapping("/center/info/insert")
	public String insertCenterQnaWrite(CenterQnaVO vo,HttpSession session) {
		System.out.println("고객문의 입력");
		String user_id=(String)session.getAttribute("user_id");
		vo.setUser_id(user_id);
		centerQnaService.insertCenter(vo);
		System.out.println("고객문의 목록 페이지로 이동");
		return "redirect:/center/list";
		
	}
	
	//고객문의삭제
	@RequestMapping("/center/info/delete")
	public String deleteCenterQna(CenterQnaVO vo, CenterReplyVO rvo)	{
			System.out.println("delete 할 rvo:"+rvo);
			System.out.println("delete할 vo"+vo);
			
			if(rvo.getCenter_reply_id() !=0) {//0이아니라 아이디가 있으면 
				ceterReplySerice.deleteCenterReply(rvo);
			}
			centerQnaService.deleteCenterQna(vo);
			System.out.println("고객 목록 페이지이동삭제");
			
			return "redirect:/center/list";
	
	}
	
	@GetMapping("/center/info/update")
	public String upddateCenterQna(CenterQnaVO vo, Model model)	{
		Map<String,Object> getCenter=centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter",getCenter);
		System.out.println("getCenter"+getCenter);
		
		System.out.println("고객 문의 수정 페이지로 이동(getCenterqna)-updateCenterQNA");
		
		return "user/updateCenter";
	}
	
	@PostMapping("/center/info/update")
	public String updateCenterQna(CenterQnaVO vo,Model model)	{
			System.out.println("updateCenterQnaWrit"+vo);
			Map<String,Object> getCenter=centerQnaService.getCenterQna(vo);//DB에서 점보를 가졍노다.
			model.addAttribute("getCenter",getCenter);//모델이 올려놓는다.
			System.out.println("getCenter:"+getCenter);//출력한다.
			
			
			System.out.println("updata할vo"+vo);//UPDATA할 내용 
			String center_qna_id=Integer.toString(vo.getCenter_qna_id());
			centerQnaService.updateCenter(vo);
			System.out.println("고객문의tkdtpvpdlwl(getcenter.jsp)이동-updateCenterQnaWrite()");
			
			
		return "redirect:/center/info?center_qna_id="+center_qna_id;
	}
	
}
