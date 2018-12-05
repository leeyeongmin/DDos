package com.ddos.web.rental;

public class RentalVo {

	private int rentablNum;		//대출 반납 고유 번호
	private String rentalDate;	//대출일자
	private String returnDate;	//반납예정일
	private String dueDate;		//반납 날자
	private int rentalIsbn;		//isbn
	private String memberId;		//회원 id
	public int getRentablNum() {
		return rentablNum;
	}
	public void setRentablNum(int rentablNum) {
		this.rentablNum = rentablNum;
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
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public int getRentalIsbn() {
		return rentalIsbn;
	}
	public void setRentalIsbn(int rentalIsbn) {
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
		return "RentalVo [rentablNum=" + rentablNum + ", rentalDate=" + rentalDate + ", returnDate=" + returnDate
				+ ", dueDate=" + dueDate + ", rentalIsbn=" + rentalIsbn + ", memberId=" + memberId + "]";
	}
	
}
