package com.ddos.web.rental;

public class RentalVO {

	private int rentalNum;
	private String rentalDate;
	private String returnDate;
	private int rentalIsbn;
	private String memberId;
	
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
	public int getRentalIsbn() {
		return rentalIsbn;
	}
	public void setrRntalIsbn(int rentalIsbn) {
		this.rentalIsbn = rentalIsbn;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "RentalVO [rentalNum=" + rentalNum + ", rentalDate=" + rentalDate + ", returnDate=" + returnDate
				+ ", rentalIsbn=" + rentalIsbn + ", memberId=" + memberId + "]";
	}
	
	
}
