package com.shoppingmall.belleaf.center.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingmall.belleaf.center.dao.CenterReplyDAO;
import com.shoppingmall.belleaf.center.service.CenterQnaService;
import com.shoppingmall.belleaf.center.service.CenterReplyService;
import com.shoppingmall.belleaf.center.vo.CenterQnaVO;
import com.shoppingmall.belleaf.center.vo.CenterReplyVO;
import com.shoppingmall.belleaf.paging.vo.PagingVO;
@Controller
@RequestMapping("/admin/**")//user/jsp
public class CenterReplyController {

	@Autowired CenterQnaService centerQnaService;
	
	@Autowired CenterReplyService CenterReplyService;
	
	public CenterReplyController() {
		System.out.println("▶▶▶ AdminCenterController() 객체 생성~~");
	}
	//검색
	@ModelAttribute("conditionMap")
	public Map<String, Object> searchConditionMap(){
		System.out.println("searchConditionMap()실행");
		Map<String, Object> conditionMap=new HashMap<String, Object>();
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("제목","TITLE");
		
		return conditionMap;
	}
	
	@RequestMapping("/centerList")
	public String adminCenterList(Model model
			,@RequestParam(value="searchCondition", required = false)String searchCondition
			,@RequestParam(value = "searchKeyword",required = false) String searchKeyword
			,@RequestParam(value = "paging",required = false)PagingVO paging
			,@RequestParam(value="nowPage",required = false, defaultValue = "1")String nowPage
			,@RequestParam(value = "cntPerPage",required = false,defaultValue = "10")String cntperPage)	{
		
		System.out.println("adminCenterListRepy~~~~~~~()실행");
		System.out.println("serarchCondition"+searchCondition);
		System.out.println("serarchKeyword"+searchKeyword);
		
		//잘못들어온경우
		if(nowPage == null|| nowPage.contentEquals("0"))
		{
			nowPage="1";
		}
		
		//페이징 처리
		int total=CenterReplyService.getReplyListCnt(searchCondition,searchKeyword);
		System.out.println("total"+total);
		
		paging=new PagingVO(total,Integer.parseInt(nowPage),Integer.parseInt(cntperPage));
		
		String start = Integer.toString(paging.getStartItemNum());
		String end = Integer.toString(paging.getEndItemNum());
		
		System.out.println("start+end"+","+start+","+end);
		
		//mabatis를 위한map생성
		List<Map<String, Object>> replylist=CenterReplyService.getCenterqnaList(searchCondition, searchKeyword,start,end);
		System.out.println("replylist"+replylist);
		model.addAttribute("sesarchCodition",searchKeyword);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("replylist",replylist);
		model.addAttribute("paging",paging);
		
		return "admin/adminUserAskList";
	}
	
	
	//고객문의 상세페이지로 이동
	@RequestMapping("/adminCenter")
	public String adminCenter(CenterQnaVO vo, Model model, HttpSession session) {
		System.out.println("/adminCenter controller 실행 + " + vo);
		Map<String, Object> getCenter = centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter", getCenter); 
		System.out.println("getCenter"+getCenter);
		
		System.out.println("고객 문의 상세페이지(centerOne.jsp)이동 - adminCenter()");
		return "admin/centergetBoard";
	}
	
	//답변등록 글쓰기 페이지 
	@RequestMapping("/adminReplyInsert")
	public String admiRePlyInsert(CenterQnaVO vo,CenterReplyVO rvo, Model model,int center_qna_id)throws IllegalArgumentException, IOException {
		System.out.println("adminRlyinsert");
		System.out.println("center_qna_id:"+center_qna_id);
		model.addAttribute("center_qna_id", center_qna_id);
		
		
		System.out.println("insert할 rvo"+rvo);
		CenterReplyService.insertCenterReply(rvo);
		  
		Map<String, Object> getCenter=centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter", getCenter);
		System.out.println(getCenter);
		
		return "redirect:adminCenter";
	}
	
	
	//관리자 고객 문의삭제
	@RequestMapping("/adminCenterdelete")
	public String adminCenterdelete(CenterQnaVO vo,CenterReplyVO rvo) {
		System.out.println("delete할rvo:"+rvo);
		System.out.println("deletet할 vo"+vo);
		
		if(CenterReplyService.getCenterReply(rvo).getCenter_reply_id() != 0)
		{
						
			CenterReplyService.deleteCenterReply(rvo);
		}
		centerQnaService.deleteCenterQna(vo);
		
		return "redirect:centerList";
	}
	
	//관리자 답글 삭제
	@RequestMapping("/adminReplyDelete")
	public String adminRePlyDelete(CenterQnaVO vo,CenterReplyVO rvo,int center_qna_id, Model model)	{
		System.out.println("delete할rvo:"+rvo);
		System.out.println("deletet할 vo"+vo);
		CenterReplyService.deleteCenterReply(rvo);
		Map<String, Object> getCenter=centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter", getCenter);
		System.out.println("getCenter"+getCenter);
			
		return "redirect:adminCenter?center_qna_id="+center_qna_id;
	}
	
	//관리자 답글 수정 페이지로 이동
	@RequestMapping("/adminReplyUpdateGo")
	public String adminReplyUpdateGO(CenterQnaVO vo,Model model,int center_qna_id){
		System.out.println("관리자 답글 수정페이지로 이동하는 쩜두");
		System.out.println("center_qna_id"+center_qna_id);
		model.addAttribute("center_qna_id", center_qna_id);
		
		Map<String, Object> getCenter=centerQnaService.getCenterQna(vo);
		System.out.println("getCenter"+getCenter);
		model.addAttribute("getCenter", getCenter);
		
		return "admin/centerReplyUpdate";
		
	} 
	
	
	//▶▶관리자 답글 수정
	@RequestMapping("/adminReplyUpdate")
	public String adminReplyUpdate(CenterQnaVO vo, CenterReplyVO rvo, Model model, int center_qna_id) throws IllegalArgumentException, IOException {
		System.out.println("▶▶adminReplyUpdate(관리자 답글수정) 쩜두 실행~ ");
		System.out.println("center_qna_id: " + center_qna_id);
		model.addAttribute("center_qna_id", center_qna_id);
		
		System.out.println("update할  rvo : " + rvo);
		CenterReplyService.updateCenterReply(rvo);
		
		Map<String, Object> getCenter = centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter", getCenter);
		System.out.println("getCenter: " + getCenter);
		
		System.out.println("▶▶고객 문의 상세페이지(centerOne.jsp)이동 - adminReplyUpdate()");
		return "redirect:adminCenter";
	}
	
}
