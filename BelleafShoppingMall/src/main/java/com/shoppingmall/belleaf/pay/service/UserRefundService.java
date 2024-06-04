package com.shoppingmall.belleaf.pay.service;

import com.shoppingmall.belleaf.pay.vo.UserOrderRefundVO;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;

public interface UserRefundService {
	public int insertRefund(UserOrderRefundVO refund);
	
	public MyInfoVO getOrderInfo(MyInfoVO myinfo);
}
