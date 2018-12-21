package com.ddos.web.book;

import java.util.List;

public interface BookService {
	
	// 전체 조회
	public List<BookVO> getBookList(BookVO vo);
	
	// 1건 조회
	public BookVO getBook(BookVO vo);
	
	// 도서 입력
	public void insertBook(BookVO vo);
	
	// 도서 수정
	public void updateBook(BookVO vo);
	
	// 전체 건수
	public int getCount(BookVO vo);
	

}
