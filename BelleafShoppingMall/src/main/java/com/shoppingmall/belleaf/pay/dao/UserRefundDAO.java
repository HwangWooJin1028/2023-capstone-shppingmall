package com.shoppingmall.belleaf.pay.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.pay.vo.UserOrderRefundVO;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;

@Repository
public class UserRefundDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserRefundDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public int insertRefund(UserOrderRefundVO refund) {
		return mybatis.insert("userRefundDAO.insertRefund", refund);
	}
	
	public MyInfoVO getOrderInfo(MyInfoVO myinfo) {
		return mybatis.selectOne("userRefundDAO.getOrderInfo", myinfo);
	}
}
