package com.ddos.web.suggestion;

import java.util.List;

public interface SuggestionService {
	public void insertSuggestion(SuggestionVO vo);
	public void updateSuggestion(SuggestionVO vo);
	public void deleteSuggestion(SuggestionVO vo);
	public void increaseCnt(SuggestionVO vo);
	public SuggestionVO getSuggestion(SuggestionVO vo);
	public List<SuggestionVO> getSuggestionList(SuggestionVO vo);
}