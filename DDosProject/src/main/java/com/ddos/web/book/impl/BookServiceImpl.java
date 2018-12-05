package com.ddos.web.book.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.book.BookService;
import com.ddos.web.book.BookVo;

@Service
public class BookServiceImpl implements BookService {

	@Autowired BookDaoMybatis bamb;

	@Override
	public BookVo getBook(BookVo bvo) {
		return bamb.getBook(bvo);
	}
	
	
	

}
