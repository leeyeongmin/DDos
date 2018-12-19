package com.ddos.web.book.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.book.BookVO;
import com.ddos.web.book.WishBookService;
import com.ddos.web.book.WishBookVO;

@Service
public class WishBookServiceImpl implements WishBookService {

	@Autowired WishBookDAOMybatis wbd;
	
	//전체 조회
	
	@Override
	public List<WishBookVO> getWishBookList(WishBookVO vo){
		return wbd.getWishBookList(vo);
	}

	@Override
	public BookVO getWishBook(WishBookVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertWishBook(WishBookVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateWishBook(WishBookVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteWishBook(WishBookVO rvo) {
		// TODO Auto-generated method stub
		
	}
}
