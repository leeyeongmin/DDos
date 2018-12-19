package com.ddos.web.book;

public class ReviewVO {

	private String isbn;	//도서 isbn
	private String reviewTitle;	//리뷰 제목
	private String reviewCont; //리뷰 내용
	private int reviewPoint;	//별점
	private String memberId;	//회원id
	private int pageUnit;	//페이징처리
	private int reviewNum;
	private String reviewDate;
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewCont() {
		return reviewCont;
	}
	public void setReviewCont(String reviewCont) {
		this.reviewCont = reviewCont;
	}
	public int getReviewPoint() {
		return reviewPoint;
	}
	public void setReviewPoint(int reviewPoint) {
		this.reviewPoint = reviewPoint;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	@Override
	public String toString() {
		return "ReviewVO [isbn=" + isbn + ", reviewTitle=" + reviewTitle + ", reviewCont=" + reviewCont
				+ ", reviewPoint=" + reviewPoint + ", memberId=" + memberId + ", pageUnit=" + pageUnit + ", reviewNum="
				+ reviewNum + ", reviewDate=" + reviewDate + "]";
	}

}