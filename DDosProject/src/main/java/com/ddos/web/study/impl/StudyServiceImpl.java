package com.ddos.web.study.impl;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.event.EventVO;
import com.ddos.web.study.StudyMemberVO;
import com.ddos.web.study.StudyService;
import com.ddos.web.study.StudyVO;
import com.ddos.web.user.UserVO;

@Service
public class StudyServiceImpl implements StudyService{
	@Autowired StudyDaoMybatis dao;

	@Override
	public void insertStudy(StudyVO vo) {
		// TODO Auto-generated method stub
		HttpServletRequest request = null;
		dao.insertStudy(vo,request);
	}

	@Override
	public void updateStudy(StudyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteStudy(StudyVO vo) {
		// TODO Auto-generated method stub
		dao.deleteStudy(vo);
	}

	@Override
	public void deleteStudyList(StudyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public StudyVO getStudy(StudyVO vo) {
		// TODO Auto-generated method stub
		return dao.getStudy(vo);
	}

	@Override
	public List<StudyVO> getStudyList(StudyVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertStudyMember(StudyMemberVO vo) {
		// TODO Auto-generated method stub
		dao.insertStudyMember(vo);
	}

	@Override
	public List<StudyVO> getAdminStudytList(EventVO vo) {
		return dao.getAdminStudyList(vo);
	}

}
