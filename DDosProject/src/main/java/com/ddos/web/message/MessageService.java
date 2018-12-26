package com.ddos.web.message;

import java.util.List;

public interface MessageService {
	public void insertMessage(MessageVO vo);
	public void updateMessage(MessageVO vo);
	public List<MessageVO> getMessageList(MessageVO vo);
	
}
