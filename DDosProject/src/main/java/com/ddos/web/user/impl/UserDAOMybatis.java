package com.ddos.web.user.impl;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.user.UserVO;


@Repository
public class UserDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

		public UserVO getUser(UserVO vo) {
			System.out.println("mybatis spring jdbc �떒嫄� 議고쉶 泥섎━");
			return mybatis.selectOne("user.getUser", vo);
		}
		public List<UserVO> getUserList(UserVO vo) {
			return mybatis.selectList("user.getUserList", vo);
		}
		public void insertUser(UserVO vo) {
			mybatis.update("user.insertUser", vo);
		}
		public int checkId(UserVO vo) {
			return mybatis.selectOne("user.checkId", vo);
		}
		public UserVO findId(UserVO vo) {
			return mybatis.selectOne("user.findId", vo);
		}
		public UserVO findPwd(UserVO vo) {
			return mybatis.selectOne("user.findPwd", vo);
		}
		public void updateUser(UserVO vo) {
			mybatis.update("user.updateUser",vo);
		}
		public void deleteUser(UserVO vo) {
			mybatis.delete("user.deleteUser",vo);
			
		}
		public List<UserVO> getIUserList(UserVO vo) {
			return mybatis.selectList("user.getIUserList", vo);
		}
		public List<UserVO> getBUserList(UserVO vo) {
			return mybatis.selectList("user.getBUserList", vo);
		}
		public List<UserVO> getNUserList(UserVO vo) {
			return mybatis.selectList("user.getNUserList", vo);
		}
		
}
