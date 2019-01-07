package com.ddos.web.pay;

import java.util.List;
import java.util.Map;

import com.ddos.web.rental.RentalVO;


public interface PaySerivce {
	public List<RentalVO> Nonpayment_book(String id);
	public void paymentBook(Map map);
}
