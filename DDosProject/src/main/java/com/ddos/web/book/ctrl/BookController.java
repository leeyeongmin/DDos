package com.ddos.web.book.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.book.BookService;
import com.ddos.web.book.BookVO;

// 도서 controller
@Controller
public class BookController {
	@Autowired
	BookService bookservice; // service 호출

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

	// 전체 목록 조회
	@RequestMapping("getBookList")
	public String getBookList(Model model, BookVO vo) {
		model.addAttribute("bookList", bookservice.getBookList(vo));
		return "book/getBookList";
	}

	// 1건 조회
	@RequestMapping("getBook")
	public String getBook(Model model, BookVO vo) {
		System.out.println(vo);
		model.addAttribute("book", bookservice.getBook(vo));
		return "book/getBook";
	}

	// 등록 폼
	@RequestMapping("insertBookform")
	public String insertBookfrom(Model model, BookVO vo) {
		return "book/insertBook";
	}

	// 등록 처리
	@RequestMapping("insertBook")
	public String insertBook(BookVO vo) {
		bookservice.insertBook(vo);
		return "redirect:getBookList";
	}

//수정 폼
	@RequestMapping("updateBookform")
	public String updateBookform(Model model, BookVO vo) {
		model.addAttribute("book", bookservice.getBook(vo));
		return "book/updateBook";
	}

	// 수정 처리
	@RequestMapping("/updateBook")
	public String updateBook(BookVO vo) {
		bookservice.updateBook(vo);
		return "redirect:getBookList";
	}
}