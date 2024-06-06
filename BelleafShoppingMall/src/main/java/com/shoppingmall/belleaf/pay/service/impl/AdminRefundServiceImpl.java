package com.shoppingmall.belleaf.pay.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.pay.dao.AdminRefundDAO;
import com.shoppingmall.belleaf.pay.service.AdminRefundService;
import com.shoppingmall.belleaf.pay.vo.RefundTotalVO;

@Service("adminRefundService")
public class AdminRefundServiceImpl implements AdminRefundService{
	
	@Autowired
	private AdminRefundDAO adminRefundDAO;
	
	public AdminRefundServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<RefundTotalVO> adminRefundList() {
		// TODO Auto-generated method stub
		return adminRefundDAO.adminRefundList();
	}

	@Override
	public void adminDeletePoint(RefundTotalVO vo) {
		adminRefundDAO.adminDeletePoint(vo);
	}

	@Override
	public void adminUpdateStatus(RefundTotalVO vo) {
		adminRefundDAO.adminUpdateStatus(vo);
	}

	@Override
	public int adminCheckRefund(int refund_id) {
		return adminRefundDAO.adminCheckRefund(refund_id);
	}
	
}
