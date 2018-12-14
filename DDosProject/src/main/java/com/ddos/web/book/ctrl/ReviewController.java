package com.ddos.web.book.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddos.web.book.ReviewService;

@Controller
public class ReviewController {

	@Autowired ReviewService.reviewservice;	//service 호출
	
	// 리뷰 조회
	@RequestMapping("getReviewList")
	@ResponseBody
	public List<ReviewVO> getReviewList(ReviewVO vo){
		vo.
	}
}
