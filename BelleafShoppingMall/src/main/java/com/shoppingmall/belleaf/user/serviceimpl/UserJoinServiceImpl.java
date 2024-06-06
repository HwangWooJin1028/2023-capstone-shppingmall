package com.shoppingmall.belleaf.user.serviceimpl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.user.UserVO;
import com.shoppingmall.belleaf.user.dao.UserDAO;
import com.shoppingmall.belleaf.user.service.UserJoinService;


@Service("userJoinService")
public class UserJoinServiceImpl implements UserJoinService {

		@Autowired
		private UserDAO userDAO;
	
		@Override
	public int insertUser(UserVO vo) {
		System.out.println("userjoinserviceimpl()객체생성");
		return userDAO.insertUser(vo);
	}

	@Override
	public  int idCheck(String user_id) {
		
		int result= userDAO.idCheck(user_id);
		return result;
	}

	@Override
	public int passCheck(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void secession(UserVO vo) {
		userDAO.secession(vo);
	}

	@Override
	public void updateUserInfo(UserVO user) {
		userDAO.updateUserInfo(user);
	}

	@Override
	public String userPWcheck(UserVO user) {
		return userDAO.userPWcheck(user);
	}

	@Override
	public UserVO getUserByIdPw(UserVO user) {
		return userDAO.getUserByIdPw(user);
	}

	

}
