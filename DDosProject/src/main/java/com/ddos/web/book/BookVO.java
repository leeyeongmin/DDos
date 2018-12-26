package com.ddos.web.book;

public class BookVO {
	private String isbn; // isbn
	private String bookTitle; // 도서명
	private String bookCont; // 도서 내용
	private String bookWriter; // 저자
	private String bookComp; // 출판사
	private String bookGenre; // 장르
	private int bookAmount; // 수량
	private String bookLoc; // 위치
	private String dueDate;
	private String loginId;


	// 검색
	private String searchCondition;
	private String searchKeyword;
	
	// 페이징 처리
	private int First;
	private int Last;

	public int getFirst() {
		return First;
	}

	public void setFirst(int first) {
		First = first;
	}

	public int getLast() {
		return Last;
	}

	public void setLast(int last) {
		Last = last;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBookCont() {
		return bookCont;
	}

	public void setBookCont(String bookCont) {
		this.bookCont = bookCont;
	}

	public String getBookWriter() {
		return bookWriter;
	}

	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}

	public String getBookComp() {
		return bookComp;
	}

	public void setBookComp(String bookComp) {
		this.bookComp = bookComp;
	}

	public String getBookGenre() {
		return bookGenre;
	}

	public void setBookGenre(String bookGenre) {
		this.bookGenre = bookGenre;
	}

	public int getBookAmount() {
		return bookAmount;
	}

	public void setBookAmount(int bookAmount) {
		this.bookAmount = bookAmount;
	}

	public String getBookLoc() {
		return bookLoc;
	}

	public void setBookLoc(String bookLoc) {
		this.bookLoc = bookLoc;
	}


	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	@Override
	public String toString() {
		return "BookVO [Isbn=" + isbn + ", bookTitle=" + bookTitle + ", bookCont=" + bookCont + ", bookWriter="
				+ bookWriter + ", bookComp=" + bookComp + ", bookGenre=" + bookGenre + ", bookAmount=" + bookAmount
				+ ", bookLoc=" + bookLoc + "]";
	}

}