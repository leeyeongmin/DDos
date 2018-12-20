package com.ddos.web.book.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.book.BookService;
import com.ddos.web.book.BookVO;

@Service
public class BookServiceImpl implements BookService {

	@Autowired BookDAOMybatis dab;


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

	// 도서 등록
	public void insertBook(BookVO vo) {
		dab.insertBook(vo);
	}
	// 도서 수정
	public void updateBook(BookVO vo) {
		dab.updateBook(vo);

	}
	
	@Override
	public int getCount(BookVO vo) {
		return dab.getCount(vo);
	}
}
	
	
	



