package com.ddos.web.assets;

public class AssetsVO {
	private int assetsNum;
	private String assetsSeparation;
	private int assetsPrice;
	private String assetsDate;
	private String assetsCont;
	private String assetsDetail;
	private String memberId;
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
	public String getAssetsDetail() {
		return assetsDetail;
	}
	public void setAssetsDetail(String assetsDetail) {
		this.assetsDetail = assetsDetail;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "AssetsVO [assetsNum=" + assetsNum + ", assetsSeparation=" + assetsSeparation + ", assetsPrice="
				+ assetsPrice + ", assetsDate=" + assetsDate + ", assetsCont=" + assetsCont + ", assetsDetail="
				+ assetsDetail + ", memberId=" + memberId + "]";
	}

	

	
	
	
}
