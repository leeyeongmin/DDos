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
		
}
