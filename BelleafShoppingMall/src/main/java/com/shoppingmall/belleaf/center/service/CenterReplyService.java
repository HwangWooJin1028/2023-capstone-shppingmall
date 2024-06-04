package com.shoppingmall.belleaf.center.service;

import java.util.List;
import java.util.Map;

import com.shoppingmall.belleaf.center.vo.CenterQnaVO;
import com.shoppingmall.belleaf.center.vo.CenterReplyVO;


public interface CenterReplyService {
	
	//삭제하는코드
	void deleteCenterReply(CenterReplyVO vo);
	
	//한개 답변등록
	void insertCenterReply(CenterReplyVO vo);
	
	//업데이트 
	void updateCenterReply(CenterReplyVO vo);
	
	//총합
	public int getReplyListCnt(String searchCondition, String searchKeyword);
	
	//검색에 결과에 따른ReplyList출력
	public List<Map<String, Object>> getCenterqnaList(String searchCondition, String searchkeyword, String start, String end);

	public CenterReplyVO getCenterReply(CenterReplyVO vo);
	
}
