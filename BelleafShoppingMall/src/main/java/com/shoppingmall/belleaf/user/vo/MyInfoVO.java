package com.shoppingmall.belleaf.user.vo;

import java.util.Date;

public class MyInfoVO {
	
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
	private int category_code;
	private String product_name;
	private int product_price;
	private int product_stock;
	private String product_info;
	private double product_discount;
	private int product_state;
	
	//USERORDER_REFUND 테이블
	private int refund_id;
	private String refund_reason;
	private int refund_status;
	private Date refund_date;
	private int refund_total;
	
	public MyInfoVO() {
		// TODO Auto-generated constructor stub
	}
	
	// 생성자
	public MyInfoVO(String order_id, String user_id, Date order_date, String order_addr, String order_addr_d,
			String order_zipcode, String order_receiver, String order_phone, int order_total, int user_status,
			int order_detail_id, int product_id, int user_order_cnt, int refund_id, String refund_reason,
			int refund_status, Date refunc_date, int refund_total, int category_code, String product_name,
			int product_price, int product_stock, String product_info, double product_discount, int product_state) {
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
		this.product_id = product_id;
		this.user_order_cnt = user_order_cnt;
		this.refund_id = refund_id;
		this.refund_reason = refund_reason;
		this.refund_status = refund_status;
		this.refund_date = refunc_date;
		this.refund_total = refund_total;
		this.category_code = category_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_info = product_info;
		this.product_discount = product_discount;
		this.product_state = product_state;
	}

	// to string
	@Override
	public String toString() {
		return "MyInfo [order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date + ", order_addr="
				+ order_addr + ", order_addr_d=" + order_addr_d + ", order_zipcode=" + order_zipcode
				+ ", order_receiver=" + order_receiver + ", order_phone=" + order_phone + ", order_total=" + order_total
				+ ", user_status=" + user_status + ", order_detail_id=" + order_detail_id + ", product_id=" + product_id
				+ ", user_order_cnt=" + user_order_cnt + ", refund_id=" + refund_id + ", refund_reason=" + refund_reason
				+ ", refund_status=" + refund_status + ", refunc_date=" + refund_date + ", refund_total=" + refund_total
				+ ", category_code=" + category_code + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_stock=" + product_stock + ", product_info=" + product_info
				+ ", product_discount=" + product_discount + ", product_state=" + product_state + "]";
	}
	
	// get && set
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
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getUser_order_cnt() {
		return user_order_cnt;
	}
	public void setUser_order_cnt(int user_order_cnt) {
		this.user_order_cnt = user_order_cnt;
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
	public void setRefund_date(Date refunc_date) {
		this.refund_date = refunc_date;
	}
	public int getRefund_total() {
		return refund_total;
	}
	public void setRefund_total(int refund_total) {
		this.refund_total = refund_total;
	}
	public int getCategory_code() {
		return category_code;
	}
	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	public double getProduct_discount() {
		return product_discount;
	}
	public void setProduct_discount(double product_discount) {
		this.product_discount = product_discount;
	}
	public int getProduct_state() {
		return product_state;
	}
	public void setProduct_state(int product_state) {
		this.product_state = product_state;
	}
}
