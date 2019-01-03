package com.ddos.web.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.user.UserService;
import com.ddos.web.user.UserVO;


@Service
public class UserServiceImpl implements UserService {
	
	/*@Autowired UserDAO dao;*/
	@Autowired UserDAOMybatis dao;
	
	public UserVO getUser(UserVO vo) {
		return dao.getUser(vo);
	}
	
	public List<UserVO> getUserList(UserVO vo){
		return dao.getUserList(vo);
	}

	@Override
	public void insertUser(UserVO vo) {
		dao.insertUser(vo);
	}

	@Override
	public int checkId(UserVO vo) {
		return dao.checkId(vo);
	}

	@Override
	public UserVO findId(UserVO vo) {
		return dao.findId(vo);
	}

	@Override
	public UserVO findPwd(UserVO vo) {
		return dao.findPwd(vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		dao.updateUser(vo);
		
	}

	@Override
	public void deleteUser(UserVO vo) {
		dao.deleteUser(vo);
	}

	@Override
	public List<UserVO> getInterestUserList(UserVO vo) {
		return dao.getIUserList(vo);
	}

	@Override
	public List<UserVO> getBlackUserList(UserVO vo) {
		return dao.getBUserList(vo);
	}

	@Override
	public List<UserVO> getNormalUserList(UserVO vo) {
		return dao.getNUserList(vo);
	}

	@Override
	public void extensionUser(UserVO vo) {
		// TODO Auto-generated method stub
		dao.extensionUser(vo);
	}
}
