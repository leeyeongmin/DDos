package com.ddos.web.study;

import java.util.List;

import com.ddos.web.event.EventVO;

public interface StudyService {
	public void insertStudy(StudyVO vo);
	public void updateStudy(StudyVO vo);
	public void deleteStudy(StudyVO vo);
	public void deleteStudyList(StudyVO vo);
	public StudyVO getStudy(StudyVO vo);
	public List<StudyVO> getStudyList(StudyVO vo);
	public void insertStudyMember(StudyMemberVO vo);
	public List<StudyVO> getAdminStudytList(StudyVO vo);
	public void deleteStudyMember(StudyMemberVO svo);
	public StudyVO checkStudy(StudyVO vo);
}
