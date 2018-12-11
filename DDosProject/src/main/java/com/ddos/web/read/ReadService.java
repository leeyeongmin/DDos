package com.ddos.web.read;

import java.util.List;

public interface ReadService {
	public List<ReadVO> setRoom(ReadVO vo);		//좌석 조회
	public void saveSeat(ReadVO vo);			//좌석 배치 저장 
	public ReadVO overlap(ReadVO vo);			//중복 좌석 확인
	public void updateSeat(ReadVO vo);			//좌석 사용 변경
<<<<<<< HEAD
	public void timecheck();					//좌석 시간 체크
	public String seat_useing(String login_id);	//로그인 후 좌석 사용 확인 
=======
>>>>>>> branch 'master' of https://github.com/leeyeongmin/DDos.git
}
