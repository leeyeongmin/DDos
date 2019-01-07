package com.ddos.web.pay.ctl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	
	@RequestMapping("paymentBook")
	@ResponseBody
	/*public void paymentBook(@RequestParam(value="arr[]") List<String> arr){*/
	public void paymentBook(@RequestBody Map map) {	
	
		System.out.println("aaa : " + map);
		payserivce.paymentBook(map);
	}
	
}
