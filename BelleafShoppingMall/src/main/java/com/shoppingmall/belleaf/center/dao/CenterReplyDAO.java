package com.shoppingmall.belleaf.center.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.center.vo.CenterReplyVO;

@Repository
public class CenterReplyDAO {

	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CenterReplyDAO() {
		System.out.println(">> CenterReplyDAOMybatis() 객체 생성~");
	}
	
	//답변삭제
	public void deleteCnterReply(CenterReplyVO vo)
	{
		System.out.println("mybatis사용 ");
		mybatis.delete("centerReplyDAO.deleteCenterReply",vo);
	}
	
	//답변 추가하는 코드
	public void insertCenterReply(CenterReplyVO vo)
	{
		System.out.println("insertCenterReply");
		mybatis.insert("centerReplyDAO.insertCenterReply",vo);
	}

	public int getCenerListCnt(String searchCondition, String searchKeyword) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("searchKeyword", searchKeyword);
		map.put("searchCondition",searchCondition);
		
		return mybatis.selectOne("centerReplyDAO.centerRePlyListCnt",map);
	}
	
	
	public List<Map<String,Object>> getReplyList(String searchCondition, String searchKeyword, String start,String end)
	{
		Map<String, String> map=new HashMap<String, String>();
		map.put("searchKeyword",searchKeyword);
		map.put("searchCondition", searchCondition);
		map.put("start",start);
		map.put("End", end);
				
	return mybatis.selectList("centerReplyDAO.searchReplyList",map);
	
	}
	
	//답변하나 조회
	public CenterReplyVO getCenterReply(CenterReplyVO vo)
	{
		return mybatis.selectOne("centerReplyDAO.getCenterReply",vo);
	}
	
	public void updateCenterReply(CenterReplyVO vo)
	{
		 mybatis.update("centerReplyDAO.updateCenterReply",vo);
	}
	
	
	
	
	
	
}
