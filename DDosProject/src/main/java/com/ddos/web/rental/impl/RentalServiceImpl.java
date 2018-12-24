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

	@Override
	public RentalVO getRental(RentalVO vo) {
		return null;
	}

}
