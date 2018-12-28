package com.ddos.web.statistics.impl;

import java.util.List;
import java.util.Map;


public interface StatisticsService {
	public Map<String, Object> readChart_yester();			//어제
	public Map<String, Object> readChart_lastWeekend();		//지난 주 주말
	public Map<String, Object> readChart_lastweekday();		//지난 주 평일
	
	public Map<String, Object> BookChart_history();			//책 장르별
	public Map<String, Object> BookChart_total();
	public Map<String, Object> BookChart_art();
	public Map<String, Object> BookChart_science();
	public Map<String, Object> BookChart_language();
	
	public List<Map> toprental();					//top 5 user
	public List<Map> toprentalbook();				//top 5 book
	public List<Map> rentalCount();					//책 빌려간 수 
	
}
