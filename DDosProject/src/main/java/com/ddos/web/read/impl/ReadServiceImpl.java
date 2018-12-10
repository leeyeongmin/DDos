package com.ddos.web.read.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.read.ReadService;
import com.ddos.web.read.ReadVO;

@Service
public class ReadServiceImpl implements ReadService{

	@Autowired
	ReadDAOMyBatis dao;
	
	
	@Override
	public List<ReadVO> setRoom(ReadVO vo) {		//좌석 조회
		return dao.setRoom(vo);
	}


	@Override
	public void saveSeat(ReadVO vo) {				//좌석 배치 저장
		dao.saveSeat(vo);
	}


	@Override
	public ReadVO overlap(ReadVO vo) {				//중복 확인
		return dao.overlap(vo);
	}


	@Override
	public void updateSeat(ReadVO vo) {				//좌석 사용중으로 변경
		dao.updateSeat(vo);
	}


	@Override
	public void timecheck() {						//좌석 시간 체크
		
		
	}


}
