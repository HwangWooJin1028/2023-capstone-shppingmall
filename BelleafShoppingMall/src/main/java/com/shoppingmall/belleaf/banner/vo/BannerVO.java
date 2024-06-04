package com.shoppingmall.belleaf.banner.vo;

public class BannerVO {
	private int banner_id;
	private String user_id;
	private String banner_content;
	
	public BannerVO() {
		// TODO Auto-generated constructor stub
	}

	public BannerVO(int banner_id, String user_id, String banner_content) {
		super();
		this.banner_id = banner_id;
		this.user_id = user_id;
		this.banner_content = banner_content;
	}

	public int getBanner_id() {
		return banner_id;
	}

	public void setBanner_id(int banner_id) {
		this.banner_id = banner_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBanner_content() {
		return banner_content;
	}

	public void setBanner_content(String banner_content) {
		this.banner_content = banner_content;
	}

	@Override
	public String toString() {
		return "BannerVO [banner_id=" + banner_id + ", user_id=" + user_id + ", banner_content=" + banner_content
				+ ", banner_group_id=" + "]";
	}

}
