package com.ddos.web.read.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.read.ReadService;
import com.ddos.web.read.ReadVO;

@Service
public class ReadImpl implements ReadService{

	@Autowired
	ReadBatis dao;
	
	
	@Override
	public List<ReadVO> setRoom(ReadVO vo) {
		
		return dao.setRoom(vo);
	}

}
