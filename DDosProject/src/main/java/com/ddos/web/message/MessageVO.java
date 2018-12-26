package com.ddos.web.message;

public class MessageVO {
	private int messageNum;
	private String messageTitle;
	private String messageCont;
	private String messageDate;
	private String messageCheck;
	private String memberId;

	public int getMessageNum() {
		return messageNum;
	}

	public void setMessageNum(int messageNum) {
		this.messageNum = messageNum;
	}

	public String getMessageTitle() {
		return messageTitle;
	}

	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

	public String getMessageCont() {
		return messageCont;
	}

	public void setMessageCont(String messageCont) {
		this.messageCont = messageCont;
	}

	public String getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}

	public String getMessageCheck() {
		return messageCheck;
	}

	public void setMessageCheck(String messageCheck) {
		this.messageCheck = messageCheck;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "MessageVO [messageNum=" + messageNum + ", messageTitle=" + messageTitle + ", messageCont=" + messageCont
				+ ", messageDate=" + messageDate + ", messageCheck=" + messageCheck + ", memberId=" + memberId + "]";
	}
}
