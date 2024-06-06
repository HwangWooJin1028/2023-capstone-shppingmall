package com.shoppingmall.belleaf.pay.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.pay.dao.UserRefundDAO;
import com.shoppingmall.belleaf.pay.service.UserRefundService;
import com.shoppingmall.belleaf.pay.vo.UserOrderRefundVO;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;

@Service("userRefundService")
public class UserRefundServiceImpl implements UserRefundService{
	@Autowired
	private UserRefundDAO userRefundDAO;
	
	public UserRefundServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public int insertRefund(UserOrderRefundVO refund) {
		return userRefundDAO.insertRefund(refund);
	}

	@Override
	public MyInfoVO getOrderInfo(MyInfoVO myinfo) {
		return userRefundDAO.getOrderInfo(myinfo);
	}

}
