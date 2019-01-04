package com.ddos.web.pay;

import java.util.List;

import com.ddos.web.rental.RentalVO;


public interface PaySerivce {
	public List<RentalVO> Nonpayment_book(String id);
	public void paymentBook(List<String> arr);
}
