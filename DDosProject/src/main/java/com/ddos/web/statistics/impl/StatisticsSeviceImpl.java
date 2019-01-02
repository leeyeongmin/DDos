package com.ddos.web.statistics.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.paging.PagingVO;

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
	public Map<String, Object> BookChart_history(String day) {
		// TODO Auto-generated method stub
		return dao.BookChart_history(day);
	}

	@Override
	public Map<String, Object> BookChart_total(String day) {
		// TODO Auto-generated method stub
		return dao.BookChart_total(day);
	}

	@Override
	public Map<String, Object> BookChart_art(String day) {
		// TODO Auto-generated method stub
		return dao.BookChart_art(day);
	}

	@Override
	public Map<String, Object> BookChart_science(String day) {
		// TODO Auto-generated method stub
		return dao.BookChart_science(day);
	}

	@Override
	public Map<String, Object> BookChart_language(String day) {
		// TODO Auto-generated method stub
		return dao.BookChart_language(day);
	}

	@Override
	public List<Map> toprental(String day) {
		// TODO Auto-generated method stub
		return dao.toprental(day);
	}

	@Override
	public List<Map> toprentalbook(String day) {
		// TODO Auto-generated method stub
		return dao.toprentalbook(day);
	}

	@Override
	public List<Map> rentalCount(String day) {
		// TODO Auto-generated method stub
		return dao.rentalCount(day);
	}

	@Override
	public List<Map> totalChart_input(String year) {
		// TODO Auto-generated method stub
		return dao.totalChart_input(year);
	}

	@Override
	public List<Map> totalList(String year) {
		// TODO Auto-generated method stub
		return dao.totalList(year);
	}

	@Override
	public List<Map> totalChart_output(String year) {
		// TODO Auto-generated method stub
		return dao.totalChart_output(year);
	}

	@Override
	public List<Map> UnpaidList() {
		// TODO Auto-generated method stub
		return dao.UnpaidList();
	}

	@Override
	public List<Map> month_inputchart(String day) {
		// TODO Auto-generated method stub
		return dao.month_inputchart(day);
	}

	@Override
	public List<Map> month_inputList(String day) {
		// TODO Auto-generated method stub
		return dao.month_inputList(day);
	}

	@Override
	public List<Map> click_input(Map map) {
		// TODO Auto-generated method stub
		return dao.click_input(map);
	}

	@Override
	public List<Map> click_output(Map map) {
		// TODO Auto-generated method stub
		return dao.click_output(map);
	}

	@Override
	public List<Map> month_outputchart(String day) {
		// TODO Auto-generated method stub
		return dao.month_outputchart(day);
	}

	@Override
	public List<Map> month_outputList(String day) {
		// TODO Auto-generated method stub
		return dao.month_outputList(day);
	}

	//전체 건수 
	@Override
	public int getCount(PagingVO vo) {
		return dao.getCount(vo);
	}



}
