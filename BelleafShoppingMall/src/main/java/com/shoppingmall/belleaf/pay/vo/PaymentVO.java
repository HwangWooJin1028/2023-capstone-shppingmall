package com.shoppingmall.belleaf.pay.vo;

public class PaymentVO {
	private String buyer_addr;
	private String buyer_name;
	private int buyer_postcode;
	private String buyer_tel;
	private String iamport_imp_uid;
	
	private String order_id;
	
	public PaymentVO() {
	}

	public PaymentVO(String buyer_addr, String buyer_name, int buyer_postcode, String buyer_tel, String iamport_imp_uid,
			String order_id) {
		super();
		this.buyer_addr = buyer_addr;
		this.buyer_name = buyer_name;
		this.buyer_postcode = buyer_postcode;
		this.buyer_tel = buyer_tel;
		this.iamport_imp_uid = iamport_imp_uid;
		this.order_id = order_id;
	}



	public String getBuyer_addr() {
		return buyer_addr;
	}

	public void setBuyer_addr(String buyer_addr) {
		this.buyer_addr = buyer_addr;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public int getBuyer_postcode() {
		return buyer_postcode;
	}

	public void setBuyer_postcode(int buyer_postcode) {
		this.buyer_postcode = buyer_postcode;
	}

	public String getBuyer_tel() {
		return buyer_tel;
	}

	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}

	public String getIamport_imp_uid() {
		return iamport_imp_uid;
	}

	public void setIamport_imp_uid(String iamport_imp_uid) {
		this.iamport_imp_uid = iamport_imp_uid;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	@Override
	public String toString() {
		return "PaymentVO [buyer_addr=" + buyer_addr + ", buyer_name=" + buyer_name + ", buyer_postcode="
				+ buyer_postcode + ", buyer_tel=" + buyer_tel + ", iamport_imp_uid=" + iamport_imp_uid + ", order_id="
				+ order_id + "]";
	}
	
}
