package com.ddos.web.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.review.ReviewService;
import com.ddos.web.review.ReviewVO;

@Repository
public class ReviewServiceImpl implements ReviewService{
	
@Autowired ReviewDAOMybatis dao;
	
	// 입력
	public void insertReview(ReviewVO vo){
		dao.insertReview(vo);
	}
	
	//수정
	public void updateReview(ReviewVO vo) {
		dao.updateReview(vo);
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	//삭제
	
	//

}
