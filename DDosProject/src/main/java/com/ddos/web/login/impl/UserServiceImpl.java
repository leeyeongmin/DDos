package com.ddos.web.login.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.login.UserService;
import com.ddos.web.login.UserVO;


@Service
public class UserServiceImpl implements UserService {
	
	/*@Autowired UserDAO dao;*/
	@Autowired UserDAOMybatis dao;
	
	public UserVO getUser(UserVO vo) {
		return dao.getUser(vo);
	}

	@Override
	public void insertUser(UserVO vo) {
		dao.insertUser(vo);
	}
}
