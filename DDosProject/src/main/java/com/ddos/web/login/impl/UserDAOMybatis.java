package com.ddos.web.login.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.login.UserVO;


@Repository
public class UserDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

		// 단건 조회
		public UserVO getUser(UserVO vo) {
			System.out.println("mybatis spring jdbc 단건 조회 처리");
			return mybatis.selectOne("user.getUser", vo);
		}
		
		// 등록
		public void insertUser(UserVO vo) {
			System.out.println("mybatis spring jdbc insert 처리");
			mybatis.update("user.insertUser", vo);										//namespace.id   이렇게 써주면 mapping를 해서 하는 경우가 완료
		}
		
}
