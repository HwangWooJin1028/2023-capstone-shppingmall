package com.shoppingmall.belleaf.pay.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.pay.vo.RefundTotalVO;



@Repository
public class AdminRefundDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 환불 요청 목록
	public List<RefundTotalVO> adminRefundList() {
		return mybatis.selectList("adminRefundDAO.adminRefundList");
	}
	
	// 포인트 차감
	public void adminDeletePoint(RefundTotalVO vo) {
		mybatis.update("adminRefundDAO.adminDeletePoint", vo);
	}
	
	// 환불 상태 변경
	public void adminUpdateStatus(RefundTotalVO vo) {
		mybatis.update("adminRefundDAO.adminUpdateStatus", vo);
	}
	
	// 환불 상태 확인
	public int adminCheckRefund(int refund_id) {
		return mybatis.selectOne("adminRefundDAO.adminCheckRefund", refund_id);
	}
}
