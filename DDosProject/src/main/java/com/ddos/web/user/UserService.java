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
	public void deleteUser(UserVO vo);
	public List<UserVO> getInterestUserList(UserVO vo);
	public List<UserVO> getBlackUserList(UserVO vo);
	public List<UserVO> getNormalUserList(UserVO vo);
	
	public void extensionUser(UserVO vo);
}
