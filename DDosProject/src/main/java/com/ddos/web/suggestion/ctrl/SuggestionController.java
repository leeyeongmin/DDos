package com.ddos.web.suggestion.ctrl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.suggestion.SuggestionService;
import com.ddos.web.suggestion.SuggestionVO;

@Controller
public class SuggestionController {
	@Autowired SuggestionService suggestionService;
	
	// 등록폼
	@RequestMapping("insertSuggestionform")
	public String insertSuggestion(Model model, SuggestionVO vo) {
		return "suggestion/insertSuggestion";
	}
	
	// 등록 처리
	@RequestMapping("insertSuggestion")
	public String insertSuggestion(SuggestionVO vo, HttpSession session) {
		suggestionService.insertSuggestion(vo);		// 등록 처리
		return "redirect:getSuggestionList";	// 목록 요청
	}
	
	// 수정폼
	@RequestMapping("updateSuggestionform")
	public String updateSuggestion(Model model, SuggestionVO vo) {
		model.addAttribute("suggestion", suggestionService.getSuggestion(vo));
		return "suggestion/updateSuggestion";
	}
	
	// 수정 처리
	@RequestMapping("updateSuggestion")
	public String updateSuggestion(SuggestionVO vo) {
		suggestionService.updateSuggestion(vo);		// 수정 등록 처리
		return "redirect:getSuggestionList";	// 목록 요청
	}
	
	// 삭제 처리
	@RequestMapping("deleteSuggestion")
	public String deleteSuggestion(SuggestionVO vo) {
		suggestionService.deleteSuggestion(vo);		// 삭제 처리
		return "redirect:getSuggestionList";	// 목록 요청
	}
	
	
	// 단건 조회
	@RequestMapping("getSuggestion")
	public String getSuggestion(Model model, SuggestionVO vo) {
		suggestionService.increaseCnt(vo);
		model.addAttribute("suggestion", suggestionService.getSuggestion(vo));
		return "suggestion/getSuggestion";
	}
	
	// 전체 조회
	@RequestMapping("getSuggestionList")
	public String getSuggestionList(Model model, SuggestionVO vo) {
		model.addAttribute("suggestionList", suggestionService.getSuggestionList(vo));
		return "suggestion/getSuggestionList";
	}
}
