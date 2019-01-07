package com.ddos.web.statistics.ctrl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;import org.omg.PortableServer.Servant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddos.web.paging.PagingVO;
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
	public Map topRental(@RequestParam Map day, PagingVO page){
		
		Map map = new HashMap();
		
		System.out.println("sssssssssssssss : " + day);
		
		page.setPage(Integer.parseInt(day.get("page").toString()));
		
		 if (page.getPage() == null) {
	         page.setPage(1);
	      }
	      page.setPageUnit(5);
	      
	      day.put("first", page.getFirst());
	      day.put("last", page.getLast());      

	     int cnt = Integer.parseInt(((serivce.toprentalcount(day)).get("cnt")).toString());

	     //page.setTotalRecord(cnt);
	     page.setTotalRecord(cnt);
	      
	     
	     map.put("paging", page);
		 map.put("result", serivce.toprental(day));
		
		 
		return map;

	}
	
	
	@RequestMapping("toprentalbook")
	@ResponseBody
	public Map toprentalbook(@RequestParam Map day, PagingVO page){
		
		Map map = new HashMap();
		
		System.out.println("sssssssssssssss : " + day);
		
		page.setPage(Integer.parseInt(day.get("page").toString()));
		
		 if (page.getPage() == null) {
	         page.setPage(1);
	      }
	      page.setPageUnit(5);
	      
	      day.put("first", page.getFirst());
	      day.put("last", page.getLast());      

	     int cnt = Integer.parseInt(((serivce.toprentalbookcount(day)).get("cnt")).toString());

	     //page.setTotalRecord(cnt);
	     page.setTotalRecord(cnt);
	      
	     
	     map.put("paging", page);
		 map.put("result", serivce.toprentalbook(day));
		
		 
		return map;

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
	public Map totalList(@RequestParam Map year , PagingVO page){
		
		Map map = new HashMap();
		
		System.out.println("sssssssssssssss : " + year);
		
		page.setPage(Integer.parseInt(year.get("page").toString()));
		
		 if (page.getPage() == null) {
	         page.setPage(1);
	      }
	      page.setPageUnit(7);
	      
	      year.put("first", page.getFirst());
	      year.put("last", page.getLast());      

	     int cnt = Integer.parseInt(((serivce.totalListCount(year)).get("cnt")).toString());

	     //page.setTotalRecord(cnt);
	     page.setTotalRecord(cnt);
	      
	     
	     map.put("paging", page);
		 map.put("result", serivce.totalList(year));
		
		 
		return map;
				
	}
	
	@RequestMapping("totalChart_output")
	@ResponseBody
	public List<Map> totalChart_output(@RequestParam String year){
		return serivce.totalChart_output(year);
	}
	
	@RequestMapping("UnpaidList")
	@ResponseBody
	public Map UnpaidList(@RequestParam Map pag, PagingVO page){
		
		Map map = new HashMap();
	
		page.setPage(Integer.parseInt(pag.get("page").toString()));
		
		 if (page.getPage() == null) {
	         page.setPage(1);
	      }
	      page.setPageUnit(7);
	      
	      pag.put("first", page.getFirst());
	      pag.put("last", page.getLast());      

	     int cnt = Integer.parseInt(((serivce.UnpaidListCount(pag)).get("cnt")).toString());

	     page.setTotalRecord(cnt);
	      
	     map.put("paging", page);
		 map.put("result", serivce.UnpaidList(pag));
		
		 
		return map;

	}
	
	@RequestMapping("month_inputchart")
	@ResponseBody
	public List<Map> month_inputchart(@RequestParam String day){
		return serivce.month_inputchart(day);
	}
	
	
	@RequestMapping("month_inputList")
	@ResponseBody
	public Map month_inputList(@RequestParam Map day, PagingVO page){
		
		Map map = new HashMap();
		
		System.out.println("sssssssssssssss : " + day);
		
		page.setPage(Integer.parseInt(day.get("page").toString()));
		
		 if (page.getPage() == null) {
	         page.setPage(1);
	      }
	      page.setPageUnit(5);
	      
	      day.put("first", page.getFirst());
	      day.put("last", page.getLast());      

	     int cnt = Integer.parseInt(((serivce.getinputCount(day)).get("cnt")).toString());

	     //page.setTotalRecord(cnt);
	     page.setTotalRecord(cnt);
	      
	     
	     map.put("paging", page);
		 map.put("result", serivce.month_inputList(day));
		
		 
		return map;
	}
	
	@RequestMapping("click_input")
	@ResponseBody
	public Map Mapclick_input(@RequestParam Map day, PagingVO page){
		Map map = new HashMap();
		
		page.setPage(Integer.parseInt(day.get("page").toString()));
		
		 if (page.getPage() == null) {
	         page.setPage(1);
	      }
		 
	      page.setPageUnit(5);
	      
	      day.put("first", page.getFirst());
	      day.put("last", page.getLast());      

	     int cnt = Integer.parseInt(((serivce.click_input_count(day)).get("cnt")).toString());

	     //page.setTotalRecord(cnt);
	     page.setTotalRecord(cnt);
	     
	     map.put("paging", page); 
		 map.put("result", serivce.click_input(day));
		
		 
		return map;
	}
	
	@RequestMapping("month_outputchart")
	@ResponseBody
	public List<Map> month_outputchart(@RequestParam String day){
		return serivce.month_outputchart(day);
	}
	
	@RequestMapping("month_outputList")
	@ResponseBody
	public Map month_outputList(@RequestParam Map day , PagingVO page){
		
		Map map = new HashMap();
		
		page.setPage(Integer.parseInt(day.get("page").toString()));
		
		 if (page.getPage() == null) {
	         page.setPage(1);
	      }
		 
	      page.setPageUnit(5);
	      
	      day.put("first", page.getFirst());
	      day.put("last", page.getLast());      

	     int cnt = Integer.parseInt(((serivce.getoutputCount(day)).get("cnt")).toString());

	     //page.setTotalRecord(cnt);
	     page.setTotalRecord(cnt);
	     
	     map.put("paging", page); 
		 map.put("result", serivce.month_outputList(day));
		
		 
		return map;

	}
	
	@RequestMapping("click_output")
	@ResponseBody
	public Map click_output(@RequestParam Map day, PagingVO page){
		Map map = new HashMap();
		
		System.out.println("====================" + day);
		
		
		page.setPage(Integer.parseInt(day.get("page").toString()));
		
		 if (page.getPage() == null) {
	         page.setPage(1);
	      }
		 
	      page.setPageUnit(5);
	      
	      day.put("first", page.getFirst());
	      day.put("last", page.getLast());      
 

	      
	      
	     int cnt = Integer.parseInt(((serivce.click_output_count(day)).get("cnt")).toString());

	      System.out.println("cnt :===================" + cnt);
	     
	     //page.setTotalRecord(cnt);
	     page.setTotalRecord(cnt);
	     
	     map.put("paging", page); 
		 map.put("result", serivce.click_output(day));
		
		 
		return map;
	}
	
	
}
