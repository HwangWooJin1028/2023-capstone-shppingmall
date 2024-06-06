package com.shoppingmall.belleaf.review.vo;

public class ReviewVO {
	private int review_id;
	private int order_detail_id;
	private String review_content;
	private int review_grade;
	
	public ReviewVO() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "ReviewVO [review_id=" + review_id + ", order_detail_id=" + order_detail_id + ", review_content="
				+ review_content + ", review_grade=" + review_grade + "]";
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public int getOrder_detail_id() {
		return order_detail_id;
	}

	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_grade() {
		return review_grade;
	}

	public void setReview_grade(int review_grade) {
		this.review_grade = review_grade;
	}
	
	
}
