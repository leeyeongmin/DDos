package com.ddos.web.rental.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.rental.RentalVO;
import com.ddos.web.user.UserVO;

@Repository
public class RentalDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//대출 이력 조회
	public List<RentalVO> getRentalList(RentalVO vo){
		System.out.println("마이바티스 대출 현황 조회");
		System.out.println(vo);
		return mybatis.selectList("rental.getRentalList", vo);
	}
	
	//대출
	public void rentalBook(RentalVO vo) {
		mybatis.update("rental.rentalBook", vo);
	}
	//반납 내역조회
	public List<RentalVO> rentalSearch(RentalVO vo){
		return mybatis.selectList("rental.rentalSearch", vo);
	}
	//반납
	public void returnBook(RentalVO vo) {
		mybatis.update("rental.returnBook", vo);
	}
	
	//연장
	public void renewBook(RentalVO vo) {
		mybatis.update("rental.renewBook", vo);
		}
	
	//대출 반납 히스토리
	public List<RentalVO> getHistoryList(RentalVO vo){
		System.out.println("마이바티스 대출반납히스토리 조회");
		return mybatis.selectList("rental.getHistoryList", vo);
	}


	public String getRentalCount(UserVO vo) {
		return mybatis.selectOne("rental.getRentalCount", vo);
	}

	public int getCount(RentalVO vo) {
		return  mybatis.selectOne("rental.getCount", vo);

	}
}
