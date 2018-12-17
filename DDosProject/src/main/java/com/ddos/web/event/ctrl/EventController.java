package com.ddos.web.event.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.event.EventService;
import com.ddos.web.event.EventVO;

@Controller
public class EventController {
	
	@Autowired EventService eventService;
	
	// show event list 
		@RequestMapping("eventList")
		public String eventList(Model model, EventVO vo) {
			return "event/UserEventList";
		}
		

}
