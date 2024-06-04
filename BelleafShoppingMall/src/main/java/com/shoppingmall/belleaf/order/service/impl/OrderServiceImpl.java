package com.shoppingmall.belleaf.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.inven.vo.InvenVO;
import com.shoppingmall.belleaf.order.dao.OrderDAO;
import com.shoppingmall.belleaf.order.service.OrderService;
import com.shoppingmall.belleaf.order.vo.UserOrderDetailVO;
import com.shoppingmall.belleaf.order.vo.UserOrderVO;
import com.shoppingmall.belleaf.pay.vo.PaymentVO;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;
import com.shoppingmall.belleaf.user.vo.UserOrderPointVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;
	
	public OrderServiceImpl() {
		
	}

	@Override
	public void insertOrder(UserOrderVO vo) {
		orderDAO.insertOrder(vo);
	}

	@Override
	public void insertOrderDetail(UserOrderDetailVO vo) {
		orderDAO.insertOrderDetail(vo);
	}

	@Override
	public void deleteAllCart(String user_id) {
		orderDAO.deleteAllCart(user_id);
	}

	@Override
	public UserOrderVO selectUserOrder(String user_id, String order_id) {
		return orderDAO.selectUserOrder(user_id, order_id);
	}

	@Override
	public void insertPayment(PaymentVO payment) {
		orderDAO.insertPayment(payment);
	}

	@Override
	public void updatePoint(UserOrderPointVO vo) {
		orderDAO.updatePoint(vo);
	}

	@Override
	public void insertOrderDetailDirect(UserOrderDetailVO vo) {
		orderDAO.insertOrderDetailDirect(vo);
	}

	@Override
	public void deleteInven(InvenVO inven) {
		orderDAO.deleteInven(inven);
	}

	@Override
	public List<UserOrderDetailVO> getIdQty(String order_id) {
		return orderDAO.getIdQty(order_id);
	}
	// Mypage에서 보여줄 주문 내역 가져오기
	@Override
	public List<MyInfoVO> getMyOrder(String user_id) {
		return orderDAO.getMyOrder(user_id);
	}
}