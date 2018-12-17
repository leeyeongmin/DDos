package com.ddos.web.event.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.event.EventService;
import com.ddos.web.event.EventVO;

@Controller
public class EventController {

	@Autowired
	EventService eventService;

	// show event list
	@RequestMapping("eventDetail")
	public String eventDetail(Model model, EventVO vo) {
		model.addAttribute("eventDetail", eventService.getEventDetail(vo));
		
		System.out.println(vo);
		
		return "event/UserEventList";
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

}
