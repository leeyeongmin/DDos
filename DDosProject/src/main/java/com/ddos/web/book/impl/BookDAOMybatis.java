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

	// 전체 조회
	public List<BookVO> getBookList(BookVO vo) {
		System.out.println("bMybatis getBookList 실행");
		return Mybatis.selectList("book.getBookList", vo);
	}

	// 1건조회
	public BookVO getBook(BookVO vo) {
		System.out.println("bMybatis getbook 실행");
		return Mybatis.selectOne("book.getBook", vo);

	}
}
