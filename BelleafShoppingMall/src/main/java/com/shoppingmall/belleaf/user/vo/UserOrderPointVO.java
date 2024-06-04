package com.shoppingmall.belleaf.user.vo;

import java.util.Date;

public class UserOrderPointVO {
	
	// user테이블
	private String user_id;//아이디
	private String user_pw;//비밀번호
	private String user_name;//유저이름
	private String user_nickname;//유저 닉네임
	private String user_email;//유저 이메일
	private int user_grade;//유저 등급
	private int user_point;//유저 포인트
	private String user_addr;//유저 주소
	private String user_addr_d;//유저 상세주소
	private String user_zipcode;//우편번호
	private int user_state;//회원상태
	private String user_phone;
	
	// userOrder 테이블
	private String order_id;
	private Date order_date;
	private String order_addr;
	private String order_addr_d;
	private String order_zipcode;
	private String order_receiver;
	private String order_phone;
	private int order_total;
	private int user_status;
	
	public UserOrderPointVO() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "UserOrderPointVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name
				+ ", user_nickname=" + user_nickname + ", user_email=" + user_email + ", user_grade=" + user_grade
				+ ", user_point=" + user_point + ", user_addr=" + user_addr + ", user_addr_d=" + user_addr_d
				+ ", user_zipcode=" + user_zipcode + ", user_state=" + user_state + ", user_phone=" + user_phone
				+ ", order_id=" + order_id + ", order_date=" + order_date + ", order_addr=" + order_addr
				+ ", order_addr_d=" + order_addr_d + ", order_zipcode=" + order_zipcode + ", order_receiver="
				+ order_receiver + ", order_phone=" + order_phone + ", order_total=" + order_total + ", user_status="
				+ user_status + "]";
	}



	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getUser_grade() {
		return user_grade;
	}

	public void setUser_grade(int user_grade) {
		this.user_grade = user_grade;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_addr_d() {
		return user_addr_d;
	}

	public void setUser_addr_d(String user_addr_d) {
		this.user_addr_d = user_addr_d;
	}

	public String getUser_zipcode() {
		return user_zipcode;
	}

	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}

	public int getUser_state() {
		return user_state;
	}

	public void setUser_state(int user_state) {
		this.user_state = user_state;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getOrder_addr() {
		return order_addr;
	}

	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}

	public String getOrder_addr_d() {
		return order_addr_d;
	}

	public void setOrder_addr_d(String order_addr_d) {
		this.order_addr_d = order_addr_d;
	}

	public String getOrder_zipcode() {
		return order_zipcode;
	}

	public void setOrder_zipcode(String order_zipcode) {
		this.order_zipcode = order_zipcode;
	}

	public String getOrder_receiver() {
		return order_receiver;
	}

	public void setOrder_receiver(String order_receiver) {
		this.order_receiver = order_receiver;
	}

	public String getOrder_phone() {
		return order_phone;
	}

	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}

	public int getOrder_total() {
		return order_total;
	}

	public void setOrder_total(int order_total) {
		this.order_total = order_total;
	}

	public int getUser_status() {
		return user_status;
	}

	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}
	
}
