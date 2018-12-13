package com.ddos.web.user;

import java.util.List;

public interface UserService {
	
	public UserVO getUser(UserVO vo);
	public void insertUser(UserVO vo);
	public int checkId(UserVO vo);
	public UserVO findId(UserVO vo);
	public UserVO findPwd(UserVO vo);
	public List<UserVO> getUserList(UserVO vo);
	public void updateUser(UserVO vo);
}
