package com.shoppingmall.belleaf.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shoppingmall.belleaf.review.vo.ReviewVO;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;


public interface ReviewService {
	public int adminReviewListCnt(String searchKeyword, String searchCondition, String prd_category);
	
	public List<Map<String, Object>> adminReviewList(String searchKeyword, String searchCondition, String prd_category, String start, String end);
	
	public void ReviewDelete(ReviewVO review);
	
	// 상품 상세 페이지 - 리뷰 총 개수 가져오기
	public int productReviewCntSelectR(int product_id);
	
	// 상품 상세 페이지 - 페이징한 리뷰 리스트 가져오기
	public List<Map<String, Object>> productReviewSelectR(int product_id, int start, int end);
	// 전체 상품 리스트 가져오기
	public List<Map<String, Object>> productReviewSelectAll(int product_id);
	
	// mypage - 리뷰 수정
	public void updateReview(ReviewVO review);
	
	// mypage - 리뷰가 있는지 확인
	public int existReview(MyInfoVO myinfo);
	
	// mypage - order_detail_id로 myinfo(주문내역) 확인하기
	public Map<String, Object> getMyOrderByori(MyInfoVO myinfo);
	
	// mypage - 리뷰 등록
	public void insertReview(ReviewVO review);
	
	// mypage - review_id로 리뷰 조회(수정에 사용 
	public Map<String, Object> getReviewByReviewID(int review_id);
	
	// mypage - 나의 상품 리뷰 목록
	public List<Map<String,Object>> getMyReviewList(String user_id, String start, String end);
	
	// mypage - 나의 상품 목록 개수
	public int getMyReviewListCnt(String user_id);
}
