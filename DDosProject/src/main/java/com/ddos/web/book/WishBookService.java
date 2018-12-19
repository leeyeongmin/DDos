package com.ddos.web.book;

import java.util.List;

public interface WishBookService {

		//희망도서 전체 조회
		public List<WishBookVO> getWishBookList(WishBookVO vo);
		
		// 희망도서 1건 조회
		public BookVO getWishBook(WishBookVO vo);
		
		//희망 도서 입력
		public void insertWishBook(WishBookVO vo);
		
		//희망 도서 수정
		public void updateWishBook(WishBookVO vo);

		//희망도서 삭제
		public void deleteWishBook(WishBookVO rvo);
		
	
}
