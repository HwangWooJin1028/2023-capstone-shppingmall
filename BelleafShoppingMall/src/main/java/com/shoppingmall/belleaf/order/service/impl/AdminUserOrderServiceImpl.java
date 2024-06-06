package com.shoppingmall.belleaf.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.order.dao.AdminUserOrderDAO;
import com.shoppingmall.belleaf.order.service.AdminUserOrderService;
import com.shoppingmall.belleaf.order.vo.UserOrderVO;


@Service("adminUserOrderService")
public class AdminUserOrderServiceImpl implements AdminUserOrderService{
	@Autowired
	private AdminUserOrderDAO adminUserOrderDAO;
	
	public AdminUserOrderServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public int adminUserOrderCntSelect() {
		return adminUserOrderDAO.adminUserOrderCntSelect();
	}

	@Override
	public List<UserOrderVO> adminUserOrderListSelect(String start, String end) {
		return adminUserOrderDAO.adminUserOrderListSelect(start, end);
	}

	@Override
	public void adminUserOrderStateUpdate(String order_id) {
		adminUserOrderDAO.adminUserOrderStateUpdate(order_id);
	}
	
}
