package com.shoppingmall.belleaf.product.vo;

import org.springframework.web.multipart.MultipartFile;

// 2024-04-05 ProductVO 작성 - Getter, Setter
public class ProductVO {
	
	// Product 내용
	private int product_id;
	private int category_code;
	private String product_name;
	private int product_price;
	private int product_stock;
	private String product_info;
	private double product_discount;
	private int product_state;
	private String product_pic;
	
	// Product Search
	private String searchCondition;
	private String searchKeyword;
	
	private MultipartFile picFile;
	private MultipartFile infoFile;
	
	// Product 생성자
	public ProductVO() {
		
	}
	
	public ProductVO(int _productId, int _categoryCode, String _productName, int _productPrice, int _productStock, 
			String _productInfo, double _productDiscount, int _productState, String _productPic) {
		this.product_id = _productId;
		this.category_code = _categoryCode;
		this.product_name = _productName;
		this.product_price = _productPrice;
		this.product_stock = _productStock;
		this.product_info = _productInfo;
		this.product_discount = _productDiscount;
		this.product_state = _productState;
		this.product_pic = _productPic;
	}
	
	public ProductVO(int _categoryCode, String _productName, int _productPrice, int _productStock, 
			String _productInfo, double _productDiscount, String _productPic) {
		this.category_code = _categoryCode;
		this.product_name = _productName;
		this.product_price = _productPrice;
		this.product_stock = _productStock;
		this.product_info = _productInfo;
		this.product_discount = _productDiscount;
		this.product_pic = _productPic;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public MultipartFile getPicFile() {
		return picFile;
	}

	public void setPicFile(MultipartFile picFile) {
		this.picFile = picFile;
	}

	public MultipartFile getInfoFile() {
		return infoFile;
	}

	public void setInfoFile(MultipartFile infoFile) {
		this.infoFile = infoFile;
	}

	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", category_code=" + category_code + ", product_name="
				+ product_name + ", product_price=" + product_price + ", product_stock=" + product_stock
				+ ", product_info=" + product_info + ", product_discount=" + product_discount + ", product_state="
				+ product_state + ", product_pic=" + product_pic + "]";
	}

}
