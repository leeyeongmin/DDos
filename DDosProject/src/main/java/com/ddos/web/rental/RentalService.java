package com.ddos.web.rental;

import java.util.List;

public interface RentalService {
	
	//대출 현황 조회
	public List<RentalVO> getRentalList(RentalVO vo);
	
	
	//대출 이력 조회
	public List<RentalVO> historyList(RentalVO vo);
	
	//대출
	public void rentalBook(RentalVO vo);


}
