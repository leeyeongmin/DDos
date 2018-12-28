package com.ddos.web.rental.ctl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddos.web.rental.RentalService;
import com.ddos.web.rental.RentalVO;
import com.ddos.web.user.UserVO;

@Controller
public class RentalController {
	
	@Autowired 	RentalService rentalService;
	
	//메인에서 대출이력조회
	@RequestMapping("/rental")
	public String  rental(Model model, RentalVO vo, HttpSession session) {
		vo.setLoginId(((UserVO)session.getAttribute("login")).getId());
		model.addAttribute("getRentalList", rentalService.getRentalList(vo));
		System.out.println(vo);
		System.out.println("컨트롤 대출 이력 조회");
		return "rental/getRentalList";
	}
	// 도서 연장
	@RequestMapping("renewBook")
	@ResponseBody
	public void renewBook(RentalVO vo) {
		rentalService.renewBook(vo);
	}

	
	// 대출반납 전체 이력
	
	
	//대출
	@RequestMapping("/rentalBook")
	@ResponseBody
	public void rentalBook(RentalVO vo) {
		rentalService.rentalBook(vo);
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
	
	//반납
	@RequestMapping("returnBook")
	@ResponseBody
	public void ReturnBook(RentalVO vo) {
		rentalService.returnBook(vo);
	}
	

	
	

}
