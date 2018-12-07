package com.ddos.web.read;

import java.sql.Date;

public class UserReadVO {
	private String readingroomNum;
	private Date endTime;
	private String memberId;
	private String seatNum;
	private Date startTime;
	
	public String getReadingroomNum() {
		return readingroomNum;
	}
	public void setReadingroomNum(String readingroomNum) {
		this.readingroomNum = readingroomNum;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

}
