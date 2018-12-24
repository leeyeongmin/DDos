package com.ddos.web.returnbook.ctl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddos.web.rental.RentalVO;
import com.ddos.web.returnbook.ReturnBookService;

@Controller
public class ReturnBookController {
	
	
	@Autowired
	ReturnBookService returnbookserivce;
	
	@RequestMapping("adminreturn")
	public String adminreturn() {
		return "admin/rental/ReturnBook";
	}

	@RequestMapping("rentalSearch")
	@ResponseBody
	public List<RentalVO> rental_search(RentalVO vo){
		return returnbookserivce.rentalSearch(vo);
	}
	
}
