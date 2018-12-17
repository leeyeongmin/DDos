package com.ddos.web.book;

import java.util.List;

public interface ReviewService {

	// 전체 조회
	public List<ReviewVO> getReviewList(ReviewVO rvo);

	// 입력
	public void insertReview(ReviewVO rvo);

	// 수정
	public void updateReview(ReviewVO rvo);

	// 삭제
	public void deleteReview(ReviewVO rvo);
	
	//한권 조회
	public ReviewVO getReview(ReviewVO rvo);
}
