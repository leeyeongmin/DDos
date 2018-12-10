package com.ddos.web.read;

import java.util.List;

public interface ReadService {
	public List<ReadVO> setRoom(ReadVO vo);		//좌석 조회
	public void saveSeat(ReadVO vo);			//좌석 배치 저장 
	public ReadVO overlap(ReadVO vo);			//중복 좌석 확인
	public void updateSeat(ReadVO vo);			//좌석 사용 변경
	public void timecheck();					//좌석 시간 체크
}
