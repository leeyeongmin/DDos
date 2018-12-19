package com.ddos.web.statistics.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatisticsController {
	
	@RequestMapping("bookTotal")
	public String adminHome() {
		return "admin/admin/AdminHome";
	}
}
