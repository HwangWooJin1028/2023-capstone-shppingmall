package com.shoppingmall.belleaf.pay.vo;

import java.util.Date;

public class RefundTotalVO {
	//user_order
	private String order_id; // order id
	private String user_id;// 사용자 id
	private Date order_date; // 주문일자
	private String order_addr; // 주소
	private String order_addr_d; // 상세주소
	private String order_zipcode; // 우편번호
	private String order_receiver; // 수령인 
	private String order_phone; // 주문자 휴대폰 번호
	private int order_total; // 주문 총액
	private int user_status; // 주문 상태
	
	//USERORDER_DETAIL 테이블
	private int order_detail_id;
	private int user_order_cnt;
	private int product_id;
	
	//PRODUCT 테이블
	private String product_name;
	
	//USERORDER_REFUND 테이블
	private int refund_id;
	private String refund_reason;
	private int refund_status;
	private Date refund_date;
	private int refund_total;
	
	public RefundTotalVO(String order_id, String user_id, Date order_date, String order_addr, String order_addr_d,
			String order_zipcode, String order_receiver, String order_phone, int order_total, int user_status,
			int order_detail_id, int user_order_cnt, int product_id, String product_name, int refund_id,
			String refund_reason, int refund_status, Date refund_date, int refund_total) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.order_date = order_date;
		this.order_addr = order_addr;
		this.order_addr_d = order_addr_d;
		this.order_zipcode = order_zipcode;
		this.order_receiver = order_receiver;
		this.order_phone = order_phone;
		this.order_total = order_total;
		this.user_status = user_status;
		this.order_detail_id = order_detail_id;
		this.user_order_cnt = user_order_cnt;
		this.product_id = product_id;
		this.product_name = product_name;
		this.refund_id = refund_id;
		this.refund_reason = refund_reason;
		this.refund_status = refund_status;
		this.refund_date = refund_date;
		this.refund_total = refund_total;
	}

	@Override
	public String toString() {
		return "RefundTotalVO [order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date
				+ ", order_addr=" + order_addr + ", order_addr_d=" + order_addr_d + ", order_zipcode=" + order_zipcode
				+ ", order_receiver=" + order_receiver + ", order_phone=" + order_phone + ", order_total=" + order_total
				+ ", user_status=" + user_status + ", order_detail_id=" + order_detail_id + ", user_order_cnt="
				+ user_order_cnt + ", product_id=" + product_id + ", product_name=" + product_name + ", refund_id="
				+ refund_id + ", refund_reason=" + refund_reason + ", refund_status=" + refund_status + ", refund_date="
				+ refund_date + ", refund_total=" + refund_total + "]";
	}

	public RefundTotalVO() {
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
	public int getOrder_detail_id() {
		return order_detail_id;
	}
	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}
	public int getUser_order_cnt() {
		return user_order_cnt;
	}
	public void setUser_order_cnt(int user_order_cnt) {
		this.user_order_cnt = user_order_cnt;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getRefund_id() {
		return refund_id;
	}
	public void setRefund_id(int refund_id) {
		this.refund_id = refund_id;
	}
	public String getRefund_reason() {
		return refund_reason;
	}
	public void setRefund_reason(String refund_reason) {
		this.refund_reason = refund_reason;
	}
	public int getRefund_status() {
		return refund_status;
	}
	public void setRefund_status(int refund_status) {
		this.refund_status = refund_status;
	}
	public Date getRefund_date() {
		return refund_date;
	}
	public void setRefund_date(Date refund_date) {
		this.refund_date = refund_date;
	}
	public int getRefund_total() {
		return refund_total;
	}
	public void setRefund_total(int refund_total) {
		this.refund_total = refund_total;
	}
	
	
	
}
