package com.ddos.web.book;

public class WishBookVO {

	private int wishNum;	
	private String isbn;	//isbn
	private String wishTitle;	//희망도서명
	private String wishWriter;	//희망도서 저자
	private String wishComp;	//희망도서 출판사
	private String wishGenre;	//희망도서 장르
	private String memberId;	//회원id
	private String wishReason;	//신청 사유
	private String wishStatus;	// 신청상태 : 신청중, 주문중, 취소, 처리완료 
	private int wishPrice;	//희망도서 가격
	private String loginId;
	
	// 검색
	private String searchCondition;
	private String searchKeyword;
	
	//페이징 처리
	private int First;
	private int Last;
	
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
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
	
	public String getWishStatus() {
		return wishStatus;
	}
	public void setWishStatus(String wishStatus) {
		this.wishStatus = wishStatus;
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
				+ ", wishReason=" + wishReason + ", wishStatus=" + wishStatus + ", wishPrice=" + wishPrice
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}

	
	
}
