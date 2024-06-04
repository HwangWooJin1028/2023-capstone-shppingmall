package com.shoppingmall.belleaf.banner.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.shoppingmall.belleaf.banner.vo.*;
@Repository
public class BannerDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public BannerDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public List<BannerVO> SelectAllBannerList() {
		return mybatis.selectList("adminBannerDAO.SelectAllBannerList");
	}
	
	public List<BannerVO> SelectBannerList(String user_id) {
		return mybatis.selectList("adminBannerDAO.SelectBannerList", user_id);
	}
	
	public BannerVO SelectBannerOne(BannerVO banner) {
		return mybatis.selectOne("adminBannerDAO.SelectBannerOne", banner);
	}
	
	public void InsertBanner(BannerVO banner) {
		mybatis.insert("adminBannerDAO.InsertBanner", banner);
	}
	
	public void UpdateBanner(BannerVO banner) {
		mybatis.update("adminBannerDAO.UpdateBanner", banner);
	}
	
	public void DeleteBanner(BannerVO banner) {
		mybatis.delete("adminBannerDAO.DeleteBanner", banner);
	}
}
