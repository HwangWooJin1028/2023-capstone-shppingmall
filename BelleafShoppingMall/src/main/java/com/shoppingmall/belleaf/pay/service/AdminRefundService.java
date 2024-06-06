package com.shoppingmall.belleaf.pay.service;

import java.util.List;

import com.shoppingmall.belleaf.pay.vo.RefundTotalVO;


public interface AdminRefundService {
	// 환불 요청 목록
	public List<RefundTotalVO> adminRefundList();
	
	// 포인트 차감
	public void adminDeletePoint(RefundTotalVO vo);
	
	// 환불 상태 변경
	public void adminUpdateStatus(RefundTotalVO vo);
	
	// 환불 상태 확인
	public int adminCheckRefund(int refund_id);
}
