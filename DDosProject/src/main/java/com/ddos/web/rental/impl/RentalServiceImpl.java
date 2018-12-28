package com.ddos.web.rental.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.rental.RentalService;
import com.ddos.web.rental.RentalVO;

@Service
public class RentalServiceImpl implements RentalService{
	
	@Autowired 
	RentalDAOMybatis rda;

	//대출 현황
	@Override
	public List<RentalVO> getRentalList(RentalVO vo) {
		return rda.getRentalList(vo);
	}

	//대출 반납 히스토리
	@Override
	public List<RentalVO> historyList(RentalVO vo) {
		return null;
	}

	//대출
	@Override
	public void rentalBook(RentalVO vo) {
		rda.rentalBook(vo);
		
	}
//반납
	@Override
	public void returnBook(RentalVO vo) {
		rda.rentalBook(vo);
		
	}
//반납 리스트
	@Override
	public List<RentalVO> rentalSearch(RentalVO vo) {
		return rda.rentalSearch(vo);
	}
// 연장
	@Override
	public void renewBook(RentalVO vo) {
		rda.renewBook(vo);
		
	}

	

}
