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
	
	// 등록폼
	@RequestMapping("insertNoticeform")
	public String insertNotice(Model model, NoticeVO vo) {
		return "notice/insertNotice";
	}
	
	// 등록 처리
	@RequestMapping("insertNotice")
	public String insertNotice(NoticeVO vo) {
		noticeService.insertNotice(vo);		// 등록 처리
		return "redirect:getNoticeList";	// 목록 요청
	}
	
	// 수정폼
	@RequestMapping("updateNoticeform")
	public String updateNotice(Model model, NoticeVO vo) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "notice/updateNotice";
	}
	
	// 수정 처리
	@RequestMapping("updateNotice")
	public String updateNotice(NoticeVO vo) {
		noticeService.updateNotice(vo);		// 수정 등록 처리
		return "redirect:getNoticeList";	// 목록 요청
	}
	
	// 삭제 처리
	@RequestMapping("deleteNotice")
	public String deleteNotice(NoticeVO vo) {
		noticeService.deleteNotice(vo);		// 삭제 처리
		return "redirect:getNoticeList";	// 목록 요청
	}
	
	
	// 단건 조회
	@RequestMapping("getNotice")
	public String getNotice(Model model, NoticeVO vo) {
		noticeService.increaseCnt(vo);
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
