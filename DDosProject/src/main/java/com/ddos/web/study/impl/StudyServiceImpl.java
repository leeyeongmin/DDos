package com.ddos.web.study.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.study.StudyService;
import com.ddos.web.study.StudyVO;

@Service
public class StudyServiceImpl implements StudyService{
	@Autowired StudyDaoMybatis dao;

	@Override
	public void insertStudy(StudyVO vo) {
		// TODO Auto-generated method stub
		dao.insertStudy(vo);
	}

	@Override
	public void updateStudy(StudyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteStudy(StudyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteStudyList(StudyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public StudyVO getStudy(StudyVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StudyVO> getStudyList(StudyVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
}
