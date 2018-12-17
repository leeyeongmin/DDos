package com.ddos.web.event.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.event.EventService;
import com.ddos.web.event.EventVO;


@Service
public class EventServiceImpl implements EventService{
	
	@Autowired EventDAOMybatis dao;
	
	@Override
	public List<EventVO> getOngoingEvent(EventVO vo){
		return dao.getOngoingEvent(vo);
	}
	@Override
	public List<EventVO> getAheadEvent(EventVO vo){
		return dao.getAheadEvent(vo);
	}
	@Override
	public EventVO getEventDetail(EventVO vo) {
		return dao.getEventDetail(vo);
	}
}
