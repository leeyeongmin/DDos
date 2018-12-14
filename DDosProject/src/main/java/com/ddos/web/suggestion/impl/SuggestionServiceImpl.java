package com.ddos.web.suggestion.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.suggestion.SuggestionService;
import com.ddos.web.suggestion.SuggestionVO;

@Repository
public class SuggestionServiceImpl implements SuggestionService {
	@Autowired
	private SuggestionMybatisDAO sugDAO;
	
	// 삽입
	@Override
	public void insertSuggestion(SuggestionVO vo) {
		sugDAO.insertSuggestion(vo);
	}

	// 수정
	@Override
	public void updateSuggestion(SuggestionVO vo) {
		sugDAO.updateSuggestion(vo);
	}

	// 삭제
	@Override
	public void deleteSuggestion(SuggestionVO vo) {
		sugDAO.deleteSuggestion(vo);
	}

	// 조회수 증가
	@Override
	public void increaseCnt(SuggestionVO vo) {
		sugDAO.increaseCnt(vo);
	}

	// 상세 보기
	@Override
	public SuggestionVO getSuggestion(SuggestionVO vo) {
		return sugDAO.getSuggestion(vo);
	}

	
	// 리스트 보기
	@Override
	public List<SuggestionVO> getSuggestionList(SuggestionVO vo) {
		return sugDAO.getSuggestionList(vo);
	}

	@Override
	public void create(SuggestionVO vo) {
		// TODO Auto-generated method stub
		
	}

}
