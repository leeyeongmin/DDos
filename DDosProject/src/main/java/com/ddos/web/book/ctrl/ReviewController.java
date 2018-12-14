package com.ddos.web.book.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddos.web.book.ReviewService;
import com.ddos.web.book.ReviewVO;

@Controller
public class ReviewController {

	@Autowired ReviewService reviewservice;	//service 호출
	
	// 리뷰 조회
	@RequestMapping("getReviewList")
	@ResponseBody
	public List<ReviewVO> getReviewList(ReviewVO vo){
		vo.setPageUnit(5);
		return reviewservice.getReviewList(vo);
	}
	
	// 리뷰 등록 폼
	@RequestMapping("insertReviewform")
	public String insertReviewform(Model model, ReviewVO vo) {
		return "review/insertReview";
	}
	// 리뷰 등록 처리
	@RequestMapping("insertReview")
		public String insertReview(ReviewVO vo) {
		reviewservice.insertReview(vo);
		return "redirect:getReviewList";
	}
	// 리뷰 수정
	@RequestMapping("updateReviewform")
	public String updateReview(Model model, ReviewVO vo) {
		model.addAttribute("review", reviewservice.getReviewList(vo));
		return "review/updateReview";
		
	}
	
	// 리뷰 삭제
	@RequestMapping("deleteReview")
	@ResponseBody
	public ReviewVO deleteReview(ReviewVO vo) {
		reviewservice.deleteReview(vo);
		return vo;
	}
	
	
}
