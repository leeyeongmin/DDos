package com.ddos.web.suggestion;

public class SuggestionVO {
	private int sugNum;
	private String sugTitle;
	private String sugDate;
	private String sugCont;
	private String memberId;
	private int sugCnt;
	private String searchType;
	private String searchKeyword;

	public int getSugNum() {
		return sugNum;
	}

	public void setSugNum(int sugNum) {
		this.sugNum = sugNum;
	}

	public String getSugTitle() {
		return sugTitle;
	}

	public void setSugTitle(String sugTitle) {
		this.sugTitle = sugTitle;
	}

	public String getSugDate() {
		return sugDate;
	}

	public void setSugDate(String sugDate) {
		this.sugDate = sugDate;
	}

	public String getSugCont() {
		return sugCont;
	}

	public void setSugCont(String sugCont) {
		this.sugCont = sugCont;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getSugCnt() {
		return sugCnt;
	}

	public void setSugCnt(int sugCnt) {
		this.sugCnt = sugCnt;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	@Override
	public String toString() {
		return "SuggestionVO [sugNum=" + sugNum + ", sugTitle=" + sugTitle + ", sugDate=" + sugDate + ", sugCont="
				+ sugCont + ", memberId=" + memberId + ", sugCnt=" + sugCnt + ", searchType=" + searchType
				+ ", searchKeyword=" + searchKeyword + "]";
	}
}
