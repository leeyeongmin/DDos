package com.ddos.web.pay.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.pay.PaySerivce;
import com.ddos.web.rental.RentalVO;

@Service
public class PayServiceImpl implements PaySerivce{

	@Autowired
	private PayMybatisDAO dao;

	@Override
	public List<RentalVO> Nonpayment_book(String id) {
		// TODO Auto-generated method stub
		return dao.Nonpayment_book(id);
	}

	@Override
	public void paymentBook(Map map) {
		dao.paymentBook(map);
	}
	
	
	
}
