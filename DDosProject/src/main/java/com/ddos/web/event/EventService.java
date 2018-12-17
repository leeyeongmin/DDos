package com.ddos.web.event;

import java.util.List;

import com.ddos.web.event.EventVO;

public interface EventService {

	public List<EventVO> getOngoingEvent(EventVO vo);
	public List<EventVO> getAheadEvent(EventVO vo);
	public EventVO getEventDetail(EventVO vo);
	
}
