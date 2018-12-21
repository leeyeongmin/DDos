package com.ddos.web.book.ctrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ddos.web.book.BookService;
import com.ddos.web.book.BookVO;
import com.ddos.web.book.ReviewService;
import com.ddos.web.book.ReviewVO;
import com.ddos.web.paging.PagingVO;

// 도서 controller
@Controller
public class BookController {
	@Autowired
	BookService bookservice; // service 호출
	@Autowired
	ReviewService reviewservice;

	// 도서 목록에서 테이블 보기
	@RequestMapping("table")
	public String gettable(Model model, BookVO vo) {
		return "book/tablelayout";
	}

	// 메인에서 도서목록으로
	@RequestMapping("book")
	public String book(Model model, BookVO vo) {
		model.addAttribute("bookList", bookservice.getBookList(vo));
		return "book/getBookList";
	}

	// 도서 전체 목록 조회
	/*	@RequestMapping("getBookList")
	public String getBookList(Model model, BookVO vo) {
		model.addAttribute("bookList", bookservice.getBookList(vo));
		return "book/getBookList";
	}*/
	
@RequestMapping(value="/getBookList")
	public ModelAndView getBookList(Model model, BookVO vo, PagingVO paging) {
	ModelAndView mv = new ModelAndView();
		if (paging.getPage() == null) {
			paging.setPage(1);
			}
		paging.setPageUnit(5);
//first.last
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

//전체 레코드 건수
		paging.setTotalRecord(bookservice.getCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("getBookList", bookservice.getBookList(vo));
		mv.setViewName("book/getBookList");
		return mv;
	}
	// 도서 1건 조회 및 isbn으로 리뷰 조회
	@RequestMapping("getBook")
	public String getBook(Model model, BookVO vo, ReviewVO rvo) {

		model.addAttribute("book", bookservice.getBook(vo));
		model.addAttribute("review", reviewservice.getReviewList(rvo));

		return "book/getBook";

		/*
		 * System.out.println(vo); ReviewVO ro = new ReviewVO();
		 * ro.setIsbn(vo.getIsbn()); ro.setPageUnit(3); model.addAttribute("book",
		 * bookservice.getBook(vo)); model.addAttribute("review",
		 * reviewservice.getReviewList(ro)); return "book/getBook";
		 */
	}

	// 도서 등록 폼
	@RequestMapping("insertBookform")
	public String insertBookform(Model model, BookVO vo) {
		return "book/insertBook";
	}

	// 도서 등록 처리
	@RequestMapping("insertBook")
	public String insertBook(BookVO vo) {
		bookservice.insertBook(vo);
		return "redirect:getBookList";
	}

	// 도서 수정 폼
	@RequestMapping("updateBookform")
	public String updateBookform(Model model, BookVO vo) {
		model.addAttribute("book", bookservice.getBook(vo));
		return "book/updateBook";
	}

	// 도서 수정 처리
	@RequestMapping("/updateBook")
	public String updateBook(BookVO vo) {
		bookservice.updateBook(vo);
		return "redirect:getBookList";
	}
	////////////////////////////////////// 리뷰 컨트롤러
	////////////////////////////////////// /////////////////////////////////////////////////

	// 리뷰 조회
	@RequestMapping("getReviewList")
	public List<ReviewVO> getReviewList(ReviewVO rvo) {
		return reviewservice.getReviewList(rvo);
	}

	// 리뷰 단권 조회
	@RequestMapping("getReview")
	public String getReview(Model model, ReviewVO rvo) {
		model.addAttribute("review", reviewservice.getReview(rvo));
		return "book/getBook";
	}

	// 리뷰 등록 폼
	@RequestMapping("insertReviewform")
	public String insertReviewform(Model model, BookVO vo, ReviewVO rvo) {
		System.out.println(rvo);
		model.addAttribute("review", rvo.getIsbn());
		model.addAttribute("book", bookservice.getBook(vo));
		System.out.println("리뷰 컨트롤 등록 폼");
		return "book/insertReview";

	}

	// 리뷰 등록 처리
	@RequestMapping("insertReview")
	public String insertReview(Model model, BookVO vo, ReviewVO rvo, HttpSession session) {
		System.out.println("리뷰 컨트롤 등록 처리");
		reviewservice.insertReview(rvo);
		vo.setIsbn(rvo.getIsbn());
		model.addAttribute("book", bookservice.getBook(vo));
		model.addAttribute("review", reviewservice.getReviewList(rvo));

		return "book/getBook";
		// return "redirect:getBook";
	}

	// 리뷰 수정 폼
	@RequestMapping("updateReviewform")
	public String updateReview(Model model, ReviewVO rvo) {
		System.out.println(rvo);
		model.addAttribute("review", reviewservice.getReview(rvo));
		return "book/updateReview";
	}

	// 리뷰 수정 처리
	@RequestMapping("/updateReview")
	public String updateReview(Model model, ReviewVO rvo, HttpSession session) {
		System.out.println("리뷰 컨트롤 수정 처리");
		reviewservice.updateReview(rvo);
		model.addAttribute("review", reviewservice.getReviewList(rvo));
		return "redirect:getBookList";
	}

	// 리뷰 삭제
	@RequestMapping("deleteReview")
	public String deleteReview(Model model, ReviewVO rvo) {
		reviewservice.deleteReview(rvo);
		return "redirect:getBookList";
	}
}