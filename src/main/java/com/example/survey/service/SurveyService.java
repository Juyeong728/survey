package com.example.survey.service;

import java.util.List;

import com.example.survey.domain.Pagination;
import com.example.survey.domain.Search;
import com.example.survey.domain.Survey;

public interface SurveyService {
	
	public List<Survey> selectSurveyList(Pagination pagination);
	
	public List<Survey> listSearch(Pagination pagination);
	
	public int searchCount(Search search);	
	
	public int getSurveyCount();
	
	public void insertSurvey(Survey survey);
	
	
}
