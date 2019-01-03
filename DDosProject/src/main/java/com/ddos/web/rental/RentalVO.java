package com.ddos.web.rental;

public class RentalVO {

	private int rentalNum;
	private String rentalDate;
	private String returnDate;
	private String isbn;
	private String memberId;
	private String loginId;
	private String dueDate;
	private String renewCnt;
	
	private String searchTitle;
	private String searchKeyword;
	private String bookTitle;
	
	//
	private String bookWriter;
	private String bookComp;
	//
	
	private int money;
	private int overdue;
	

	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getOverdue() {
		return overdue;
	}
	public void setOverdue(int overdue) {
		this.overdue = overdue;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public String getRenewCnt() {
		return renewCnt;
	}
	public void setRenewCnt(String renewCnt) {
		this.renewCnt = renewCnt;
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
	//
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getSearchTitle() {
		return searchTitle;
	}
	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public int getRentalNum() {
		return rentalNum;
	}
	public void setRentalNum(int rentalNum) {
		this.rentalNum = rentalNum;
	}
	public String getRentalDate() {
		return rentalDate;
	}
	public void setRentalDate(String rentalDate) {
		this.rentalDate = rentalDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	//
	@Override
	public String toString() {
		return "RentalVO [rentalNum=" + rentalNum + ", rentalDate=" + rentalDate + ", returnDate=" + returnDate
				+ ", isbn=" + isbn + ", memberId=" + memberId + ", loginId=" + loginId + ", dueDate=" + dueDate
				+ ", searchTitle=" + searchTitle + ", searchKeyword=" + searchKeyword + ", bookTitle=" + bookTitle
				+ ", bookWriter=" + bookWriter + ", bookComp=" + bookComp + "]";
	}

	
}
