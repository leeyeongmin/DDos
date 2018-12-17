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

		// �쉶�썝 �떒嫄� 議고쉶
		public UserVO getUser(UserVO vo) {
			System.out.println("mybatis spring jdbc �떒嫄� 議고쉶 泥섎━");
			return mybatis.selectOne("user.getUser", vo);
		}
		//�쉶�썝 由ъ뒪�듃 議고쉶
		public List<UserVO> getUserList(UserVO vo) {
			return mybatis.selectList("user.getUserList", vo);
		}
		// �벑濡�
		public void insertUser(UserVO vo) {
			mybatis.update("user.insertUser", vo);										//namespace.id   �씠�젃寃� �뜥二쇰㈃ mapping瑜� �빐�꽌 �븯�뒗 寃쎌슦媛� �셿猷�
		}
		//ID 以묐났 泥댄겕
		public int checkId(UserVO vo) {
			return mybatis.selectOne("user.checkId", vo);
		}
		//ID 李얘린
		public UserVO findId(UserVO vo) {
			return mybatis.selectOne("user.findId", vo);
		}
		//Password 李얘린
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
		
}
