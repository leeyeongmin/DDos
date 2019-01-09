package com.ddos.web.event.ctrl;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ddos.web.event.EventService;
import com.ddos.web.event.EventVO;
import com.ddos.web.paging.PagingVO;

@Controller
public class EventController {

	@Autowired
	EventService eventService;

	// show event list
	@RequestMapping("eventDetail")
	@ResponseBody
	public EventVO eventDetail(Model model, EventVO vo) {
		
		return eventService.getEventDetail(vo);
	}

	// show event list
	@RequestMapping("eventList")
	public String eventList(Model model, EventVO ovo, EventVO avo) {

		model.addAttribute("ongoingEvent", eventService.getOngoingEvent(ovo));
		model.addAttribute("aheadEvent", eventService.getAheadEvent(avo));

		System.out.println(ovo);
		System.out.println(avo);

		return "event/UserEventList";
	}
	
	// ================= 관리자용 ====================
	// 등록 폼
	@RequestMapping("insertEventform")
	public String insertEvent(Model model, EventVO vo) {
		return "admin/event/insertEvent";
	}
	
	// 등록 처리
	@RequestMapping(value="insertEvent", method=RequestMethod.POST)
	public String insertEvent(EventVO vo, SessionStatus sessionStatus,
			HttpServletRequest request ) throws IllegalStateException, IOException {
		
		System.out.println(vo);
		String path = request.getSession().getServletContext().getRealPath("/resources");
		System.out.println(path);
		
		//첨부파일 업로드 처리
		MultipartFile fileName = vo.getFileName();
		String tfileName = null;
		if(fileName !=null && !fileName.isEmpty() && fileName.getSize()>0) {
		tfileName = fileName.getOriginalFilename();
		fileName.transferTo(new File(path, tfileName));
		}
		//첨부파일명 VO에 지정
		vo.setEventFile(tfileName);
		
		
		eventService.insertEvent(vo, path);
		
		sessionStatus.setComplete();
		
		return "redirect:getEventList";
	}
	
	// 수정 폼
	@RequestMapping("updateEventform")
	public String updateEvent(Model model, EventVO vo) {
		System.out.println(vo);
		model.addAttribute("event", eventService.getEvent(vo));
		return "admin/event/updateEvent";
	}
	
	// 수정 처리
	@RequestMapping("updateEvent")
	public String updateEvent(EventVO vo) {
		eventService.updateEvent(vo);
		return "redirect:getEventList";
	}
	
	// 삭제 처리
	@RequestMapping("deleteEvent")
	public String deleteEvent(EventVO vo) {
		eventService.deleteEvent(vo);
		return "redirect:getEventList";
	}
	
	// 전체 조회
	/*@RequestMapping("getEventList")
	public String getEventList(Model model, EventVO vo) {
		model.addAttribute("eventList", eventService.getEventList(vo));
		return "event/getEventList";
	}*/
	
	@RequestMapping(value = "/getEventList")
	public ModelAndView getEventList(Model model, EventVO vo,  PagingVO paging) {
		ModelAndView mv = new ModelAndView();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(eventService.getCount(vo));
		mv.addObject("paging", paging);
		mv.addObject("eventList", eventService.getEventList(vo));
		mv.setViewName("admin/event/getEventList");
		return mv;
		}
	
	// 단건 조회
	@RequestMapping("getEvent")
	public String getEvent(Model model, EventVO vo) {
		model.addAttribute("event", eventService.getEvent(vo));
		return "admin/event/getEvent";
	}
	
	//건수
}
