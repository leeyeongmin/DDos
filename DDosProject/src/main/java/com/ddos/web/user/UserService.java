package com.ddos.web.user;



public interface UserService {
	
	public UserVO getUser(UserVO vo);
	public void insertUser(UserVO vo);
	public int checkId(UserVO vo);
	public UserVO findId(UserVO vo);
	public UserVO findPwd(UserVO vo);
}
