package com.ddos.web.message.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.message.MessageService;
import com.ddos.web.message.MessageVO;
import com.ddos.web.notice.NoticeVO;

@Controller
public class MessageController {
	@Autowired
	MessageService service;
	
		// 등록폼
		@RequestMapping("insertMessageform")
		public String insertNotice(Model model, MessageVO vo) {
			return "message/insertMessage";
		}
		
		// 등록 처리
		@RequestMapping("insertMessage")
		public String insertMessage(MessageVO vo) {
			service.insertMessage(vo);
			return "redirect:getUserList";	// 목록 요청
		}
		
		// 쪽지 리스트
		@RequestMapping("getMessageList")
		public String getMessageList(Model model, MessageVO vo) {
			model.addAttribute("messageList", service.getMessageList(vo));
			return "message/getMessageList";
		}
		
		// 수정 처리
		@RequestMapping("updateMessage")
		public String updateMessage(MessageVO vo) {
			service.updateMessage(vo);
			return "redirect:getUserList";
		}
}
