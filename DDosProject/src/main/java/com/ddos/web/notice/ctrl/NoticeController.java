package com.ddos.web.notice.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.notice.NoticeService;
import com.ddos.web.notice.NoticeVO;

@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	
	// 단건 조회
	@RequestMapping("getNotice")
	public String getNotice(Model model, NoticeVO vo) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "notice/getNotice";
	}
	
	// 전체 조회
	@RequestMapping("getNoticeList")
	public String getNoticeList(Model model, NoticeVO vo) {
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "notice/getNoticeList";
	}
}
