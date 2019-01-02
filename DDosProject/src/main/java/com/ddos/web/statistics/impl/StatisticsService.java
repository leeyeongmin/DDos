package com.ddos.web.statistics.impl;

import java.util.List;
import java.util.Map;

import com.ddos.web.paging.PagingVO;


public interface StatisticsService {
	public Map<String, Object> readChart_yester();			//어제
	public Map<String, Object> readChart_lastWeekend();		//지난 주 주말
	public Map<String, Object> readChart_lastweekday();		//지난 주 평일
	
	public Map<String, Object> BookChart_history(String day);			//책 장르별
	public Map<String, Object> BookChart_total(String day);
	public Map<String, Object> BookChart_art(String day);
	public Map<String, Object> BookChart_science(String day);
	public Map<String, Object> BookChart_language(String day);
	
	public List<Map> toprental(String day);					//top 5 user
	public List<Map> toprentalbook(String day);				//top 5 book
	public List<Map> rentalCount(String day);					//책 빌려간 수 
	
	public List<Map> totalChart_input(String year);			//1년 통계
	public List<Map> totalList(String year);
	public List<Map> totalChart_output(String year);
	
	public List<Map> UnpaidList();
	public List<Map> month_inputchart(String day);
	public List<Map> month_outputchart(String day);
	public List<Map> month_inputList(String day);
	public List<Map> month_outputList(String day);
	public List<Map> click_input(Map map);
	public List<Map> click_output(Map map);
	
	// 전체 건수
	public int getCount(PagingVO vo);
}
