package com.example.survey.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.survey.domain.Question;
import com.example.survey.domain.Survey;

@Mapper
public interface SurveyMapper {
	
	public void insertSurvey(Survey survey);
	
	public void insertQuestion(Survey survey);
	
	public void insertItem(Survey survey);
	
	public List<Question> getQuestions(Survey survey);
	
}
