package com.shoppingmall.belleaf.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shoppingmall.belleaf.user.UserVO;


public interface AdminUserService {
	
	public List<UserVO> adminSelectUserList();
	
	public UserVO adminSelectUser(UserVO user);
	
	public List<UserVO> adminSearchUserList(UserVO user);
	
	public void adminSleeperUser(UserVO user);
	
	public int getAdminIFUserListCnt(String searchCondition, String searchKeyword);
	
	public List<Map<String, Object>> adminIFUserList(String searchCondition, String searchKeyword, String start, String end);
	public int ResentUserListCnt();
	public List<Map<String, Object>> ResentUserList(String start, String end);
}