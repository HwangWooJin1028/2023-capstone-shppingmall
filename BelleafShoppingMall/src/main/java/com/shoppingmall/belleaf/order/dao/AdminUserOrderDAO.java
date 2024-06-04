package com.shoppingmall.belleaf.order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.order.vo.UserOrderVO;


@Repository
public class AdminUserOrderDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminUserOrderDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public int adminUserOrderCntSelect() {
		return mybatis.selectOne("adminUserOrderDAO.adminUserOrderCntSelect");
	}
	
	public List<UserOrderVO> adminUserOrderListSelect(String start, String end) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("adminUserOrderDAO.adminUserOrderListSelect", map);
	}
	
	public void adminUserOrderStateUpdate(String order_id) {
		mybatis.update("adminUserOrderDAO.adminUserOrderStateUpdate", order_id);
	}
}
