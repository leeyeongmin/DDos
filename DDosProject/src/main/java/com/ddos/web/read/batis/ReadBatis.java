package com.ddos.web.read.batis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.read.ReadVO;

@Repository
public class ReadBatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ReadVO> setRoom(ReadVO vo){
		return mybatis.selectList("read.setRoom", vo);
	}
	
}
