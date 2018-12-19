package com.ddos.web.book.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.book.WishBookService;
import com.ddos.web.book.WishBookVO;

//희망도서 controller
@Controller
public class WishBookController {
	
	@Autowired
	WishBookService wishbookservice;
	
	@RequestMapping("getwishbooklist")
	public List<WishBookVO> getwishbooklist(WishBookVO vo){
		return wishbookservice.getWishBookList(vo);
	}
	

	

}
