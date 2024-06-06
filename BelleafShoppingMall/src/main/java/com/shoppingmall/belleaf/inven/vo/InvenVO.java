package com.shoppingmall.belleaf.inven.vo;

public class InvenVO {
	private int product_id;
	private int inven_in;
	private int inven_out;
	private int inven_stock;
	
	public InvenVO() {
		// TODO Auto-generated constructor stub
	}

	
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getInven_in() {
		return inven_in;
	}

	public void setInven_in(int inven_in) {
		this.inven_in = inven_in;
	}

	public int getInven_out() {
		return inven_out;
	}

	public void setInven_out(int inven_out) {
		this.inven_out = inven_out;
	}

	public int getInven_stock() {
		return inven_stock;
	}

	public void setInven_stock(int inven_stock) {
		this.inven_stock = inven_stock;
	}

	@Override
	public String toString() {
		return "InvenVO [product_id=" + product_id + ", inven_in=" + inven_in + ", inven_out=" + inven_out
				+ ", inven_stock=" + inven_stock + "]";
	}
	
	

}
