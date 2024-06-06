package com.shoppingmall.belleaf.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.review.vo.ReviewVO;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;


@Repository
public class ReviewDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public int adminReviewListCnt(String searchKeyword, String searchCondition, String prd_category) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchKeyword", searchKeyword);
		map.put("searchCondition", searchCondition);
		map.put("prd_category", prd_category);
		return mybatis.selectOne("reviewDAO.adminReviewListCnt", map);
	}
	
	public List<Map<String, Object>> adminReviewList(String searchKeyword, String searchCondition, String prd_category, String start, String end) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchKeyword", searchKeyword);
		map.put("searchCondition", searchCondition);
		map.put("prd_category", prd_category);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("reviewDAO.adminReviewList", map);
	}
	
	public void ReviewDelete(ReviewVO review) {
		mybatis.delete("reviewDAO.ReviewDelete", review);
	}
	// 상품 상세 페이지 - 리뷰 총 개수 가져오기
	public int productReviewCntSelectR(int product_id) {
		return mybatis.selectOne("reviewDAO.productReviewCntSelectR", product_id);
	}
	
	// 상품 상세 페이지 - 페이징한 리뷰 리스트 가져오기
	public List<Map<String, Object>> productReviewSelectR(int product_id, int start, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("product_id", product_id);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("reviewDAO.productReviewSelectR", map);
	}
	
	// 전체 상품 리스트 가져오기
	public List<Map<String, Object>> productReviewSelectAll(int product_id) {
		return mybatis.selectList("reviewDAO.productReviewSelectAll", product_id);
	}

// mypage - 리뷰 수정
	public void updateReview(ReviewVO review) {
		mybatis.update("reviewDAO.updateReview", review);
	}
	
	// mypage - 리뷰가 있는지 확인
	public int existReview(MyInfoVO myinfo) {
		return mybatis.selectOne("reviewDAO.existReview", myinfo);
	}
	
	// mypage - order_detail_id로 myinfo(주문내역) 확인하기
	public Map<String, Object> getMyOrderByori(MyInfoVO myinfo) {
		return mybatis.selectOne("reviewDAO.getMyOrderByori", myinfo);
	}
	
	// mypage - 리뷰 등록
	public void insertReview(ReviewVO review) {
		mybatis.insert("reviewDAO.insertReview", review);
	}
	
	// mypage - review_id로 리뷰 조회(수정에 사용 
	public Map<String, Object> getReviewByReviewID(int review_id) {
		return mybatis.selectOne("reviewDAO.getReviewByReviewID", review_id);
	}
	
	// mypage - 나의 상품 리뷰 목록
	public List<Map<String,Object>> getMyReviewList(String user_id, String start, String end) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("reviewDAO.getMyReviewList", map);
				
	}
	
	// mypage - 나의 상품 목록 개수
	public int getMyReviewListCnt(String user_id) {
		return mybatis.selectOne("reviewDAO.getMyReviewListCnt", user_id);
	}
}
