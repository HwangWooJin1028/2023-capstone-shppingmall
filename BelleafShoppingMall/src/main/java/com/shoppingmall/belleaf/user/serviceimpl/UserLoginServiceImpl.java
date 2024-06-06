package com.shoppingmall.belleaf.user.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.user.UserVO;
import com.shoppingmall.belleaf.user.dao.UserDAO;
import com.shoppingmall.belleaf.user.service.UserLoginService;


@Service("userLoginService")
public class UserLoginServiceImpl implements UserLoginService{

	@Autowired
	private UserDAO userDAO;
	
	public UserLoginServiceImpl() {
		System.out.println("UserLoginServiceImpl()객체 생성");
	}
	@Override
	public UserVO getUser(UserVO vo) {
		
		return userDAO.getUser(vo);
	}

	@Override
	public UserVO getId(UserVO vo) {

		return userDAO.getId(vo);
	}

	@Override
	public UserVO getpwd(UserVO vo) {
		
		return userDAO.getPwd(vo);
	}

	
}
