package com.ddos.web.pay.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.rental.RentalVO;

@Repository
public class PayMybatisDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<RentalVO> Nonpayment_book(String id){
		return mybatis.selectList("pay.Nonpayment_book", id);
	}
	
}
