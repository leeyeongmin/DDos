package com.ddos.web.book.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ddos.web.book.BookVO;

@Repository
public class BookDaoMybatis {

	@Autowired
	private SqlSessionTemplate Bbatis;
	
	//1건조회
	public BookVO getBook(BookVO bvo){
		System.out.println("bookdaomybatis getbook 실행");
		return Bbatis.selectOne("book.getBook", bvo);
		
	}
}
