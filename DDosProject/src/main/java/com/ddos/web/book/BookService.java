package com.ddos.web.book;

import java.util.List;

public interface BookService {
	
	//admin
	// 전체 조회
	public List<BookVO> adminGetBookList(BookVO vo);
	
	//1건 조회
	public BookVO adminGetBook(BookVO vo);
	
	// 도서 입력
	public void adminInsertBook(BookVO vo);
	
	// 도서 수정
	public void adminUpdateBook(BookVO vo);
	

	//user
	// 전체 조회
	public List<BookVO> getBookList(BookVO vo);
	
	// 1건 조회
	public BookVO getBook(BookVO vo);
	
	// 전체 건수
	public int getCount(BookVO vo);

	//도서 이미지
	public List<BookVO> apiBookList(String keyword, int display, int start);	

	//인기도서 
	public List<BookVO> topBookList(BookVO vo);
}
