package com.ddos.web.book.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.book.BookService;
import com.ddos.web.book.BookVO;

@Service
public class BookServiceImpl implements BookService {

	@Autowired BookDAOMybatis dab;

// admin
	//전체 조회
	
	@Override
	public List<BookVO> adminGetBookList(BookVO vo) {
		return dab.adminGetBookList(vo);
	}
	
	// 건수
	@Override
	public BookVO adminGetBook(BookVO vo) {
		return dab.adminGetBook(vo);
	}

	//입력
	@Override
	public void adminInsertBook(BookVO vo) {
		dab.adminInsertBook(vo);
		
	}
	//수정
	@Override
	public void adminUpdateBook(BookVO vo) {
		dab.adminUpdateBook(vo);
	}

	// 전체 조회
	@Override
	public List<BookVO> getBookList(BookVO vo) {
		return dab.getBookList(vo);
	}

	// 한건 조회
	@Override
	public BookVO getBook(BookVO vo) {
		return dab.getBook(vo);

	}

	
	
	@Override
	public int getCount(BookVO vo) {
		return dab.getCount(vo);
	}

	
		
}
	
	
	



