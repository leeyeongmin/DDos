package com.ddos.web.returnbook.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.ddos.web.rental.RentalVO;
import com.ddos.web.returnbook.ReturnBookService;

@Service
public class ReturnBookSeviceImpl implements ReturnBookService{

	@Autowired
	ReturnBookDAOMyBatis dao;
	
	@Override
	public List<RentalVO> rentalSearch(RentalVO vo) {
		return dao.rentalSearch(vo);
	}

	@Override
	public void returnBook(RentalVO vo) {
		dao.returnBook(vo);
	}

}
