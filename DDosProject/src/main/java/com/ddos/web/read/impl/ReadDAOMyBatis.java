package com.ddos.web.read.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.read.ReadVO;

@Repository
public class ReadDAOMyBatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ReadVO> setRoom(ReadVO vo){
		return mybatis.selectList("read.setRoom", vo);
	}
	
	public void saveSeat(ReadVO vo) {
		mybatis.update("read.saveSeat", vo);			//지정된 자리
		mybatis.update("read.releaseSeat", vo);			//지정되지 않은 자리 
	}
	
	public ReadVO overlap(ReadVO vo) {					//좌석 중복 확인
		return mybatis.selectOne("read.overlap", vo);	
	}
	
	public void updateSeat(ReadVO vo) {
		mybatis.update("read.updateSeat",vo);			//좌석 사용중 변경
		mybatis.update("read.insertUsing",vo);			//history 추가
	}

	
	public void timecheck() {
		mybatis.update("read.timecheck");
	}
	
	public String useing_seat(String login_id) {
		return mybatis.selectOne("read.seat_useing", login_id);
	}
	
	public Map<String, String> getroomsize(ReadVO vo){
		return mybatis.selectOne("read.getroomsize", vo);
	}

}
