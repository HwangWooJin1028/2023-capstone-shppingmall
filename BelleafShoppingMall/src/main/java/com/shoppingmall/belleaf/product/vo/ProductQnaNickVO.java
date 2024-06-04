package com.shoppingmall.belleaf.product.vo;

import java.util.Date;

public class ProductQnaNickVO {
	private int qna_id;
	private int product_id;
	private String user_id;
	private String user_nickname;
	private String qna_content;
	private String product_name;
	private int q_or_a;
	private int qna_group_number;
	private int qna_group;
	private Date product_qna_date;
	private int product_qna_state;
	
	
	public ProductQnaNickVO() {
		// TODO Auto-generated constructor stub
	}

	

	@Override
	public String toString() {
		return "ProductQnaNickVO [qna_id=" + qna_id + ", product_id=" + product_id + ", user_id=" + user_id
				+ ", user_nickname=" + user_nickname + ", qna_content=" + qna_content + ", product_name=" + product_name
				+ ", q_or_a=" + q_or_a + ", qna_group_number=" + qna_group_number + ", qna_group=" + qna_group
				+ ", product_qna_date=" + product_qna_date + ", product_qna_state=" + product_qna_state + "]";
	}



	public int getQna_id() {
		return qna_id;
	}

	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getQ_or_a() {
		return q_or_a;
	}

	public void setQ_or_a(int q_or_a) {
		this.q_or_a = q_or_a;
	}

	public int getQna_group_number() {
		return qna_group_number;
	}

	public void setQna_group_number(int qna_group_number) {
		this.qna_group_number = qna_group_number;
	}

	public int getQna_group() {
		return qna_group;
	}

	public void setQna_group(int qna_group) {
		this.qna_group = qna_group;
	}

	public Date getProduct_qna_date() {
		return product_qna_date;
	}

	public void setProduct_qna_date(Date product_qna_date) {
		this.product_qna_date = product_qna_date;
	}

	public int getProduct_qna_state() {
		return product_qna_state;
	}

	public void setProduct_qna_state(int product_qna_state) {
		this.product_qna_state = product_qna_state;
	}
	
	
}
