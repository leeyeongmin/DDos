package com.ddos.web.book;

public class BookVo {
	private int isbn;
	private String bookTitle;
	private String bookCont;
	private String bookWriter;
	private String bookComp;
	private String bookGenre;
	private int bookAmount;
	private String bookLoc;
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
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
	
	@Override
	public String toString() {
		return "BookVo [isbn=" + isbn + ", bookTitle=" + bookTitle + ", bookCont=" + bookCont + ", bookWriter="
				+ bookWriter + ", bookComp=" + bookComp + ", bookGenre=" + bookGenre + ", bookAmount=" + bookAmount
				+ ", bookLoc=" + bookLoc + "]";
	} 
 
	
}
