package com.ddos.web.read;

public class ReadVO {
	private String seatNum;		//seat_num => _는 대문자로 변경 seatNum	mapUnderscoreToCamelCase
	private String status;
	
	private String room;		//열람실 선택 
	private String[] seat;		//선택 좌석 		

	
	
	public String[] getSeat() {
		return seat;
	}

	public void setSeat(String[] seat) {
		this.seat = seat;
	}

	public String getSeat_num() {
		return seatNum;
	}

	public void setSeat_num(String seat_num) {
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
		return "ReadVO [seat_num=" + seatNum + ", status=" + status + "]";
	}
	
	
	
}
