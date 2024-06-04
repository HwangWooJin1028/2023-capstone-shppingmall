package com.shoppingmall.belleaf.banner.service;

import java.util.List;

import com.shoppingmall.belleaf.banner.vo.BannerVO;

public interface BannerService {
	public List<BannerVO> SelectAllBannerList();
	
	public List<BannerVO> SelectBannerList(String user_id);
	
	public BannerVO SelectBannerOne(BannerVO banner);
	
	public void InsertBanner(BannerVO banner);
	
	public void UpdateBanner(BannerVO banner);
	
	public void DeleteBanner(BannerVO banner);

}
