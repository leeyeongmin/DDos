package com.ddos.web.book;

public class ReviewVO {

	private int isbn;	//도서 isbn
	private String reviewTitle;	//리뷰 제목
	private int reviewPoint;	//별점
	private String reviewId;	//회원id
	private int pageUnit;	//페이징처리

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public int getReviewPoint() {
		return reviewPoint;
	}

	public void setReviewPoint(int reviewPoint) {
		this.reviewPoint = reviewPoint;
	}

	public String getReviewId() {
		return reviewId;
	}

	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}

	@Override
	public String toString() {
		return "ReviewVO [isbn=" + isbn + ", reviewTitle=" + reviewTitle + ", reviewPoint=" + reviewPoint
				+ ", reviewId=" + reviewId + "]";
	}
}
