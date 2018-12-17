package com.ddos.web.read;

public class ReadVO {
	private String seatNum;		//seat_num => _는 대문자로 변경 seatNum	mapUnderscoreToCamelCase
	private String status;
	
	private String room;		//열람실 선택 
	private String[] seat;		//저장 할 좌석 		
	private String selectSeat;	//선택 좌석
	private String loginId;		//로그인ID 이름
	
	private String col;
	private String row;
	
	private String endTime;
	
	private String rmax;
	private String cmax;

	public String getRmax() {
		return rmax;
	}

	public void setRmax(String rmax) {
		this.rmax = rmax;
	}

	public String getCmax() {
		return cmax;
	}

	public void setCmax(String cmax) {
		this.cmax = cmax;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String end_time) {
		this.endTime = end_time;
	}

	public String getCol() {
		return col;
	}

	public void setCol(String col) {
		this.col = col;
	}

	public String getRow() {
		return row;
	}

	public void setRow(String row) {
		this.row = row;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getSelectSeat() {
		return selectSeat;
	}

	public void setSelectSeat(String selectSeat) {
		this.selectSeat = selectSeat;
	}

	public String[] getSeat() {
		return seat;
	}

	public void setSeat(String[] seat) {
		this.seat = seat;
	}

	public String getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(String seat_num) {
		this.seatNum = seat_num;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	@Override
	public String toString() {
		return "ReadVO [seat_num=" + seatNum + ", status=" + status + "]" + "selectSeat : " + selectSeat + endTime;
	}
	
	
	
}
