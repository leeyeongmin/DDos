package com.ddos.web.login;

import java.util.List;


public interface UserService {
	
	public UserVO getUser(UserVO vo);
	public void insertUser(UserVO vo);
}
