package com.shoppingmall.belleaf.order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.inven.vo.InvenVO;
import com.shoppingmall.belleaf.order.vo.UserOrderDetailVO;
import com.shoppingmall.belleaf.order.vo.UserOrderVO;
import com.shoppingmall.belleaf.pay.vo.PaymentVO;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;
import com.shoppingmall.belleaf.user.vo.UserOrderPointVO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertOrder(UserOrderVO vo) {
		mybatis.insert("orderDAO.insertOrder", vo);
	}
	
	public void insertOrderDetail(UserOrderDetailVO vo) {
		mybatis.insert("orderDAO.insertOrderDetail", vo );
	}
	
	public void deleteAllCart(String user_id) {
		mybatis.delete("orderDAO.deleteAllCart", user_id);
	}
	
	public UserOrderVO selectUserOrder(String user_id, String order_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("order_id", order_id);
		return mybatis.selectOne("orderDAO.selectUserOrder", map);
	}
	
	public void insertPayment(PaymentVO payment) {
		mybatis.insert("orderDAO.insertPayment", payment);
	}
	
	public void updatePoint(UserOrderPointVO vo) {
		mybatis.update("orderDAO.updatePoint",vo);
	}
	
	public void insertOrderDetailDirect(UserOrderDetailVO vo) {
		mybatis.insert("orderDAO.insertOrderDetailDirect",vo);
	}
	
	public void deleteInven(InvenVO inven) {
		mybatis.update("orderDAO.deleteInven", inven);
	}
	
	public List<UserOrderDetailVO> getIdQty(String order_id) {
		return mybatis.selectList("orderDAO.getIdQty", order_id);
	}
	// Mypage에서 보여줄 주문 내역 가져오기
	public List<MyInfoVO> getMyOrder(String user_id) {
		return mybatis.selectList("orderDAO.getMyOrder", user_id);
	}	
}