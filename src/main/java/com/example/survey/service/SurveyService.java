package com.example.survey.service;

import java.util.List;

import com.example.survey.domain.Item;
import com.example.survey.domain.Pagination;
import com.example.survey.domain.Question;
import com.example.survey.domain.Response_content;
import com.example.survey.domain.Response_item;
import com.example.survey.domain.Response_user;
import com.example.survey.domain.Search;
import com.example.survey.domain.Survey;

public interface SurveyService {
	
	public List<Survey> selectSurveyList(Pagination pagination);
	
	public List<Survey> listSearch(Pagination pagination);
	
	public int searchCount(Search search);	
	
	public int getSurveyCount();
	
	public int getItemCount(int i_idx);
	
	public Survey getSurvey(int s_idx);
	
	public List<Question> getQuestions(int s_idx);
	
	public List<Item> getItems(int q_idx);
	
	public List<String> getRespondents(int s_idx);
	
	public int getRespondentsCount(int s_idx);
	
	public List<Response_content> getResp_contents(int s_idx);
	
	public List<Response_item> getResp_items(int q_idx);
	
	public List<Response_item> getResp_items_wo_group(int q_idx);
	
	public void insertSurvey(Survey survey);
	
	public void insertResponse(Response_user resp_user);
	
	
}
