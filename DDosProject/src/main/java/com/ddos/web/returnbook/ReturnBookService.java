package com.ddos.web.returnbook;

import java.util.List;

import com.ddos.web.rental.RentalVO;

public interface ReturnBookService {
	public List<RentalVO> rentalSearch(RentalVO vo);			//검색 된 목록 
}
