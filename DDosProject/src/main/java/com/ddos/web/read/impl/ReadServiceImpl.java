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
	public ReadVO overlap(ReadVO vo) {
		return dao.overlap(vo);
	}

}
