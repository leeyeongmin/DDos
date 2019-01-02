package com.ddos.web.book.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ddos.web.book.BookVO;

@Repository
public class BookDAOMybatis {

	@Autowired
	private SqlSessionTemplate Mybatis;

	// 전체 건수 조회
	public int getCount(BookVO vo) {
		return Mybatis.selectOne("book.getCount", vo);
	}
	// 전체 조회

	public List<BookVO> getBookList(BookVO vo) {
		System.out.println("Mybatis getBookList 실행");
		return Mybatis.selectList("book.getBookList", vo);
	}

	// 1건조회
	public BookVO getBook(BookVO vo) {
		System.out.println("Mybatis getbook 실행");
		return Mybatis.selectOne("book.getBook", vo);

	}

	// admin
	// 전체 조회
	public List<BookVO> adminGetBookList(BookVO vo) {
		System.out.println("Mybatis adminGetBookList 실행");
		return Mybatis.selectList("book.adminGetBookList", vo);
	}

	// 한건 조회
	public BookVO adminGetBook(BookVO vo) {
		System.out.println("Mybatis adminGetBook 실행");
		return Mybatis.selectOne("book.adminGetBook", vo);

	}
	// 도서 입력

	public void adminInsertBook(BookVO vo) {
		System.out.println("Mybatis adminInsertBook 실행");
		Mybatis.update("book.adminInsertBook", vo);
	}

	// 도서 수정
	public void adminUpdateBook(BookVO vo) {
		System.out.println("Mybatis adminUpdateBook 실행");
		Mybatis.update("book.adminUpdateBook", vo);

	}

}
