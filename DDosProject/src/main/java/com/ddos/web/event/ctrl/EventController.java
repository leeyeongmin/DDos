package com.ddos.web.event.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddos.web.event.EventService;
import com.ddos.web.event.EventVO;

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
		return "event/insertEvent";
	}
	
	// 등록 처리
	@RequestMapping("insertEvent")
	public String insertEvent(EventVO vo) {
		eventService.insertEvent(vo);
		return "redirect:getEventList";
	}
	
	// 수정 폼
	@RequestMapping("updateEventform")
	public String updateEvent(Model model, EventVO vo) {
		System.out.println(vo);
		model.addAttribute("event", eventService.getEvent(vo));
		return "event/updateEvent";
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
	@RequestMapping("getEventList")
	public String getEventList(Model model, EventVO vo) {
		model.addAttribute("eventList", eventService.getEventList(vo));
		return "event/getEventList";
	}
	
	// 단건 조회
	@RequestMapping("getEvent")
	public String getEvent(Model model, EventVO vo) {
		model.addAttribute("event", eventService.getEvent(vo));
		return "event/getEvent";
	}
}
