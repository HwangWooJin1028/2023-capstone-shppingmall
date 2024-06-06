package com.shoppingmall.belleaf.user.service;

import com.shoppingmall.belleaf.user.UserVO;

public interface UserLoginService {

	UserVO getUser(UserVO vo);
	UserVO getId(UserVO vo);
	UserVO getpwd(UserVO vo);
}
