package com.ddos.web.pay.ctl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddos.web.pay.PaySerivce;
import com.ddos.web.rental.RentalVO;

@Controller
public class PayController {
	
	@Autowired
	PaySerivce payserivce;
	
	@RequestMapping("payList")
	public String payList() {
		return "pay/payList";
	}
	
	@RequestMapping("Nonpayment_book")
	@ResponseBody
	public List<RentalVO> Nonpayment_book(@RequestParam String id){
		return payserivce.Nonpayment_book(id);
	}
	
}
