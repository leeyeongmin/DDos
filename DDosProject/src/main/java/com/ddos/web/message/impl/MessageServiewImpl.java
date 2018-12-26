package com.ddos.web.message.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.message.MessageService;
import com.ddos.web.message.MessageVO;

@Service
public class MessageServiewImpl implements MessageService {
	@Autowired
	private MessageMybatisDAO dao;
	
	// 등록
	@Override
	public void insertMessage(MessageVO vo) {
		dao.insertMessage(vo);
	}
	
	// 수정
	@Override
	public void updateMessage(MessageVO vo) {
		dao.updateMessage(vo);
	}

	// 목록 조회
	@Override
	public List<MessageVO> getMessageList(MessageVO vo) {
		return dao.getMessageList(vo);
	}
}
