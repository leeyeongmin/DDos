package com.ddos.web.study;

import java.util.List;

public interface StudyService {
	public void insertStudy(StudyVO vo);
	public void updateStudy(StudyVO vo);
	public void deleteStudy(StudyVO vo);
	public void deleteStudyList(StudyVO vo);
	public StudyVO getStudy(StudyVO vo);
	public List<StudyVO> getStudyList(StudyVO vo);
}
