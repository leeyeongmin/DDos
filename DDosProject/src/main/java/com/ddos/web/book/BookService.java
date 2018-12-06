package com.ddos.web.book;

import java.util.List;

public interface BookService {
	
	// 전체 조회
	public List<BookVO> getBookList(BookVO vo);
	
	// 1건 조회
	public BookVO getBook(BookVO vo);
	
	

}
