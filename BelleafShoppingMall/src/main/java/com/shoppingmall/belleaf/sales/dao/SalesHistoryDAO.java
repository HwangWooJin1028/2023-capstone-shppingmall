package com.shoppingmall.belleaf.sales.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.user.vo.MyInfoVO;

@Repository
public class SalesHistoryDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public SalesHistoryDAO() {
		// TODO Auto-generated constructor stub
	}
	
	// 판매 내역 전체 리스트
	public int adminSalesListCnt() {
		return mybatis.selectOne("salesHistoryDAO.adminSalesListCnt");
	}
	
	// 판매내역 리스트 보기
	public List<MyInfoVO> adminSalesListSelect(String start, String end) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("salesHistoryDAO.adminSalesListSelect", map);
	}
	
	// 하나의 판매내역 상세보기
	public List<MyInfoVO> adminSalesOneSelect(String order_id) {
		return mybatis.selectList("salesHistoryDAO.adminSalesOneSelect", order_id);
	}

	
}
