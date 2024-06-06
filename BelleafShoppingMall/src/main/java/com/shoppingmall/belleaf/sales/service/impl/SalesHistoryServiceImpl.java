package com.shoppingmall.belleaf.sales.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.sales.dao.SalesHistoryDAO;
import com.shoppingmall.belleaf.sales.service.SalesHistoryService;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;



@Service("salesHistoryService")
public class SalesHistoryServiceImpl implements SalesHistoryService{
	@Autowired
	private SalesHistoryDAO salesHistoryDAO;
	
	@Override
	public int adminSalesListCnt() {
		return salesHistoryDAO.adminSalesListCnt();
	}

	@Override
	public List<MyInfoVO> adminSalesListSelect(String start, String end) {
		return salesHistoryDAO.adminSalesListSelect(start, end);
	}

	@Override
	public List<MyInfoVO> adminSalesOneSelect(String order_id) {
		return salesHistoryDAO.adminSalesOneSelect(order_id);
	}


}
