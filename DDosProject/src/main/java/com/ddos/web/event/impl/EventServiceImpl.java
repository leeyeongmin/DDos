package com.ddos.web.event.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.event.EventService;
import com.ddos.web.event.EventVO;

@Service
public class EventServiceImpl implements EventService {
	@Autowired
	EventDAOMybatis dao;

	@Override
	public List<EventVO> getOngoingEvent(EventVO vo) {
		return dao.getOngoingEvent(vo);
	}

	@Override
	public List<EventVO> getAheadEvent(EventVO vo) {
		return dao.getAheadEvent(vo);
	}

	@Override
	public EventVO getEventDetail(EventVO vo) {
		return dao.getEventDetail(vo);
	}

	


	// 이벤트 수정
	@Override
	public void updateEvent(EventVO vo) {
		dao.updateEvent(vo);
	}

	// 이벤트 삭제
	@Override
	public void deleteEvent(EventVO vo) {
		dao.deleteEvent(vo);
	}

	// 이벤트 전체 조회
	@Override
	public List<EventVO> getEventList(EventVO vo) {
		return dao.getEventList(vo);
	}

	// 이벤트 상세 조회
	@Override
	public Object getEvent(EventVO vo) {
		return dao.getEvent(vo);
	}

	@Override
	public Object getService(EventVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	
	//건 조회
	@Override
	public int getCount(EventVO vo) {
	
		return dao.getCount(vo);
	}

	@Override
	public void insertEvent(EventVO vo, String path) {
		dao.insertEvent(vo);
		
	}




	
}
