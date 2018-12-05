package com.ddos.web.read;

public class ReadVO {
	private String seat_num;
	private String status;
	
	private String room;

	public String getSeat_num() {
		return seat_num;
	}

	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
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
		return "ReadVO [seat_num=" + seat_num + ", status=" + status + "]";
	}
	
	
	
}
