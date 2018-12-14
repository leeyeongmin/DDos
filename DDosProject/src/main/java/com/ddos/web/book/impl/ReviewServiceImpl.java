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

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return dao.getReviewList(vo);
	}

	@Override
	public void insertReview(ReviewVO vo) {
		dao.insertReview(vo);

	}

	@Override
	public void updateReview(ReviewVO vo) {
		dao.updateReview(vo);
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		dao.deleteReview(vo);

	}

}
