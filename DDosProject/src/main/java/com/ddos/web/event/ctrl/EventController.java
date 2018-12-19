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

}
