package com.ddos.web.read;

import java.util.List;
import java.util.Map;

public interface ReadService {
	public List<ReadVO> setRoom(ReadVO vo);		//좌석 조회
	public void saveSeat(ReadVO vo);			//좌석 배치 저장 
	public ReadVO overlap(ReadVO vo);			//중복 좌석 확인
	public void updateSeat(ReadVO vo);			//좌석 사용 변경
	public void timecheck(String time);					//좌석 시간 체크
	public String seat_useing(ReadVO vo);	//로그인 후 좌석 사용 확인 
	public Map<String, String> getroomsize(ReadVO vo);		//열람실 크기 확인
	public void return_seat(ReadVO vo);			//자리 반환 
	public String remaining(ReadVO vo);			//남은 시간 체크 	(분 단위)
	public void extension(ReadVO vo);			//좌석 시간 연장
	public String usetimer(ReadVO vo);			//남은 시간 확인 	(시,분,초 단위)
	
	/*	-------------------------------  */
	public List<ReadVO> test(ReadVO vo);
	public ReadVO testMax(ReadVO vo);
	
	public void settingroom(ReadVO vo);				//좌석 수 설정 
	public String setting_change_ck(ReadVO vo);
}
