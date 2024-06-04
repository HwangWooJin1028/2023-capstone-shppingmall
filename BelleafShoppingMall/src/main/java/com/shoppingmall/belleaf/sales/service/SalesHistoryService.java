package com.shoppingmall.belleaf.sales.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shoppingmall.belleaf.user.vo.MyInfoVO;

public interface SalesHistoryService {
	
	// 판매 내역 전체 리스트
	public int adminSalesListCnt();
	
	// 판매내역 리스트 보기
	public List<MyInfoVO> adminSalesListSelect(String start, String end);
	
	// 하나의 판매내역 상세보기
	public List<MyInfoVO> adminSalesOneSelect(String order_id);

}
