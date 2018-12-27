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

	@Override
	public Map<String, Object> BookChart_history() {
		// TODO Auto-generated method stub
		return dao.BookChart_history();
	}

	@Override
	public Map<String, Object> BookChart_total() {
		// TODO Auto-generated method stub
		return dao.BookChart_total();
	}

	@Override
	public Map<String, Object> BookChart_art() {
		// TODO Auto-generated method stub
		return dao.BookChart_art();
	}

	@Override
	public Map<String, Object> BookChart_science() {
		// TODO Auto-generated method stub
		return dao.BookChart_science();
	}

	@Override
	public Map<String, Object> BookChart_language() {
		// TODO Auto-generated method stub
		return dao.BookChart_language();
	}



}
