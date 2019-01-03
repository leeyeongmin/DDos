package com.ddos.web.assets;

public class AssetsVO {
	private int assetsNum;
	private String assetsSeparation;
	private int assetsPrice;
	private String assetsDate;
	private String assetsCont;
	private String contDetail;
	private String memberId;
	private int rentalNum;
	
	// 검색
	private String searchCondition;
	private String searchKeyword;

	// 페이징 처리
	private int First;
	private int Last;
	public int getAssetsNum() {
		return assetsNum;
	}
	public void setAssetsNum(int assetsNum) {
		this.assetsNum = assetsNum;
	}
	public String getAssetsSeparation() {
		return assetsSeparation;
	}
	public void setAssetsSeparation(String assetsSeparation) {
		this.assetsSeparation = assetsSeparation;
	}
	public int getAssetsPrice() {
		return assetsPrice;
	}
	public void setAssetsPrice(int assetsPrice) {
		this.assetsPrice = assetsPrice;
	}
	public String getAssetsDate() {
		return assetsDate;
	}
	public void setAssetsDate(String assetsDate) {
		this.assetsDate = assetsDate;
	}
	public String getAssetsCont() {
		return assetsCont;
	}
	public void setAssetsCont(String assetsCont) {
		this.assetsCont = assetsCont;
	}
	public String getContDetail() {
		return contDetail;
	}
	public void setContDetail(String contDetail) {
		this.contDetail = contDetail;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getRentalNum() {
		return rentalNum;
	}
	public void setRentalNum(int rentalNum) {
		this.rentalNum = rentalNum;
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
	@Override
	public String toString() {
		return "AssetsVO [assetsNum=" + assetsNum + ", assetsSeparation=" + assetsSeparation + ", assetsPrice="
				+ assetsPrice + ", assetsDate=" + assetsDate + ", assetsCont=" + assetsCont + ", contDetail="
				+ contDetail + ", memberId=" + memberId + ", rentalNum=" + rentalNum + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword + ", First=" + First + ", Last=" + Last + "]";
	}

	
	
	
}