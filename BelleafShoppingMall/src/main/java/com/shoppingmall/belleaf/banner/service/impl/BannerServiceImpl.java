package com.shoppingmall.belleaf.banner.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.banner.dao.BannerDAO;
import com.shoppingmall.belleaf.banner.service.BannerService;
import com.shoppingmall.belleaf.banner.vo.BannerVO;

@Service("bannerService")
public class BannerServiceImpl implements BannerService{
	
	@Autowired
	private BannerDAO bannerDAO;
	
	public BannerServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public List<BannerVO> SelectBannerList(String user_id) {
		return bannerDAO.SelectBannerList(user_id);
	}

	@Override
	public BannerVO SelectBannerOne(BannerVO banner) {
		return bannerDAO.SelectBannerOne(banner);
	}

	@Override
	public void InsertBanner(BannerVO banner) {
		bannerDAO.InsertBanner(banner);
	}

	@Override
	public void UpdateBanner(BannerVO banner) {
		bannerDAO.UpdateBanner(banner);
	}

	@Override
	public void DeleteBanner(BannerVO banner) {
		bannerDAO.DeleteBanner(banner);		
	}

	@Override
	public List<BannerVO> SelectAllBannerList() {
		return bannerDAO.SelectAllBannerList();
	}

}
