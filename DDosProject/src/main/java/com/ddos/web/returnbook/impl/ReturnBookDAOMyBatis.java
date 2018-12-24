package com.ddos.web.returnbook.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.rental.RentalVO;

@Repository
public class ReturnBookDAOMyBatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<RentalVO> rentalSearch(RentalVO vo){
		return mybatis.selectList("rental.rentalSearch", vo);
	}
	
	public void returnBook(RentalVO vo) {
		mybatis.update("rental.returnBook", vo);
	}
	
}
