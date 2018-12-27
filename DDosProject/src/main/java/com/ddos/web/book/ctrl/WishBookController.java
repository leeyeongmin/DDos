package com.ddos.web.book.ctrl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ddos.web.book.WishBookService;
import com.ddos.web.book.WishBookVO;
import com.ddos.web.paging.PagingVO;

@Controller
public class WishBookController {  //희망도서 controller
	
	@Autowired
	WishBookService wishBookService;
	
	//admin
	//메인에서 희망으로
	/*@RequestMapping("adminwishbook")
	public String adminWishBookList(Model model, WishBookVO vo) {
		//vo.setLoginId(((UserVO)session.getAttribute("login")).getId());
		model.addAttribute("adminWishBookList", wishBookService.adminWishBookList(vo));
		System.out.println("컨트롤 희망도서 전체 조회");
		return "admin/book/adminWishBookList";
		
	}*/
	@RequestMapping(value = "adminWishBook")
	public ModelAndView adminWishBookList(Model model, WishBookVO vo, PagingVO paging) {
		ModelAndView mv = new ModelAndView();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(wishBookService.getCount(vo));
		mv.addObject("paging", paging);
		mv.addObject("adminWishBookList", wishBookService.adminWishBookList(vo));
		mv.setViewName("admin/book/adminWishBookList");
		return mv;
	}
	
	@RequestMapping("/adminWishBookDetail")
	public String adminWishBookDetail(Model model, WishBookVO vo) {
		model.addAttribute("wishbook", wishBookService.adminWishBookDetail(vo));
		System.out.println("컨트롤 희망도서 단건 조회");
		return "admin/book/adminWishBookDetail";
	}
	
	//희망도서 등록 폼
	@RequestMapping("adminInsertWishBookform")
	public String adminInsertWishBookform(Model model, WishBookVO vo) {
		System.out.println("희망도서 컨트롤 등록폼");
		return "admin/book/adminInsertWishBook";
	}
	
	//희망도서 등록처리
	@RequestMapping("/adminInsertWishBook")
	public String adminInsertWishBook(WishBookVO vo) {
		wishBookService.adminInsertWishBook(vo);
		System.out.println("희망도서 컨트롤 등록처리");
		return "redirect:adminwishbook";
	}
	
	
	//희망도서 수정폼
	@RequestMapping("adminUpdateWishBookform")
	public String adminUpdateWishBookform(Model model, WishBookVO vo) {
		model.addAttribute("wishbook", wishBookService.adminWishBookDetail(vo));
		System.out.println("희망도서 컨트롤 수정 폼");
		return "admin/book/adminUpdateWishBook";
	}
	//희망도서 수정처리
	@RequestMapping("adminUpdateWishBook")
	public String adminUpdateWishBook(WishBookVO vo) {
		System.out.println("희망도서 컨트롤 수정처리");
		System.out.println(vo);
		wishBookService.adminUpdateWishBook(vo);
		System.out.println("희망도서 컨트롤 수정처리2");
		//return "admin/book/adminWishBookList";
		return "redirect:adminwishbook";
	}
	
	//희망도서 삭제
	@RequestMapping("adminDeleteWishBook")
	public String adminDeleteWishBook(WishBookVO vo) {
		System.out.println(vo);
		wishBookService.adminDeleteWishBook(vo);
		System.out.println("희망도서 컨트롤 삭제");
		return "redirect:adminwishbook";
	}
	
	//희망도서 선택 삭제
	@RequestMapping("adminDeleteWishBookList")
	public String adminDeleteWishBookList(WishBookVO vo) {
		wishBookService.adminDeleteWishBookList(vo);
		System.out.println("희망도서 컨트롤 선택 삭제");
		return "admin/book/adminWishBookList";
	}

	// 메인에서  전체희망도서로
	@RequestMapping(value = "wishbook")
	public ModelAndView wishbook(Model model, WishBookVO vo, PagingVO paging) {
		ModelAndView mv = new ModelAndView();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(wishBookService.getCount(vo));
		mv.addObject("paging", paging);
		mv.addObject("getWishBookList", wishBookService.getWishBookList(vo));
		mv.setViewName("book/getWishBookList");
		return mv;
	}
	
/*	@RequestMapping("/wishbook")
	public String wishbook(Model model, WishBookVO vo, HttpSession session) {
		vo.setLoginId(((UserVO)session.getAttribute("login")).getId());
		model.addAttribute("wishBookList", wishBookService.getWishBookList(vo));
		return "book/getWishBookList";	
	}*/
	
	//희망도서 단건 조회
	@RequestMapping("/getWishBook")
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
	
	

}
