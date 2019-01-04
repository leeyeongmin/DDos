package com.ddos.web.rental.ctl;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ddos.web.paging.PagingVO;
import com.ddos.web.rental.RentalService;
import com.ddos.web.rental.RentalVO;
import com.ddos.web.user.UserVO;

@Controller
public class RentalController {
	
	@Autowired 	RentalService rentalService;
	
	//메인에서 대출이력조회
	/*@RequestMapping("/rental")
	public String getRentalList(Model model, RentalVO vo, HttpSession session) {
		vo.setLoginId(((UserVO)session.getAttribute("login")).getId());
		model.addAttribute("getRentalList", rentalService.getRentalList(vo));
		model.addAttribute("getHistoryList", rentalService.getHistoryList(vo));
		System.out.println(vo);
		System.out.println("컨트롤 대출 이력 조회");
		return "rental/getRentalList";
	}*/
	@RequestMapping("/rental")
	public ModelAndView getRentalList(Model model, RentalVO vo, HttpSession session, PagingVO paging) {
		vo.setLoginId(((UserVO)session.getAttribute("login")).getId());
		ModelAndView mv = new ModelAndView();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(rentalService.getCount(vo));
		mv.addObject("paging", paging);
		mv.addObject("getRentalList", rentalService.getRentalList(vo));
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

	
	// 대출반납 전체 이력
	/*@RequestMapping("getHistoryList")
	public String getHistoryList(Model model, RentalVO vo, HttpSession session) {
		vo.setLoginId(((UserVO)session.getAttribute("login")).getId());
		model.addAttribute("getHistoryList", rentalService.getHistoryList(vo));
		System.out.println(vo);
		System.out.println("컨트롤 대출반납 히스토리 조회");
		return "rental/getRentalList";
	}*/
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

		paging.setTotalRecord(rentalService.getCount(vo));
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
	@RequestMapping("rentalSearch")
	@ResponseBody
	public List<RentalVO> rental_search(RentalVO vo){
		return rentalService.rentalSearch(vo);
	}
	
	/*//반납 리스트
		@RequestMapping(value="rentalSearch", method = RequestMethod.POST)
		@ResponseBody
		public Map rental_search(RentalVO vo,  PagingVO paging){
			HashMap map = new HashMap();
			  if (paging.getPage() == null) {
			         paging.setPage(1);
			      }
			  paging.setPageUnit(10);
		      
		      vo.setFirst(paging.getFirst());
		      vo.setLast(paging.getLast());
		      
		      paging.setTotalRecord(rentalService.getCount(vo));
		      map.put("paging", paging);
		      map.put("result", rentalService.rentalSearch());
			
			  return map;

		}*/
	
	//반납
	@RequestMapping("returnBook")
	@ResponseBody
	public void ReturnBook(RentalVO vo) {
		rentalService.returnBook(vo);
	}
	

	
	

}
