package com.ddos.web.study.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.study.StudyMemberVO;
import com.ddos.web.study.StudyService;
import com.ddos.web.study.StudyVO;

@Controller
public class StudyController {
	@Autowired
	StudyService studyService;

	// 스터디 등록
	@RequestMapping("insertStudy")
	public String insertStudy(StudyVO vo, HttpSession session, HttpServletResponse response) throws IOException {

		StudyVO studyvo = studyService.checkStudy(vo);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (studyvo != null) {
			out.println("<script>alert('이미 사용중인 스터디 룸입니다. 다시 등록해주세요.');</script>");
			out.flush();
			return "study/getStudyList";
		} else {
			studyService.insertStudy(vo);
			return "study/getStudyList";
		}
	}

	// 스터디 등록 창
	@RequestMapping("makeStudy")
	public String makeStudy() {
		return "no/study/makeStudy";
	}

	// 스터디 삭제
	@RequestMapping("deleteStudy")
	public String deleteStudy(StudyVO vo) {
		studyService.deleteStudy(vo);
		return "redirect:getStudyList";
	}

	// 스터디 단건 조회
	@RequestMapping("getStudy")
	public String getStudy(Model model, StudyVO vo) {
		model.addAttribute("study", studyService.getStudy(vo));
		return "study/getStudy";
	}

	@RequestMapping("getStudyList")
	public String getStudyList() {
		return "study/getStudyList";
	}

	@RequestMapping("insertStudyMember")
	public String insertStudyMember(StudyMemberVO vo) {
		studyService.insertStudyMember(vo);
		return "redirect:getStudyList";
	}

	// 관리자

	@RequestMapping("adminStudyList")
	public String adminStudyList(Model model, StudyVO vo) {
		model.addAttribute("adminStudyList", studyService.getAdminStudytList(vo));
		return "admin/study/AdminStudyStudyRoom";
	}

	// 스터디 삭제
	@RequestMapping("deleteStudyList")
	public String deleteStudyList(StudyVO vo, StudyMemberVO svo) {
		studyService.deleteStudyMember(svo);
		studyService.deleteStudy(vo);
		return "redirect:adminStudyList";
	}
}
