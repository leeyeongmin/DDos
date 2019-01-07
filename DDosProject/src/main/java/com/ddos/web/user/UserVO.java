package com.ddos.web.user;

public class UserVO {

	private String id;
	private String password;
	private String name;
	private String phone;
	private String birth;
	private String expDate;
	private String memSeparation;
	private int outCount;
	private String address;
	private String gender;
	
	private int rentalCount;
	private int readCount;
	private int reviewCount;
	

	// 검색
	private String searchType;
	private String searchUserKeyword;
	
	//정렬
	private String sortCol;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getExpDate() {
		return expDate;
	}
	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}
	public String getMemSeparation() {
		return memSeparation;
	}
	public void setMemSeparation(String memSeparation) {
		this.memSeparation = memSeparation;
	}
	public int getOutCount() {
		return outCount;
	}
	public void setOutCount(int outCount) {
		this.outCount = outCount;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchUserKeyword() {
		return searchUserKeyword;
	}
	public void setSearchUserKeyword(String searchUserKeyword) {
		this.searchUserKeyword = searchUserKeyword;
	}
	
	
	public String getSortCol() {
		return sortCol;
	}
	public void setSortCol(String sortCol) {
		this.sortCol = sortCol;
	}
	
	
	
	
	public int getRentalCount() {
		return rentalCount;
	}
	public void setRentalCount(int rentalCount) {
		this.rentalCount = rentalCount;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", phone=" + phone + ", birth="
				+ birth + ", expDate=" + expDate + ", memSeparation=" + memSeparation + ", outCount=" + outCount
				+ ", address=" + address + ", gender=" + gender + "]";
	}
	
	
	
}
