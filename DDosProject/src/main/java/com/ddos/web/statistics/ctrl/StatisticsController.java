package com.ddos.web.statistics.ctrl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("bookChart")
	@ResponseBody
	public Map<String, Object> bookChart(@RequestParam String day){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("History", serivce.BookChart_history(day));
		map.put("Total", serivce.BookChart_total(day));
		map.put("art", serivce.BookChart_art(day));
		map.put("Science", serivce.BookChart_science(day));
		map.put("Language", serivce.BookChart_language(day));
		
		return map;
		
	}
	
	@RequestMapping("toprental")
	@ResponseBody
	public List<Map> topRental(@RequestParam String day){
		return serivce.toprental(day);
	}
	
	
	@RequestMapping("toprentalbook")
	@ResponseBody
	public List<Map> toprentalbook(@RequestParam String day){
		return serivce.toprentalbook(day);
	}
	
	@RequestMapping("rentalCount")
	@ResponseBody
	public List<Map> rentalCount(@RequestParam String day){
		return serivce.rentalCount(day);
	}	
	
	@RequestMapping("totalChart_input")
	@ResponseBody
	public List<Map> totalChart_input(@RequestParam String year){
		return serivce.totalChart_input(year);
	}
	
	@RequestMapping("totalList")
	@ResponseBody
	public List<Map> totalList(@RequestParam String year){
		return serivce.totalList(year);
	}
	
	@RequestMapping("totalChart_output")
	@ResponseBody
	public List<Map> totalChart_output(@RequestParam String year){
		return serivce.totalChart_output(year);
	}
	
	@RequestMapping("UnpaidList")
	@ResponseBody
	public List<Map> UnpaidList(){
		return serivce.UnpaidList();
	}
	
	@RequestMapping("month_inputchart")
	@ResponseBody
	public List<Map> month_inputchart(@RequestParam String day){
		return serivce.month_inputchart(day);
	}
	
	@RequestMapping("month_inputList")
	@ResponseBody
	public List<Map> month_inputList(@RequestParam String day){
		return serivce.month_inputList(day);
	}
	
	@RequestMapping("click_input")
	@ResponseBody
	public List<Map> click_input(@RequestParam Map map){
		return serivce.click_input(map);
	}
	
	@RequestMapping("month_outputchart")
	@ResponseBody
	public List<Map> month_outputchart(@RequestParam String day){
		return serivce.month_outputchart(day);
	}
	
	@RequestMapping("month_outputList")
	@ResponseBody
	public List<Map> month_outputList(@RequestParam String day){
		return serivce.month_outputList(day);
	}
	
	@RequestMapping("click_output")
	@ResponseBody
	public List<Map> click_output(@RequestParam Map map){
		return serivce.click_output(map);
	}
	
	
}
