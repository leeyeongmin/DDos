package com.ddos.web.book.ctrl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.book.WishBookService;
import com.ddos.web.book.WishBookVO;
import com.ddos.web.user.UserVO;


@Controller
public class WishBookController {  //희망도서 controller
	
	@Autowired
	WishBookService wishBookService;
	

	// 메인에서  전체희망도서로
	@RequestMapping("/wishbook")
	public String wishbook(Model model, WishBookVO vo, HttpSession session) {
		vo.setLoginId(((UserVO)session.getAttribute("login")).getId());
		model.addAttribute("wishBookList", wishBookService.getWishBookList(vo));
		return "book/getWishBookList";
		
	}
	
	/*// 희망도서 전체 조회
	@RequestMapping("/getWishBookList" )
	public String getWishBookList(Model model, WishBookVO vo) {
		model.addAttribute("wishBookList", wishBookService.getWishBookList(vo));
		System.out.println("컨트롤 희망도서 전체 조회");
		return "book/getWishBookList";

	}*/
	
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
		return "redirect:wishbook";
	}
	
	
	//희망도서 수정폼
	@RequestMapping("updateWishBookform")
	public String updateWishBookform(Model model, WishBookVO vo) {
		model.addAttribute("wishbook", wishBookService.getWishBook(vo));
		System.out.println("희망도서 컨트롤 수정 폼");
		return "book/updateWishBook";
	}
	//희망도서 수정처리
	@RequestMapping("updateWishBook")
	public String updateWishBook(WishBookVO vo) {
		wishBookService.updateWishBook(vo);
		System.out.println(vo);
		System.out.println("희망도서 컨트롤 수정처리");
		return "redirect:wishbook";
	}
	
	//희망도서 삭제
	@RequestMapping("deleteWishBook")
	public String deleteWishBook(WishBookVO vo) {
		wishBookService.deleteWishBook(vo);
		System.out.println("희망도서 컨트롤 삭제");
		return "redirect:wishbook";
	}
	
	//희망도서 선택 삭제
	@RequestMapping("deleteWishBookList")
	public String deleteWishBookList(WishBookVO vo) {
		wishBookService.deleteWishBookList(vo);
		System.out.println("희망도서 컨트롤 선택 삭제");
		return "redirenct:wishbook";
	}
}
