package com.ddos.web.event;

import org.springframework.web.multipart.MultipartFile;

public class EventVO {

	private int eventNum;
	private String eventTitle;
	private String eventCont;
	private String startDate;
	private String endDate;
	private String writeDate;
	private String memberId;
	private String eventFile;
	private MultipartFile file;

	public int getEventNum() {
		return eventNum;
	}

	public void setEventNum(int eventNum) {
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

	public String getEventFile() {
		return eventFile;
	}

	public void setEventFile(String eventFile) {
		this.eventFile = eventFile;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "EventVO [eventNum=" + eventNum + ", eventTitle=" + eventTitle + ", eventCont=" + eventCont
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", writeDate=" + writeDate + ", memberId="
				+ memberId + ", eventFile=" + eventFile + ", file=" + file + "]";
	}
}
