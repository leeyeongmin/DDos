package com.ddos.web.statistics.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddos.web.statistics.impl.StatisticsService;

@Controller
public class StatisticsController {
	
	@Autowired
	StatisticsService serivce;
	
	@RequestMapping("expenditureForm")
	public String expenditureFrom() {
		return "admin/statistics/Expenditure";
	}
	
	@RequestMapping("incomeForm")
	public String incomeFrom() {
		return "admin/statistics/Income";
	}
	
	@RequestMapping("totalAssetsForm")
	public String totalAssetsForm() {
		return "admin/statistics/TotalAssets";
	}
	
	@RequestMapping("GenreForm")
	public String GenreForm() {
		return "admin/statistics/Genre";
	}
	
	@RequestMapping("readingRoom")
	public String readingRoom() {
		return "admin/statistics/ReadingRoom";
	}
	
	@RequestMapping("readChart")
	@ResponseBody
	public Map<String, Object> readChart(){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("yesterday", serivce.readChart_yester());
		map.put("lastweekend", serivce.readChart_lastWeekend());
		map.put("lastweekday", serivce.readChart_lastweekday());
		
		return map;
	
	}
	
}
