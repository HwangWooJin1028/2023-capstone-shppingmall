package com.shoppingmall.belleaf.user.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.user.UserVO;
import com.shoppingmall.belleaf.user.dao.AdminUserDAO;
import com.shoppingmall.belleaf.user.service.AdminUserService;


@Service("adminUserService")
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired
	private AdminUserDAO adminUserDAO;

	@Override
	public List<UserVO> adminSelectUserList() {
		return adminUserDAO.adminSelectUserList();
	}

	@Override
	public UserVO adminSelectUser(UserVO user) {
		// TODO Auto-generated method stub
		return adminUserDAO.adminSelectUser(user);
	}

	@Override
	public List<UserVO> adminSearchUserList(UserVO user) {
		// TODO Auto-generated method stub
		return adminUserDAO.adminSearchUserList(user);
	}

	@Override
	public void adminSleeperUser(UserVO user) {
		// TODO Auto-generated method stub
		adminUserDAO.adminSleeperUser(user);
	}

	@Override
	public int getAdminIFUserListCnt(String searchCondition, String searchKeyword) {
		return adminUserDAO.getAdminIFUserListCnt(searchCondition, searchKeyword);
	}

	@Override
	public List<Map<String, Object>> adminIFUserList(String searchCondition, String searchKeyword, String start,
			String end) {
		return adminUserDAO.adminIFUserList(searchCondition, searchKeyword, start, end);
	}

	@Override
	public int ResentUserListCnt() {
		// TODO Auto-generated method stub
		return adminUserDAO.ResentUserListCnt();
	}

	@Override
	public List<Map<String, Object>> ResentUserList(String start, String end) {
		// TODO Auto-generated method stub
		return adminUserDAO.ResentUserList(start, end);
	}

}
