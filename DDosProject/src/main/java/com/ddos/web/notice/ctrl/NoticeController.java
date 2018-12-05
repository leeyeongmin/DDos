package com.ddos.web.notice.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ddos.web.notice.NoticeService;
import com.ddos.web.notice.NoticeVO;

@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	
	// 전체 조회
	@RequestMapping(value= {"/getNoticeList"}, method = RequestMethod.GET)
	public String getNoticeList(Model model, NoticeVO vo) {
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "notice/getNoticeList";
	}
}
