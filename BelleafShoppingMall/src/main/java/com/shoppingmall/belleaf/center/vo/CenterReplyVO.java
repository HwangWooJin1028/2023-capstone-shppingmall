package com.shoppingmall.belleaf.center.vo;

import oracle.sql.DATE;

public class CenterReplyVO {
	
	private int center_reply_id;//고객센터 답변번호
	private String reply_content;//고객센터 답변내요
	private int center_qna_id;//고객센터 문의번호
	private DATE center_reply_date;//고객센터답변날짜
	

	

	public CenterReplyVO() {
		super();
	}


	public CenterReplyVO(int center_reply_id, String reply_content, int center_qna_id, DATE center_reply_date) {
		super();
		this.center_reply_id = center_reply_id;
		this.reply_content = reply_content;
		this.center_qna_id = center_qna_id;
		this.center_reply_date = center_reply_date;
	}


	public int getCenter_reply_id() {
		return center_reply_id;
	}

	public void setCenter_reply_id(int center_reply_id) {
		this.center_reply_id = center_reply_id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public int getCenter_qna_id() {
		return center_qna_id;
	}

	public void setCenter_qna_id(int center_qna_id) {
		this.center_qna_id = center_qna_id;
	}

	public DATE getCenter_reply_date() {
		return center_reply_date;
	}

	public void setCenter_reply_date(DATE center_reply_date) {
		this.center_reply_date = center_reply_date;
	}


	@Override
	public String toString() {
		return "CenterReplyVO [center_reply_id=" + center_reply_id + ", reply_content=" + reply_content
				+ ", center_qna_id=" + center_qna_id + ", center_reply_date=" + center_reply_date + "]";
	}
	
	
	
	
	
	
}
