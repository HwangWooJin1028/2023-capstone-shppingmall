package com.shoppingmall.belleaf.user.service;

import javax.servlet.http.HttpSession;

import com.shoppingmall.belleaf.user.UserVO;

 
public interface UserJoinService { 
 
	//
	int insertUser(UserVO vo);
	int idCheck(String user_id);//유저 아이디 중복체크
	int passCheck(UserVO vo);//비밀번호 체크
	
	// 회원 탈퇴
	public void secession(UserVO vo);
	
	// 회원 정보 수정
	public void updateUserInfo(UserVO user);
	
	// 아이디에 해당하는 비번 찾기
	public String userPWcheck(UserVO user);
	
	// 비번으로 사용자 찾기
	public UserVO getUserByIdPw(UserVO user);
}
