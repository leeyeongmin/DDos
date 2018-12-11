package com.ddos.web.study.ctrl;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.study.StudyService;
import com.ddos.web.study.StudyVO;

@Controller
public class StudyController {
	@Autowired
	StudyService studyService;
	
	//스터디 등록
	@RequestMapping("insertStudy")			
	public String insertStudy(StudyVO vo) {
		studyService.insertStudy(vo);
		return "redirect:getStudyList";
	}
	
	//스터디 등록 창
	@RequestMapping("makeStudy")
	public String makeStudy() {
		return "no/study/makeStudy";	
	}

	//스터디 단건 조회
	@RequestMapping("getStudy")
	public String getStudy(Model model,StudyVO vo) {
		model.addAttribute("study",studyService.getStudy(vo));
		return "study/getStudy";
	}
	
	@RequestMapping("getStudyList")
	public String getStudyList() {
		return "study/getStudyList";
	}
	
	
	@RequestMapping("insertStudyMember")
	public String insertStudyMember() {
		return "redirect:getStudyList";
	}
}
