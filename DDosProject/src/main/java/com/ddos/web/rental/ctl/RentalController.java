package com.ddos.web.rental.ctl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.rental.RentalService;
import com.ddos.web.rental.RentalVO;
import com.ddos.web.user.UserVO;

@Controller
public class RentalController {
	
	@Autowired
	RentalService rentalService;
	
	//메인에서 대출이력조회
	@RequestMapping("/rental")
	public String  rental(Model model, RentalVO vo, HttpSession session) {
		vo.setLoginId(((UserVO)session.getAttribute("login")).getId());
		model.addAttribute("getRentalList", rentalService.getRentalList(vo));
		System.out.println(vo);
		System.out.println("대출 이력 조회");
		return "rental/getRentalList";
	}
	
	// 현황조회?
	
	

}
