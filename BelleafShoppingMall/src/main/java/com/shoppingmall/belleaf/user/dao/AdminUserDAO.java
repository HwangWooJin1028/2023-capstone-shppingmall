package com.shoppingmall.belleaf.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.user.UserVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class AdminUserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminUserDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public List<UserVO> adminSelectUserList() {
		return mybatis.selectList("AdminUserDAO.adminSelectUserList");
	}
	
	public UserVO adminSelectUser(UserVO user) {
		return mybatis.selectOne("AdminUserDAO.adminSelectUser", user);
	}
	
	public List<UserVO> adminSearchUserList(UserVO user) {
		return mybatis.selectList("AdminUserDAO.adminSearchUserList", user);
	}
	
	public void adminSleeperUser(UserVO user) {
		mybatis.update("AdminUserDAO.sleeperUser", user);
	}

	// admin User 목록 수 
	public int getAdminIFUserListCnt(String searchCondition, String searchKeyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		return mybatis.selectOne("AdminUserDAO.adminIFUserListCnt", map);
	}

	public List<Map<String, Object>> adminIFUserList(String searchCondition, String searchKeyword, String start, String end) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("AdminUserDAO.adminIFUserList", map);
	}
	
	// admin User 목록 수 
	public int ResentUserListCnt() {
		return mybatis.selectOne("AdminUserDAO.ResentUserListCnt");
	}

	public List<Map<String, Object>> ResentUserList(String start, String end) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("AdminUserDAO.ResentUserList", map);
	}
	
	
}
