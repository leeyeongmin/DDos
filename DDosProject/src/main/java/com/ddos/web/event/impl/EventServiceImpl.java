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

	// 이벤트 등록
	@Override
	public void insertEvent(EventVO vo) {
		dao.insertEvent(vo);
	}


	// 이벤트 수정
	@Override
	public void updateEvent(EventVO vo) {

	}

	// 이벤트 삭제
	@Override
	public void deleteEvent(EventVO vo) {

	}

	// 이벤트 전체 조회
	@Override
	public List<EventVO> getEventList(EventVO vo) {
		return null;
	}

	// 이벤트 상세 조회
	@Override
	public Object getEvent(EventVO vo) {
		return null;
	}

	@Override
	public Object getService(EventVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
}
