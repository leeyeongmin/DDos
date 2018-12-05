package com.ddos.web.book;

public class BookVO {
	private int bookisbn;	//isbn
	private String bookTitle;	//도서명
	private String bookCont;	//도서 내용
	private String bookWriter;	//저자
	private String bookComp;	//출판사
	private String bookGenre;	//장르
	private int bookAmount;		//수량
	private String bookLoc;		//위치
	public int getIsbn() {
		return bookisbn;
	}
	public void setIsbn(int isbn) {
		this.bookisbn = isbn;
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
	@Override
	public String toString() {
		return "BookVo [bookisbn=" + bookisbn + ", bookTitle=" + bookTitle + ", bookCont=" + bookCont + ", bookWriter="
				+ bookWriter + ", bookComp=" + bookComp + ", bookGenre=" + bookGenre + ", bookAmount=" + bookAmount
				+ ", bookLoc=" + bookLoc + "]";
	}
	

	
}
