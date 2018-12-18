package com.ddos.web.book;

public class WishBookVO {

	private int wishNum;
	private String isbn;
	private String wishTitle;
	private String wishWriter;
	private String wishComp;
	private String wishGenre;
	private String memberId;
	private String wishReason;
	private String wishStarus;
	private int wishPrice;
	
	public int getWishNum() {
		return wishNum;
	}
	public void setWishNum(int wishNum) {
		this.wishNum = wishNum;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getWishTitle() {
		return wishTitle;
	}
	public void setWishTitle(String wishTitle) {
		this.wishTitle = wishTitle;
	}
	public String getWishWriter() {
		return wishWriter;
	}
	public void setWishWriter(String wishWriter) {
		this.wishWriter = wishWriter;
	}
	public String getWishComp() {
		return wishComp;
	}
	public void setWishComp(String wishComp) {
		this.wishComp = wishComp;
	}
	public String getWishGenre() {
		return wishGenre;
	}
	public void setWishGenre(String wishGenre) {
		this.wishGenre = wishGenre;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getWishReason() {
		return wishReason;
	}
	public void setWishReason(String wishReason) {
		this.wishReason = wishReason;
	}
	public String getWishStarus() {
		return wishStarus;
	}
	public void setWishStarus(String wishStarus) {
		this.wishStarus = wishStarus;
	}
	public int getWishPrice() {
		return wishPrice;
	}
	public void setWishPrice(int wishPrice) {
		this.wishPrice = wishPrice;
	}
	@Override
	public String toString() {
		return "WishBookVO [wishNum=" + wishNum + ", isbn=" + isbn + ", wishTitle=" + wishTitle + ", wishWriter="
				+ wishWriter + ", wishComp=" + wishComp + ", wishGenre=" + wishGenre + ", memberId=" + memberId
				+ ", wishReason=" + wishReason + ", wishStarus=" + wishStarus + ", wishPrice=" + wishPrice + "]";
	}
	
	
}
