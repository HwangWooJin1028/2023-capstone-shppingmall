package com.shoppingmall.belleaf.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shoppingmall.belleaf.order.vo.UserOrderVO;


public interface AdminUserOrderService {
	
	public int adminUserOrderCntSelect();
	public List<UserOrderVO> adminUserOrderListSelect(String start, String end);
	public void adminUserOrderStateUpdate(String order_id);
}
