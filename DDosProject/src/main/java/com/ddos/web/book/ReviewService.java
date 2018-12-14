package com.ddos.web.book;

import java.util.List;

public interface ReviewService {

	// 전체 조회
	public List<ReviewVO> getReviewList(ReviewVO vo);

	// 입력
	public void insertReview(ReviewVO vo);

	// 수정
	public void updateReview(ReviewVO vo);

	// 삭제
	public void deleteReview(ReviewVO vo);
}
