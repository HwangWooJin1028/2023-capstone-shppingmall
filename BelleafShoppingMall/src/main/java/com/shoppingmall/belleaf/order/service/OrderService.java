package com.shoppingmall.belleaf.order.service;

import java.util.List;

import com.shoppingmall.belleaf.inven.vo.InvenVO;
import com.shoppingmall.belleaf.order.vo.UserOrderDetailVO;
import com.shoppingmall.belleaf.order.vo.UserOrderVO;
import com.shoppingmall.belleaf.pay.vo.PaymentVO;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;
import com.shoppingmall.belleaf.user.vo.UserOrderPointVO;

public interface OrderService {

	public void insertOrder(UserOrderVO vo);
	
	public void insertOrderDetail(UserOrderDetailVO vo);
	
	public void deleteAllCart(String user_id);
	
	public UserOrderVO selectUserOrder(String user_id, String order_id);
	
	public void insertPayment(PaymentVO payment);
	
	public void updatePoint(UserOrderPointVO vo);
	
	public void insertOrderDetailDirect(UserOrderDetailVO vo);
	
	public void deleteInven(InvenVO inven);
	
	public List<UserOrderDetailVO> getIdQty(String order_id);

	// Mypage에서 보여줄 주문 내역 가져오기
	public List<MyInfoVO> getMyOrder(String user_id);
}
