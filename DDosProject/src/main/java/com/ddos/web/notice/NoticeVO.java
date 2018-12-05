package com.ddos.web.notice;

public class NoticeVO {
	private int noticeNum;
	private String noticeTitle;
	private String noticeDate;
	private String noticeCont;
	private String memberId;
	private int noticeCnt;

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeCont() {
		return noticeCont;
	}

	public void setNoticeCont(String noticeCont) {
		this.noticeCont = noticeCont;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getNoticeCnt() {
		return noticeCnt;
	}

	public void setNoticeCnt(int noticeCnt) {
		this.noticeCnt = noticeCnt;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticeNum=" + noticeNum + ", noticeTitle=" + noticeTitle + ", noticeDate=" + noticeDate
				+ ", noticeCont=" + noticeCont + ", memberId=" + memberId + ", noticeCnt=" + noticeCnt + "]";
	}
}
