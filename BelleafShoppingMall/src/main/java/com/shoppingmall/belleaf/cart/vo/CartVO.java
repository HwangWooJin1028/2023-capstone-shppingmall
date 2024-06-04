package com.shoppingmall.belleaf.cart.vo;

public class CartVO {
	private int cart_id;
	private String user_id;
	private String n_user_id;
	private int cart_product_qty;
	private int product_id;
	
	private String user_pw;
	private String user_name;
	private String user_nickname;
	private String user_email;
	private int user_grade;//유저 등급
	private int user_point;//유저 포인트
	private String user_addr;//유저 주소
	private String user_addr_d;//유저 상세주소
	private String user_zipcode;//우편번호
	private int user_state;//회원상태
	private String user_phone;
	
	private int category_code;
	private String product_name;
	private int product_price;
	private int product_stock;
	private String product_info;
	private double product_discount;
	private int product_state;
	private String product_pic;
	
	public CartVO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "CartVO [cart_id=" + cart_id + ", user_id=" + user_id + ", n_user_id=" + n_user_id
				+ ", cart_product_qty=" + cart_product_qty + ", product_id=" + product_id + ", user_pw=" + user_pw
				+ ", user_name=" + user_name + ", user_nickname=" + user_nickname + ", user_email=" + user_email
				+ ", user_grade=" + user_grade + ", user_point=" + user_point + ", user_addr=" + user_addr
				+ ", user_addr_d=" + user_addr_d + ", user_zipcode=" + user_zipcode + ", user_state=" + user_state
				+ ", user_phone=" + user_phone + ", category_code=" + category_code + ", product_name=" + product_name
				+ ", product_price=" + product_price + ", product_stock=" + product_stock + ", product_info="
				+ product_info + ", product_discount=" + product_discount + ", product_state=" + product_state
				+ ", product_pic=" + product_pic + "]";
	}
	
	public CartVO(int cart_id, String user_id, String n_user_id, int cart_product_qty, int product_id, String user_pw,
			String user_name, String user_nickname, String user_email, int user_grade, int user_point, String user_addr,
			String user_addr_d, String user_zipcode, int user_state, String user_phone, int category_code,
			String product_name, int product_price, int product_stock, String product_info, double product_discount,
			int product_state, String product_pic) {
		super();
		this.cart_id = cart_id;
		this.user_id = user_id;
		this.n_user_id = n_user_id;
		this.cart_product_qty = cart_product_qty;
		this.product_id = product_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
		this.user_email = user_email;
		this.user_grade = user_grade;
		this.user_point = user_point;
		this.user_addr = user_addr;
		this.user_addr_d = user_addr_d;
		this.user_zipcode = user_zipcode;
		this.user_state = user_state;
		this.user_phone = user_phone;
		this.category_code = category_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_info = product_info;
		this.product_discount = product_discount;
		this.product_state = product_state;
		this.product_pic = product_pic;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getN_user_id() {
		return n_user_id;
	}

	public void setN_user_id(String n_user_id) {
		this.n_user_id = n_user_id;
	}

	public int getCart_product_qty() {
		return cart_product_qty;
	}

	public void setCart_product_qty(int cart_product_qty) {
		this.cart_product_qty = cart_product_qty;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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

	public String getProduct_pic() {
		return product_pic;
	}

	public void setProduct_pic(String product_pic) {
		this.product_pic = product_pic;
	}
	
	
	
}
