package com.ddos.web.study.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.study.StudyService;
import com.ddos.web.study.StudyVO;

@Controller
public class StudyController {
	@Autowired
	StudyService studySerivce;
	
	//스터디 등록
	@RequestMapping("insertStudy")			
	public void insertStudy(StudyVO vo) {
		studySerivce.insertStudy(vo);
		
	}
	
	@RequestMapping("makeStudy")
	public String makeStudy() {
		return "no/study/makeStudy";	
	}
	
	
	@RequestMapping("getStudyList")
	public String getStudyList() {
		return "study/getStudyList";
	}
}
