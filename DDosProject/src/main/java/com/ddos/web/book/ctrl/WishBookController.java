package com.ddos.web.book.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ddos.web.book.WishBookService;
import com.ddos.web.book.WishBookVO;


@Controller
public class WishBookController {  //희망도서 controller
	
	@Autowired
	WishBookService wishBookService;
	

	// 메인에서 희망도서로
	@RequestMapping("wishbook")
	public String wishbook(Model model, WishBookVO vo) {
		model.addAttribute("wishBookList", wishBookService.getWishBookList(vo));
		return "book/getWishBookList";
		
	}
	
	// 희망도서 전체 조회
	@RequestMapping("getWishBookList" )
	public List<WishBookVO> getWishBookList(WishBookVO vo, HttpServletRequest request) {
		System.out.println("컨트롤 희망도서 전체 조회");
		return wishBookService.getWishBookList(vo);

	}
	
	//희망도서 단건 조회
	@RequestMapping("getWishBook")
	public String getWishBook(Model model, WishBookVO vo) {
		model.addAttribute("wishbook", wishBookService.getWishBook(vo));
		System.out.println("컨트롤 희망도서 단건 조회");
		return "book/getWishBook";
	}
	
	//희망도서 등록 폼
	@RequestMapping("insertWishBookform")
	public String insertWishBookform(Model model, WishBookVO vo) {
		System.out.println("희망도서 컨트롤 등록폼");
		return "book/insertWishBook";
	}
	
	//희망도서 등록처리
	@RequestMapping("insertWishBook")
	public String insertWishBook(WishBookVO vo) {
		wishBookService.insertWishBook(vo);
		System.out.println("희망도서 컨트롤 등록처리");
		return "book/getWishBookList";
	}
	
	
	//희망도서 수정폼
	@RequestMapping("updateWishBookform")
	public String updateWishBookform(Model model, WishBookVO vo) {
		model.addAttribute("wishbook", wishBookService.getWishBook(vo));
		return "book/updateWishBook";
	}
	//희망도서 수정처리
	@RequestMapping("updateWishBook")
	public String updateWishBook(WishBookVO vo) {
		wishBookService.updateWishBook(vo);
		return "book/getWishBookList";
	}
	
	//희망도서 삭제
	@RequestMapping("deleteWishBook")
	public String deleteWishBook(WishBookVO vo) {
		wishBookService.deleteWishBook(vo);
		return "book/getwishBookList";
	}
	
	//희망도서 선택 삭제
	@RequestMapping("deleteWishBookList")
	public String deleteWishBookList(WishBookVO vo) {
		wishBookService.deleteWishBookList(vo);
		return "book/getWishBookList";
	}
}
