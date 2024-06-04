package com.shoppingmall.belleaf.review.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.review.dao.ReviewDAO;
import com.shoppingmall.belleaf.review.service.ReviewService;
import com.shoppingmall.belleaf.review.vo.ReviewVO;
import com.shoppingmall.belleaf.user.vo.MyInfoVO;


@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDAO;
	
	
	@Override
	public int adminReviewListCnt(String searchKeyword, String searchCondition, String prd_category) {
		return reviewDAO.adminReviewListCnt(searchKeyword, searchCondition, prd_category);
	}

	@Override
	public List<Map<String, Object>> adminReviewList(String searchKeyword, String searchCondition, String prd_category,
			String start, String end) {
		return reviewDAO.adminReviewList(searchKeyword, searchCondition, prd_category, start, end);
	}

	@Override
	public void ReviewDelete(ReviewVO review) {
		reviewDAO.ReviewDelete(review);
	}
	
	@Override
	public int productReviewCntSelectR(int product_id) {
		return reviewDAO.productReviewCntSelectR(product_id);
	}

	@Override
	public List<Map<String, Object>> productReviewSelectR(int product_id, int start, int end) {
		return reviewDAO.productReviewSelectR(product_id, start, end);
	}

	@Override
	public List<Map<String, Object>> productReviewSelectAll(int product_id) {
		return reviewDAO.productReviewSelectAll(product_id);
	}

	@Override
	public void updateReview(ReviewVO review) {
		reviewDAO.updateReview(review);
	}

	@Override
	public int existReview(MyInfoVO myinfo) {
		return reviewDAO.existReview(myinfo);
	}

	@Override
	public Map<String, Object> getMyOrderByori(MyInfoVO myinfo) {
		return reviewDAO.getMyOrderByori(myinfo);
	}
	// mypage - 리뷰 등록
	@Override
	public void insertReview(ReviewVO review) {
		reviewDAO.insertReview(review);
	}

	@Override
	public Map<String, Object> getReviewByReviewID(int review_id) {
		return reviewDAO.getReviewByReviewID(review_id);
	}

	@Override
	public List<Map<String, Object>> getMyReviewList(String user_id, String start, String end) {
		return reviewDAO.getMyReviewList(user_id, start, end);
	}

	@Override
	public int getMyReviewListCnt(String user_id) {
		return reviewDAO.getMyReviewListCnt(user_id);
	}
}
