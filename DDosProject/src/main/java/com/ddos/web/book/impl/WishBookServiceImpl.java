package com.ddos.web.book.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.book.WishBookService;
import com.ddos.web.book.WishBookVO;

@Service
public class WishBookServiceImpl implements WishBookService {

	@Autowired WishBookDAOMybatis wbd;
	private WishBookVO vo;
	
	//전체 조회
	@Override
	public List<WishBookVO> getWishBookList(WishBookVO vo){
		return wbd.getWishBookList(vo);
	}
	
	// 단건조회
	@Override
	public  WishBookVO getWishBook(WishBookVO vo) {
		return wbd.getWishBook(vo);
	}

	//희망도서 등록
	@Override
	public void insertWishBook(WishBookVO vo) {
		wbd.insertWishBook(vo);
	}

	//희망도서 등록
	@Override
	public void updateWishBook(WishBookVO vo) {
		wbd.updateWishBook(vo);
	}

	//희망도서 삭제
	@Override
	public void deleteWishBook(WishBookVO rvo) {
		wbd.deleteWishbook(vo);
		
	}

	@Override
	public void deleteWishBookList(WishBookVO vo) {
		wbd.deleteWishBookList(vo);
		
	}
}
