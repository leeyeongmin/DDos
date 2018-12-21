package com.ddos.web.rental.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.rental.RentalVO;

@Repository
public class RentalDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//대출 이력 조회
	public List<RentalVO> getRentalList(RentalVO vo){
		System.out.println("마이바티스 대출 이력 조회");
		return mybatis.selectList("rental.getRentalList", vo);
	}

}
