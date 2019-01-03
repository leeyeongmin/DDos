package com.ddos.web.notice.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ddos.web.notice.NoticeService;
import com.ddos.web.notice.NoticeVO;
import com.ddos.web.paging.PagingVO;

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
	
	
	// 관리자 단건 조회
	@RequestMapping("getNotice")
	public String getNotice(Model model, NoticeVO vo) {
		noticeService.increaseCnt(vo);
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "notice/getNotice";
	}
	
	// 사용자 단건 조회
	@RequestMapping("UsergetNotice")
	public String UsergetNotice(Model model, NoticeVO vo) {
		noticeService.increaseCnt(vo);
		model.addAttribute("notice", noticeService.UsergetNotice(vo));
		return "notice/UsergetNotice";
	}
	
	// 관리자 전체 조회
	/*@RequestMapping("getNoticeList")
	public String getNoticeList(Model model, NoticeVO vo) {
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "notice/getNoticeList";
	}*/
	@RequestMapping(value = "/getNoticeList")
	public ModelAndView getNoticeList(Model model, NoticeVO vo, PagingVO paging) {
		ModelAndView mv = new ModelAndView();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(noticeService.getCount(vo));
		mv.addObject("paging", paging);
		mv.addObject("noticeList", noticeService.getNoticeList(vo));
		mv.setViewName("admin/notice/getNoticeList");
		return mv;
	}
	
	
	
	// 사용자 전체 조회
	/*@RequestMapping("UsergetNoticeList")
	public String UsergetNoticeList(Model model, NoticeVO vo) {
		model.addAttribute("noticeList", noticeService.UsergetNoticeList(vo));
		return "notice/UsergetNoticeList";
	}*/
	@RequestMapping(value = "/UsergetNoticeList")
	public ModelAndView UsergetNoticeList(Model model, NoticeVO vo, PagingVO paging) {
		ModelAndView mv = new ModelAndView();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(noticeService.getCount(vo));
		mv.addObject("paging", paging);
		mv.addObject("noticeList", noticeService.UsergetNoticeList(vo));
		mv.setViewName("notice/UsergetNoticeList");
		return mv;
	}
}
