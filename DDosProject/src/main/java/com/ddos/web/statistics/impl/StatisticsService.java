package com.ddos.web.statistics.impl;

import java.util.Map;

public interface StatisticsService {
	public Map<String, Object> readChart_yester();			//어제
	public Map<String, Object> readChart_lastWeekend();		//지난 주 주말
	public Map<String, Object> readChart_lastweekday();		//지난 주 평일
}
