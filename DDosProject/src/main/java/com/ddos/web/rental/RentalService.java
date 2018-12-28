package com.ddos.web.rental;

import java.util.List;

public interface RentalService {
	
	//대출 현황 조회
	public List<RentalVO> getRentalList(RentalVO vo);
	
	
	//대출 이력 조회
	public List<RentalVO> historyList(RentalVO vo);
	
	//대출
	public void rentalBook(RentalVO vo);
	
	//반납
	public void returnBook(RentalVO vo);	

	//반납 리스트
	public List<RentalVO> rentalSearch(RentalVO vo);			//검색 된 목록 


	// 연장
	public void renewBook(RentalVO vo);
}
