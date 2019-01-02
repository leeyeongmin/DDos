package com.ddos.web.statistics.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.paging.PagingVO;


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
	
	public Map<String, Object> BookChart_history(String day) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Statics.BookChart_history", day);
	}


	public Map<String, Object> BookChart_total(String day) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Statics.BookChart_total", day);
	}


	public Map<String, Object> BookChart_art(String day) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Statics.BookChart_art", day);
	}


	public Map<String, Object> BookChart_science(String day) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Statics.BookChart_science", day);
	}


	public Map<String, Object> BookChart_language(String day) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Statics.BookChart_language", day);
	}

	public List<Map> toprental(String day){
		return mybatis.selectList("Statics.toprental", day);
	}
	
	public List<Map> toprentalbook(String day){
		return mybatis.selectList("Statics.toprentalbook", day);
	}
	
	public List<Map> rentalCount(String day){
		return mybatis.selectList("Statics.rentalCount" , day);
	}
	
	public List<Map> totalChart_input(String year){
		return mybatis.selectList("Statics.totalChart_input" ,year);
	}
	
	public List<Map> totalList(String year){
		return mybatis.selectList("Statics.totalList", year);
	}
	
	public List<Map> totalChart_output(String year){
		return mybatis.selectList("Statics.totalChart_output", year);
	}
	
	public List<Map> UnpaidList(){
		return mybatis.selectList("Statics.UnpaidList");
	}
	
	public List<Map> month_inputchart(String day){
		return mybatis.selectList("Statics.month_inputchart", day);
	}
	
	public List<Map> month_inputList(String day){
		return mybatis.selectList("Statics.month_inputList", day);
	}
	
	public List<Map> click_input(Map map){
		return mybatis.selectList("Statics.click_input", map);
	}
	
	public List<Map> month_outputchart(String day){
		return mybatis.selectList("Statics.month_outputchart", day);
	}
	
	public List<Map> month_outputList(String day){
		return mybatis.selectList("Statics.month_outputList", day);
	}
	
	public List<Map> click_output(Map map){
		return mybatis.selectList("Statics.click_output",map);
	}
	
	//전체 건수 조회
	public int getCount(PagingVO vo) {
		return mybatis.selectOne("paging.getCount", vo);
	}
}
