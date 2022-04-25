package com.example.survey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.survey.domain.Item;
import com.example.survey.domain.Pagination;
import com.example.survey.domain.Question;
import com.example.survey.domain.Response_content;
import com.example.survey.domain.Response_user;
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
	public Survey getSurvey(int s_idx) {
		return surveymapper.getSurvey(s_idx);
	}
	
	@Override
	public List<Question> getQuestions(int s_idx) {
		return surveymapper.getQuestions(s_idx);
	}
	
	@Override
	public List<Item> getItems(int q_idx) {
		return surveymapper.getItems(q_idx);
	}
	
	@Override
	public List<String> getParticipants(int s_idx){
		return surveymapper.getParticipants(s_idx);
	}
	
	@Override
	public List<Response_content> getResp_contents(int s_idx) {
		return surveymapper.getResp_contents(s_idx);
	}
	
	@Override
	public void insertSurvey(Survey survey) {
		surveymapper.insertSurvey(survey);
		surveymapper.insertQuestion(survey);
		surveymapper.insertItem(survey);
	}
	
	@Override
	public void insertResponse(Response_user resp_user) {
		surveymapper.insertResp_user(resp_user);
		surveymapper.insertResp_content(resp_user);
	}
	
}
