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

		// 회원 단건 조회
		public UserVO getUser(UserVO vo) {
			System.out.println("mybatis spring jdbc 단건 조회 처리");
			return mybatis.selectOne("user.getUser", vo);
		}
		//회원 리스트 조회
		public List<UserVO> getUserList(UserVO vo) {
			return mybatis.selectList("user.getUserList", vo);
		}
		// 등록
		public void insertUser(UserVO vo) {
			System.out.println("mybatis spring jdbc insert 처리");
			mybatis.update("user.insertUser", vo);										//namespace.id   이렇게 써주면 mapping를 해서 하는 경우가 완료
		}
		//ID 중복 체크
		public int checkId(UserVO vo) {
			return mybatis.selectOne("user.checkId", vo);
		}
		//ID 찾기
		public UserVO findId(UserVO vo) {
			return mybatis.selectOne("user.findId", vo);
		}
		//Password 찾기
		public UserVO findPwd(UserVO vo) {
			return mybatis.selectOne("user.findPwd", vo);
		}
		
}
