package com.ddos.web.book.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping
public class BookDaoMybatis {

	@Autowired
	private SqlSessionTemplate Bbatis;
	
	public void rkei(){
		
	}
}
