package com.ddos.web.statistics.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatisticsSeviceImpl implements StatisticsService{

	@Autowired
	private StatisticsDAOMYBatis dao;

	@Override
	public Map<String, Object> readChart_yester() {
		// TODO Auto-generated method stub
		return dao.readChart_yester();
	}

	@Override
	public Map<String, Object> readChart_lastWeekend() {
		// TODO Auto-generated method stub
		return dao.readChart_lastWeekend();
	}

	@Override
	public Map<String, Object> readChart_lastweekday() {
		// TODO Auto-generated method stub
		return dao.readChart_lastweekday();
	}

}
