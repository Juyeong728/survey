package com.example.survey.controller;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.survey.domain.Search;
import com.example.survey.domain.User;
import com.example.survey.domain.Pagination;
import com.example.survey.domain.Question;
import com.example.survey.domain.Survey;
import com.example.survey.service.SurveyService;

@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired SurveyService surveyservice;
	User user = null;
   
	@RequestMapping("/list")
	public String surveyList(Model model
			, @RequestParam(value="page", defaultValue="1") int page) {
		
		int count = surveyservice.getSurveyCount();
		Pagination pagination = new Pagination(page, count);
		
		List<Survey> list = surveyservice.selectSurveyList(pagination);
		
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		return "/list";
	}
	
	@RequestMapping("/listSearch")
	public String getListSearch(Model model
			, @RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType
			, @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int count = surveyservice.searchCount(search);
		Pagination pagination = new Pagination(page, count);
		pagination.setSearch(search);
		
		List<Survey> list = surveyservice.listSearch(pagination);
		
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		return "listSearch";
	}
	
	@RequestMapping("/mySurveyList")
	public String showMySurveys() {
		
		return "";
	}
	
	@RequestMapping("/createSurvey")
	public String createSurvey(Model model, Principal principal) {
		if(principal != null) {
			user = (User)((Authentication)principal).getPrincipal();
			return "/form";			
		} else {
			return "/login";
		}
		
	}
	
	@RequestMapping("/createSurvey/process")
	public String createSurveyProcess(Model model, @RequestBody Survey survey, Principal principal) {
		surveyservice.insertSurvey(survey);
		return "/completed";
	}
	
	@RequestMapping("/result")
	public String showResult(Model model, Principal principal) {
		
		return "/index";
	}
	   
	@RequestMapping("/detail")
	public String joinSurvey(Model model, Survey survey, Principal principal) {
		if(principal != null) {
			user = (User)((Authentication)principal).getPrincipal();
			Survey targetSurvey = surveyservice.getSurvey(survey.getS_idx());
			List<Question> questions = surveyservice.getQuestions(survey.getS_idx());
			targetSurvey.setQuestions(questions);
			
			for(Question q : questions) {
				q.setItems(surveyservice.getItems(q.getQ_idx()));
			}
			
			model.addAttribute("survey", targetSurvey);
			return "/detail";
			
//			if((user.getUsername()).equals(targetSurvey.getU_idx())) {
//				return "/detail-writer";
//			} else {
//				if(이미 참가함) {
//					return "/already";
//				} else {
//					return "/detail";
//				}
//			}
		} else {
			return "/login";
		}
	}
	   
}
