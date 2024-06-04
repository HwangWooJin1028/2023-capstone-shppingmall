package com.shoppingmall.belleaf.center.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.center.vo.CenterQnaVO;
	
@Repository
public class CenterQnaDAO {
		
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CenterQnaDAO() {
		System.out.println(">> CenterQnaDAOMybatis() 객체 생성~");
	}
	
	//전체 문의 조회를 위한 전체row수
	public int getCenterListCnt(String searchCondition, String searchKeyword) {
		Map<String,String> map=new HashMap<String, String>();
		map.put("searchKeyword",searchKeyword);
		map.put("searchCondition",searchCondition);
		return mybatis.selectOne("centerQnaDAO.centerQnaDAOListCnt",map);//int
		
	}
	//전체 리스트 조회
	public List<Map<String, Object>> getCenterQnaList(String searchCondition, String searchKeyword,String start, String End) {
		 
		Map<String, String> map=new HashMap<String, String>();
		map.put("searchKeyword", searchKeyword);
		map.put("searchCondition", searchCondition);
		map.put("start", start);
		map.put("End", End);
		
		
		return mybatis.selectList("centerQnaDAO.serachGetqnaList",map);//List<Map<String, Object>>
	}   
	
	public void insertCenter(CenterQnaVO vo) {
		System.out.println("mybatis이용");
		mybatis.insert("centerQnaDAO.insertCenterQna",vo);
		
	}
	
	//마의페이지에서 문의 1개 조회
	public Map<String,Object>getCenterqna(CenterQnaVO vo)
	{
		System.out.println("CenterQnaDAO + getCenterqna" +  vo);
		System.out.println("mybatis-getCenterqna" +  vo);
		
		return mybatis.selectOne("centerQnaDAO.getCeterQna",vo);
	}
	
	public void deleteCenterQna(CenterQnaVO vo) {
		System.out.println("mybatis");
		
		 mybatis.selectOne("centerQnaDAO.deleteCenterQna",vo);
	}
	
	public void updateCenterQna(CenterQnaVO vo)
	{
		System.out.println("mybatis");
		mybatis.selectOne("centerQnaDAO.updateCenterQna",vo);
	}
	
	// user_id 로 전체 qna 가져오기
	public List<Map<String, Object>> myCenterQna(CenterQnaVO vo) {
		return mybatis.selectList("centerQnaDAO.myCenterQna", vo);
	}
	
	// 마이페이지에서 qna 하나와 그에 맞는 reply 가져오기 
	public Map<String, Object> mycenter(CenterQnaVO vo) {
		return mybatis.selectOne("centerQnaDAO.myCenter", vo);
	}

	// 하나 조회
	public CenterQnaVO selectCenterQna(CenterQnaVO vo) {
		return mybatis.selectOne("centerQnaDAO.selectCenterQna", vo);
	}
	
}
