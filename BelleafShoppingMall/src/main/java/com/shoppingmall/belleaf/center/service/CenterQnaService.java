package com.shoppingmall.belleaf.center.service;

import java.util.List;
import java.util.Map;

import com.shoppingmall.belleaf.center.vo.CenterQnaVO;

public interface CenterQnaService {
	
	 
	
	    
	 //삭제 
	void deleteCenterQna(CenterQnaVO vo);
	//한글 등록
	void insertCenter(CenterQnaVO vo);
	//업데이트 
	void updateCenter(CenterQnaVO vo);
	
	//총합
	public int getCenterListCnt(String searchCondition, String searchKeyword);
		
	//하나의 센터 게시판을 가져올때
	Map<String, Object> getCenterQna(CenterQnaVO vo);	
	
	//검색에 결과에 따른 qnaList출력
	public List<Map<String,Object>> getCenterqnaList(String searchCondition,String searchKeyword,String start,String end);
	
	// user_id 로 전체 qna 가져오기
	public List<Map<String, Object>> myCenterQna(CenterQnaVO vo);
	
	// 마이페이지에서 qna 하나와 그에 맞는 reply 가져오기 
	public Map<String, Object> mycenter(CenterQnaVO vo);

	// 하나 조회
	public CenterQnaVO selectCenterQna(CenterQnaVO vo);
}
