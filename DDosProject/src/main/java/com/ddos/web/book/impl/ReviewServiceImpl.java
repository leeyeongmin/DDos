package com.ddos.web.book.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.book.ReviewService;
import com.ddos.web.book.ReviewVO;

@Repository
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAOMybatis dao;

	// 전체 리스트 
	@Override
	public List<ReviewVO> getReviewList(ReviewVO rvo) {
		return dao.getReviewList(rvo);
	}
	// 리뷰 등록
	@Override
	public void insertReview(ReviewVO rvo) {
		dao.insertReview(rvo);
	}
	// 리뷰 수정
	@Override
	public void updateReview(ReviewVO rvo) {
		dao.updateReview(rvo);
	}
	//리뷰 삭제
	@Override
	public void deleteReview(ReviewVO rvo) {
		System.out.println("impl 삭제 처리");
		dao.deleteReview(rvo);
		
	}
	// 리뷰  단권 조회
	@Override
	public ReviewVO getReview(ReviewVO rvo) {
		return dao.getReview(rvo);
	}

}
