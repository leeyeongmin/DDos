package com.ddos.web.statistics.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatisticsDAOMYBatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public Map<String, Object> readChart_yester(){
		return mybatis.selectOne("Statics.readChart_yester");
	}
	
	
	public Map<String, Object> readChart_lastWeekend(){
		return mybatis.selectOne("Statics.readChart_lastend");
	}
	
	public Map<String, Object> readChart_lastweekday(){
		return mybatis.selectOne("Statics.readChart_lastweek");
	}
	
	public Map<String, Object> BookChart_history() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Statics.BookChart_history");
	}


	public Map<String, Object> BookChart_total() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Statics.BookChart_total");
	}


	public Map<String, Object> BookChart_art() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Statics.BookChart_art");
	}


	public Map<String, Object> BookChart_science() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Statics.BookChart_science");
	}


	public Map<String, Object> BookChart_language() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Statics.BookChart_language");
	}

}
