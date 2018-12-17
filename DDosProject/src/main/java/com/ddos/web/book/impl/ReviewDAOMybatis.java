package com.ddos.web.book.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.book.ReviewVO;

@Repository
public class ReviewDAOMybatis {

	@Autowired
	private SqlSessionTemplate sqlsession;

	// 전체 조회
	public List<ReviewVO> getReviewList(ReviewVO rvo) {
		System.out.println("sqlsession getReviewList 실행");
		return sqlsession.selectList("review.getReviewList", rvo);

}
	// 입력
	public void insertReview(ReviewVO rvo) {
		System.out.println("sqlsession insertReview 실행");
		sqlsession.update("review.insertReview", rvo);
	}

	// 수정
	public void updateReview(ReviewVO vo) {
		System.out.println("sqlsession updateReview 실행");
		sqlsession.update("review.updateReview", vo);
	}

	// 삭제
	public void deleteReview(ReviewVO rvo) {
		System.out.println("sqlsession deleteReview 실행");
		sqlsession.delete("review.deleteReview", rvo);

	}
	
	//리뷰 단권 조회
	public ReviewVO getReview(ReviewVO rvo) {
		System.out.println("sqlsession getReview 실행");
		return sqlsession.selectOne("review.getReview", rvo);
	}

}
