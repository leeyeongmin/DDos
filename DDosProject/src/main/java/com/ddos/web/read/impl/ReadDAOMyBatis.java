package com.ddos.web.read.impl;

import java.util.List;

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
	
	public ReadVO overlap(ReadVO vo) {
		return mybatis.selectOne("read.overlap", vo);	
	}
}
