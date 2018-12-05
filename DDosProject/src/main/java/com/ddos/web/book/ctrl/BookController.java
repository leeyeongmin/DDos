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

	// 1건 조회
	@RequestMapping("/book")
	public String getBook(Model model, BookVO bvo) {
		model.addAttribute("book", bookservice.getBook(bvo));
		return "book/getBook";
	}

	/*@RequestMapping("/booklist")
	public String getBookList(Model model, BookVo bvo) {
		model.addAttribute("booklist", bookservice.getBookList(bvo));
		return "book/getBookList";
<<<<<<< HEAD
	}*/

}
