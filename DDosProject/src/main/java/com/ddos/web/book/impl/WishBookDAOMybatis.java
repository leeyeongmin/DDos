package com.ddos.web.book.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.book.WishBookVO;

@Repository
public class WishBookDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//희망도서 전체 조회
	public List<WishBookVO> getWishBookList(WishBookVO vo){
		System.out.println("희망도서 mybatis 전체 조회 실행");
		return mybatis.selectList("wishbook.getWishBookList", vo);
	}
}
