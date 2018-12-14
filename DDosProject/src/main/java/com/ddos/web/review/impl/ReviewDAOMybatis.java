package com.ddos.web.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.review.ReviewVO;

@Repository
public class ReviewDAOMybatis {

	@Autowired
	private SqlSessionTemplate sqlsession;

	// 전체 조회
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return sqlsession.selectList("review.ReviewgetReviewList", vo);

}
	// 입력
	public void insertReview(ReviewVO vo) {
		sqlsession.insert("review.insertReview", vo);
	}

	// 수정
	public void updateReview(ReviewVO vo) {
		sqlsession.update("review.updateReview", vo);
	}

	// 삭제
	public void deleteReview(ReviewVO vo) {
		sqlsession.delete("review.Reviewdelete", vo);

	}

}
