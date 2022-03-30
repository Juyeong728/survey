package com.example.survey.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.survey.domain.Survey;
import com.example.survey.mapper.SurveyMapper;

@Service("SurveyServiceImpl")
public class SurveyServiceImpl implements SurveyService{
	
	@Autowired SurveyMapper surveymapper;

	@Override
	public void insertSurvey(Survey survey) {
		surveymapper.insertSurvey(survey);
		surveymapper.insertQuestion(survey);
		surveymapper.insertItem(survey);
	}
	
}
