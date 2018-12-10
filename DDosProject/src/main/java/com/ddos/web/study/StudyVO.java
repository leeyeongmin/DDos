package com.ddos.web.study;

public class StudyVO {
	private int studyNumber;       
	private String studyName;
	private String studySubject;
	private int studyTime;
	private String studyDate;
	private String recruitEnd;
	private int recruitPerson;
	private String status;
	private int studyroomNumber;
	private String memberId;
	public int getStudyNumber() {
		return studyNumber;
	}
	public void setStudyNumber(int studyNumber) {
		this.studyNumber = studyNumber;
	}
	public String getStudyName() {
		return studyName;
	}
	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}
	public String getStudySubject() {
		return studySubject;
	}
	public void setStudySubject(String studySubject) {
		this.studySubject = studySubject;
	}
	public int getStudyTime() {
		return studyTime;
	}
	public void setStudyTime(int studyTime) {
		this.studyTime = studyTime;
	}
	public String getStudyDate() {
		return studyDate;
	}
	public void setStudyDate(String studyDate) {
		this.studyDate = studyDate;
	}
	public String getRecruitEnd() {
		return recruitEnd;
	}
	public void setRecruitEnd(String recruitEnd) {
		this.recruitEnd = recruitEnd;
	}
	public int getRecruitPerson() {
		return recruitPerson;
	}
	public void setRecruitPerson(int recruitPerson) {
		this.recruitPerson = recruitPerson;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getStudyroomNumber() {
		return studyroomNumber;
	}
	public void setStudyroomNumber(int studyroomNumber) {
		this.studyroomNumber = studyroomNumber;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "StudyBean [studyNumber=" + studyNumber + ", studyName=" + studyName + ", studySubject=" + studySubject
				+ ", studyTime=" + studyTime + ", studyDate=" + studyDate + ", recruitEnd=" + recruitEnd
				+ ", recruitPerson=" + recruitPerson + ", status=" + status + ", studyroomNumber=" + studyroomNumber
				+ ", memberId=" + memberId + "]";
	}
	
}
