package com.ddos.web.statistics.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatisticsController {
	
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
}
