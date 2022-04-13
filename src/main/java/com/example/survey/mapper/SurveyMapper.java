package com.example.survey.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.survey.domain.Search;
import com.example.survey.domain.Item;
import com.example.survey.domain.Pagination;
import com.example.survey.domain.Question;
import com.example.survey.domain.Survey;

@Mapper
public interface SurveyMapper {
	// 게시물 목록 + 페이징
	public List<Survey> selectSurveyList(Pagination pagination);

	// 게시물 목록 + 페이징 + 검색
	public List<Survey> listSearch(Pagination pagination);
		
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(Search search);	
	
	public int getSurveyCount();
	
	public Survey getSurvey(int s_idx);
	
	public List<Question> getQuestions(int s_idx);
	
	public List<Item> getItems(int q_idx);
	
	public void insertSurvey(Survey survey);
	
	public void insertQuestion(Survey survey);
	
	public void insertItem(Survey survey);
	
	
}
