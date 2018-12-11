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
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", phone=" + phone + ", birth="
				+ birth + ", expDate=" + expDate + ", memSeparation=" + memSeparation + ", outCount=" + outCount + "]";
	}
	
	
}
