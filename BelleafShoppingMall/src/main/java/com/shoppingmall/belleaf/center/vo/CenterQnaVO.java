package com.shoppingmall.belleaf.center.vo;

import java.sql.Date;

public class CenterQnaVO {

	private int center_qna_id;//고객센터 문의 번호
	private String center_qna_content;//문의내용
	private String center_qna_title;//문의 제목
	private String user_id;//회원아이디
	private Date center_qna_date;//문의날짜
	
	
	
	
	public CenterQnaVO() {
		super();
	}
	




	public CenterQnaVO(int center_qna_id, String center_qua_content, String center_qna_title, String user_id,
			Date center_qna_date) {
		super();
		this.center_qna_id = center_qna_id;
		this.center_qna_content = center_qua_content;
		this.center_qna_title = center_qna_title;
		this.user_id = user_id;
		this.center_qna_date = center_qna_date;
	}




	public int getCenter_qna_id() {
		return center_qna_id;
	}




	public void setCenter_qna_id(int center_qna_id) {
		this.center_qna_id = center_qna_id;
	}




	public String getCenter_qna_content() {
		return center_qna_content;
	}




	public void setCenter_qna_content(String center_qua_content) {
		this.center_qna_content = center_qua_content;
	}




	public String getCenter_qna_title() {
		return center_qna_title;
	}




	public void setCenter_qna_title(String center_qna_title) {
		this.center_qna_title = center_qna_title;
	}




	public String getUser_id() {
		return user_id;
	}




	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}




	public Date getCenter_qna_date() {
		return center_qna_date;
	}




	public void setCenter_qna_date(Date center_qna_date) {
		this.center_qna_date = center_qna_date;
	}




	@Override
	public String toString() {
		return "CenterQnaVO [center_qna_id=" + center_qna_id + ", center_qua_content=" + center_qna_content
				+ ", center_qna_title=" + center_qna_title + ", user_id=" + user_id + ", center_qna_date="
				+ center_qna_date + "]";
	}
	
	
	
	
	
}
