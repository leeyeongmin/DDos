package com.ddos.web.event;

public class EventVO {
	
	private String eventNum;
	private String eventTitle;
	private String eventCont;
	private String startDate;
	private String endDate;
	private String writeDate;
	private String memberId;
	public String getEventNum() {
		return eventNum;
	}
	public void setEventNum(String eventNum) {
		this.eventNum = eventNum;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getEventCont() {
		return eventCont;
	}
	public void setEventCont(String eventCont) {
		this.eventCont = eventCont;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "EventVO [eventNum=" + eventNum + ", eventTitle=" + eventTitle + ", eventCont=" + eventCont
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", writeDate=" + writeDate + ", memberId="
				+ memberId + "]";
	}
	
	
	
}
