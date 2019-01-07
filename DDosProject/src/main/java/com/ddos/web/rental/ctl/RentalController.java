package com.ddos.web.rental.ctl;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ddos.web.paging.PagingVO;
import com.ddos.web.rental.RentalService;
import com.ddos.web.rental.RentalVO;
import com.ddos.web.user.UserVO;

@Controller
public class RentalController {
	
	@Autowired 	RentalService rentalService;
	
	
	@RequestMapping("/rental")
	public ModelAndView getRentalList(Model model, RentalVO vo, HttpSession session, PagingVO paging, @RequestParam(value="page1", defaultValue="1", required=false) Integer page1) {
		vo.setLoginId(((UserVO)session.getAttribute("login")).getId());
		ModelAndView mv = new ModelAndView();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		paging.setTotalRecord(rentalService.rCount(vo));
		mv.addObject("paging", paging);
		mv.addObject("getRentalList", rentalService.getRentalList(vo));
		
		
		PagingVO paging1 = new PagingVO();
		paging1.setPage(page1);
		paging1.setPageUnit(10);
		vo.setFirst(paging1.getFirst());
		vo.setLast(paging1.getLast());
		paging1.setTotalRecord(rentalService.hCount(vo));
		mv.addObject("paging1", paging1);
		mv.addObject("getHistoryList", rentalService.getHistoryList(vo));
		
		mv.setViewName("rental/getRentalList");
		return mv;
	}
	
	
	// 도서 연장
	@RequestMapping("renewBook")
	@ResponseBody
	public Map renewBook(RentalVO vo) {
		rentalService.renewBook(vo);
		return Collections.emptyMap();
	}

	
	@RequestMapping("getHistoryList")
	public ModelAndView getHistoryList(Model model, RentalVO vo, HttpSession session,  PagingVO paging) {
		vo.setLoginId(((UserVO)session.getAttribute("login")).getId());
		ModelAndView mv = new ModelAndView();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(rentalService.hCount(vo));
		mv.addObject("paging", paging);
		mv.addObject("getHistoryList", rentalService.getHistoryList(vo));
		mv.setViewName("rental/getRentalList");
		return mv;
	}
	
	
	//대출
	@RequestMapping("/rentalBook")
	@ResponseBody
	public String rentalBook(RentalVO vo) {
		rentalService.rentalBook(vo); 
		System.out.println("--------------------" + vo.getOverck());
		/*return Collections.emptyMap();*/
		return "{\"result\":\""+vo.getOverck()+"\"}";
	}
	
	//반납페이지로
	@RequestMapping("adminreturn")
	public String adminreturn() {
		return "admin/rental/ReturnBook";
	}
	
	
	//반납 리스트
	/*@RequestMapping("rentalSearch")
	@ResponseBody
	public List<RentalVO> rental_search(RentalVO vo){
		return rentalService.rentalSearch(vo);
	}
	*/
	@RequestMapping("rentalSearch")
	@ResponseBody
	public ModelAndView rental_search(Model model, RentalVO vo, PagingVO paging) {
		
		ModelAndView mv = new ModelAndView();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(rentalService.tCount(vo));
		mv.addObject("paging", paging);
		mv.addObject("rentalSearch", rentalService.rentalSearch(vo));
		mv.setViewName("admin/rental/ReturnBook");
		return mv;
		
	}
	
	
	//반납
	@RequestMapping("returnBook")
	@ResponseBody
	public void ReturnBook(RentalVO vo) {
		rentalService.returnBook(vo);
	}
}
