package com.ddos.web.event;

public class EventVO {
	
	private String eventNo;
	private String id;
	private String title;
	private String content;
	private String startDate;
	private String endDate;
	private String date;
	
	
	public String getEventNo() {
		return eventNo;
	}
	public void setEventNo(String eventNo) {
		this.eventNo = eventNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "EventVO [eventNo=" + eventNo + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", date=" + date + "]";
	}
	
	
}
