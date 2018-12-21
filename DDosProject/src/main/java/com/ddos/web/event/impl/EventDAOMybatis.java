package com.ddos.web.event.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.event.EventVO;

@Repository
public class EventDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<EventVO> getOngoingEvent(EventVO vo) {
		return mybatis.selectList("event.getOngoingEvent", vo);
	}

	public List<EventVO> getAheadEvent(EventVO vo) {
		return mybatis.selectList("event.getAheadEvent", vo);
	}

	public EventVO getEventDetail(EventVO vo) {
		return mybatis.selectOne("event.getEventDetail", vo);
	}

	// ============ 관리자용 =================
	// 등록
	public void insertEvent(EventVO vo) {
		mybatis.insert("event.insertEvent", vo);
	}
	
	// 수정
	public void updateEvent(EventVO vo) {
		System.out.println("my batis updateEvent() 기능 처리");
		mybatis.update("event.updateEvent", vo);
	}
	
	// 삭제
	public void deleteEvent(EventVO vo) {
		mybatis.delete("event.deleteEvent", vo);
	}
	
	// 전체 조회
	public List<EventVO> getEventList(EventVO vo) {
		return mybatis.selectList("event.getEventList", vo);
	}
	
	// 단건 조회
	public EventVO getEvent(EventVO vo) {
		return mybatis.selectOne("event.getEvent", vo);
	}
}
