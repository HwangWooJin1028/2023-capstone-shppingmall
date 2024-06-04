package com.shoppingmall.belleaf.user.dao;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.user.UserVO;

 
@Repository//클래스 데이터의 저장소 역할을 한다는 의미
public class UserDAO { 
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserDAO() {
		System.out.println("UserDAO()객체생성");
	}
	
	//User 데이터 한명 조회(로그인 시사용)
	public UserVO getUser(UserVO vo)
	{
		System.out.println("myBatis사용 getUser()실행");
		return mybatis.selectOne("userDAO.getUser",vo);
	}
	
	//user insert(회원가입시사용)
	public int insertUser(UserVO vo) {
		System.out.println("mybatis사용insertUser");
		return mybatis.insert("userDAO.insertUser",vo);
	}
	
	//id찾기
	public UserVO getId(UserVO vo) {
		System.out.println("vo : " + vo);
		return mybatis.selectOne("userDAO.getId", vo);
	}
	
	public UserVO getPwd(UserVO vo) {
		return mybatis.selectOne("userDAO.getPwd", vo);
	}
	
	public int idCheck(String user_id){//유저 아이디 중복 체크
		System.out.println("vo"+user_id);
		int result=mybatis.selectOne("userDAO.idcheck",user_id);
		return result;
	}
	
		
	// 회원 탈퇴
	public void secession(UserVO vo) {
		mybatis.update("userDAO.secession", vo);
	}
	
	// 회원 정보 수정
	public void updateUserInfo(UserVO user) {
		mybatis.update("userDAO.updateUserInfo", user);
	}
	
	// 아이디에 해당하는 비번 찾기
	public String userPWcheck(UserVO user) {
		return mybatis.selectOne("userDAO.userPWcheck", user);
	}
	
	// 비번으로 사용자 찾기
	public UserVO getUserByIdPw(UserVO user) {
		return mybatis.selectOne("userDAO.getUserByIdPw", user);
	}
}
