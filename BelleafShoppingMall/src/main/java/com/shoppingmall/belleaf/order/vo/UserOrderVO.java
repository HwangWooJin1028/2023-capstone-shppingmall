package com.shoppingmall.belleaf.order.vo;

import java.util.Date;

public class UserOrderVO {
	private String order_id;
	private String user_id;
	private Date order_date;
	private String order_addr;
	private String order_addr_d;
	private String order_zipcode;
	private String order_receiver;
	private String order_phone;
	private int order_total;
	private int user_status;
	
	public UserOrderVO() {
		// TODO Auto-generated constructor stub
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	@Override
	public String toString() {
		return "UserOrderVO [order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date
				+ ", order_addr=" + order_addr + ", order_addr_d=" + order_addr_d + ", order_zipcode=" + order_zipcode
				+ ", order_receiver=" + order_receiver + ", order_phone=" + order_phone + ", order_total=" + order_total
				+ ", user_status=" + user_status + "]";
	}
	
	
}
