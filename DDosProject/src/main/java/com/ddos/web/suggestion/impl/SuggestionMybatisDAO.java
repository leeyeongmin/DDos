package com.ddos.web.suggestion.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.suggestion.SuggestionVO;

@Repository
public class SuggestionMybatisDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 등록
	public void insertSuggestion(SuggestionVO vo) {
		System.out.println("my batis insertSuggestion() 기능 처리");
		mybatis.insert("suggestion.insertSuggestion", vo);
	}
	
	// 수정
	public void updateSuggestion(SuggestionVO vo) {
		System.out.println("my batis updateSuggestion() 기능 처리");
		mybatis.update("suggestion.updateSuggestion", vo);
	}
	
	// 삭제
	public void deleteSuggestion(SuggestionVO vo) {
		System.out.println("my batis deleteSuggestion() 기능 처리");
		mybatis.delete("suggestion.deleteSuggestion", vo);
	}
	
	// 조회수 증가
	public void increaseCnt(SuggestionVO vo) {
		System.out.println("my batis increaseCnt() 기능 처리");
		mybatis.update("suggestion.increaseCnt", vo);
	}
	
	// 단건 조회
	public SuggestionVO getSuggestion(SuggestionVO vo) {
		System.out.println("my batis spring jdbc 단건 조회");
		return mybatis.selectOne("suggestion.getSuggestion", vo);
	}
	
	// 전체 조회
	public List<SuggestionVO> getSuggestionList(SuggestionVO vo){
		System.out.println("my batis spring jdbc 다중 조회");
		return mybatis.selectList("suggestion.getSuggestionList", vo);
	}

	// 관리자 단건 조회
	public SuggestionVO AdmingetSuggestion(SuggestionVO vo) {
		return mybatis.selectOne("suggestion.getSuggestion", vo);
	}

	// 관리자 전체 조회
	public List<SuggestionVO> AdmingetSuggestionList(SuggestionVO vo) {
		return mybatis.selectList("suggestion.getSuggestionList", vo);
	}
}
