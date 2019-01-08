package com.ddos.web.book.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.book.WishBookService;
import com.ddos.web.book.WishBookVO;

@Service
public class WishBookServiceImpl implements WishBookService {

	@Autowired
	WishBookDAOMybatis wbd;

	// admin 계정
	// 전제 조회

	@Override
	public List<WishBookVO> adminWishBookList(WishBookVO vo) {
		return wbd.adminWishBookList(vo);
	}

	@Override
	public WishBookVO adminWishBookDetail(WishBookVO vo) {
		return wbd.adminWishBookDetail(vo);
	}

	@Override
	public void adminInsertWishBook(WishBookVO vo) {
		wbd.adminInsertWishBook(vo);
	}

	@Override
	public void adminUpdateWishBook(WishBookVO vo) {
		wbd.adminUpdateWishBook(vo);
	}

	@Override
	public void adminDeleteWishBook(WishBookVO vo) {
		wbd.adminDeleteWishBook(vo);
	}

	@Override
	public void adminDeleteWishBookList(WishBookVO vo) {
		wbd.adminDeleteWishBookList(vo);
	}

	@Override
	public List<WishBookVO> getWishBookList(WishBookVO vo) {
		return wbd.getWishBookList(vo);
	}

	@Override
	public WishBookVO getWishBook(WishBookVO vo) {
		return wbd.getWishBook(vo);
	}

	@Override
	public void insertWishBook(WishBookVO vo) {
		wbd.insertWishBook(vo);

	}

	// 전체 건수
	@Override
	public int getCount(WishBookVO vo) {

		return wbd.getCount(vo);
	}
}
