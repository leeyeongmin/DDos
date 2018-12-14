package com.ddos.web.book.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.ddos.web.book.ReviewVO;

public class ReviewServiceImpl {
	
	@Autowired ReviewDAOMybatis dao;
	
	// 입력
	public void insertReview(ReviewVO vo){
		dao.insertReview(vo);
	}
	
	//수정
	public void updateReview(ReviewVO vo) {
		dao.updateReview(vo);
	}
	
	//삭제
	
	//

}
