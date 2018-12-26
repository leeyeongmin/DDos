package com.ddos.web.message.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.message.MessageVO;

@Repository
public class MessageMybatisDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 등록
	public void insertMessage(MessageVO vo) {
		System.out.println("my batis insertMessage() 기능 처리");
		mybatis.insert("message.insertMessage", vo);
	}

	public void updateMessage(MessageVO vo) {
		System.out.println("my batis updateMessage() 기능 처리");
		mybatis.update("message.updateMessage", vo);
	}

	// 리스트 조회
	public List<MessageVO> getMessageList(MessageVO vo) {
		System.out.println("my batis spring jdbc 다중 조회");
		return mybatis.selectList("message.getMessageList", vo);
	}
}
