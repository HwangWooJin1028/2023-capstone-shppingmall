package com.shoppingmall.belleaf.user.service;

import javax.servlet.http.HttpSession;

import com.shoppingmall.belleaf.user.UserVO;

 
public interface UserService { 
 
	public UserVO getUser(UserVO vo);
	int insertUser(UserVO vo);
	public UserVO getPwd(UserVO vo);
	public UserVO getId(UserVO vo);
	int idCheck(String user_id);//유저 아이디 중복체크
	int passCheck(UserVO vo);//비밀번호 체크
	public void secession(UserVO vo, HttpSession session);
	void updateInfo(UserVO vo);//
	String userPWCheck(UserVO vo);
	
}
