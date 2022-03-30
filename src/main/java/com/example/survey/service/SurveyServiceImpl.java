package com.example.survey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.survey.domain.Pagination;
import com.example.survey.domain.Search;
import com.example.survey.domain.Survey;
import com.example.survey.mapper.SurveyMapper;

@Service("SurveyServiceImpl")
public class SurveyServiceImpl implements SurveyService{
	
	@Autowired SurveyMapper surveymapper;

	@Override
	public List<Survey> selectSurveyList(Pagination pagination){
		return surveymapper.selectSurveyList(pagination);
	}
	
	@Override
	public List<Survey> listSearch(Pagination pagination){
		return surveymapper.listSearch(pagination);
	}
	
	@Override
	public int searchCount(Search search) {
		return surveymapper.searchCount(search);
	}
	
	@Override
	public int getSurveyCount() {
		return surveymapper.getSurveyCount();
	}
	
	@Override
	public void insertSurvey(Survey survey) {
		surveymapper.insertSurvey(survey);
		surveymapper.insertQuestion(survey);
		surveymapper.insertItem(survey);
	}
	
}
