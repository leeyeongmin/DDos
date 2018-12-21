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
	
	//admin에서 희망도서 전체 조회
	public List<WishBookVO> adminWishBookList(WishBookVO vo) {
		System.out.println("admin 마이바티스 전체조회실행");
		return mybatis.selectList("wishbook.adminWishBookList", vo);
	}
	
	
	//단권 조회
		public WishBookVO adminWishBookDetail(WishBookVO vo) {
			System.out.println("admin 희망도서  mybatis 단건 조회 실행");
			return mybatis.selectOne("wishbook.adminWishBookDetail", vo);
		}

		//희망도서 입력
		public void adminInsertWishBook(WishBookVO vo) {
			System.out.println("admin  희망도서 mybatis 입력 실행");;
			mybatis.update("wishbook.adminInsertWishBook", vo); 
		}
		
		//희망도서 수정
		public void adminUpdateWishBook(WishBookVO vo) {
			System.out.println(vo);
			System.out.println("admin 희망도서 mybatis 수정 실행");
			mybatis.update("wishbook.adminUpdateWishBook", vo);
		}
		
		//희망도서 삭제
		public void adminDeleteWishBook(WishBookVO vo) {
			System.out.println("admin  희망도서 mybatis 삭제 실행");
			mybatis.delete("wishbook.adminDeleteWishBook", vo);
		}
		//희망도서 선택 삭제
		public void adminDeleteWishBookList(WishBookVO vo) {
			System.out.println("admin  희망도서 mybatis 선택 삭제 실행");
			mybatis.delete("wishbook.adminDeleteWishBookList", vo);
		}

		
	
	//user
	//희망도서 전체 조회
	public List<WishBookVO> getWishBookList(WishBookVO vo){
		System.out.println("희망도서 mybatis 전체 조회 실행");
		return mybatis.selectList("wishbook.getWishBookList", vo);
	}
	
	
	
	//단권 조회
	public WishBookVO getWishBook(WishBookVO vo) {
		System.out.println("희망도서 mybatis 단건 조회 실행");
		return mybatis.selectOne("wishbook.getWishBook", vo);
	}

	//희망도서 입력
	public void insertWishBook(WishBookVO vo) {
		System.out.println("희망도서 mybatis 입력 실행");;
		mybatis.update("wishbook.insertWishBook", vo); 
	}
	
	/*//희망도서 수정
	public void updateWishBook(WishBookVO vo) {
		System.out.println(vo);
		System.out.println("희망도서 mybatis 수정 실행");
		mybatis.update("wishbook.updateWishBook", vo);
	}
	
	//희망도서 삭제
	public void deleteWishbook(WishBookVO vo) {
		System.out.println("희망도서 mybatis 삭제 실행");
		mybatis.delete("wishbook.deleteWishBook", vo);
	}
	//희망도서 선택 삭제
	public void deleteWishBookList(WishBookVO vo) {
		System.out.println("희망도서 mybatis 선택 삭제 실행");
		mybatis.delete("wishbook.deleteWishBookList", vo);
	}

	*/
}
