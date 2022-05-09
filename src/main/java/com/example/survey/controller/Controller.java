package com.example.survey.controller;
import java.security.Principal;
import java.sql.Date;
import java.util.ArrayList;
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
import com.example.survey.domain.Response_content;
import com.example.survey.domain.Response_item;
import com.example.survey.domain.Response_user;
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
		return "/listSearch";
	}
	
	@RequestMapping("/mySurveyList")
	public String showMySurveys() {
		
		return "/statistics";
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
	   
	@RequestMapping("/detail")
	public String showSurvey(Model model, Survey survey, Principal principal) {
		if(principal != null) {//login된 상태(writer or participant)
			user = (User)((Authentication)principal).getPrincipal();
			Survey targetSurvey = surveyservice.getSurvey(survey.getS_idx());
			List<Question> questions = surveyservice.getQuestions(survey.getS_idx());
			targetSurvey.setQuestions(questions);
			
			for(Question q : questions) {
				q.setItems(surveyservice.getItems(q.getQ_idx()));
			}
			
			int firstQ = questions.get(0).getQ_idx();
			
			if((user.getUsername()).equals(targetSurvey.getU_idx())) {//writer
				model.addAttribute("user", user);
				model.addAttribute("firstQ_idx", firstQ);
				model.addAttribute("survey", targetSurvey);
				return "/detail-writer";
			} else {//participant(already joined or not)
				List<String> u_names = surveyservice.getRespondents(targetSurvey.getS_idx());
				int joined=0;
				for(String u_name : u_names){
					if(user.getU_name().equals(u_name))
						joined=1;
				}
				if(joined==1) {//already joined
					return "/already_did";
				} else {//not
					model.addAttribute("user", user);
					model.addAttribute("firstQ_idx", firstQ);
					model.addAttribute("survey", targetSurvey);
					return "/detail";
				}
			}
		} else {//login 안 된 상태
			return "/login";
		}
	}
	
	@RequestMapping("/respond")
	public String joinSurvey(Model model, @RequestBody Response_user response) {
		long miliseconds = System.currentTimeMillis();
	    Date date = new Date(miliseconds);
	    response.setR_date(date);
	    
	    surveyservice.insertResponse(response);
		return "/completed";
	}
	
	@RequestMapping("/complete")
	public String complete() {
		return "/completed";
	}
	
	@RequestMapping("/reply-chart")
	public String showChart(Model model, Survey survey) {
		List<String> replyCntList = new ArrayList<String>();
		Survey targetSurvey = surveyservice.getSurvey(survey.getS_idx());
		List<Question> questions = surveyservice.getQuestions(survey.getS_idx());
		targetSurvey.setQuestions(questions);
		
		for(Question q : questions) {
			q.setItems(surveyservice.getItems(q.getQ_idx()));
		}

		List<Response_content> replies = surveyservice.getResp_contents(survey.getS_idx());
		for(Response_content rc : replies) {//shortAns or longAns
			rc.setResp_items(surveyservice.getResp_items_wo_group(rc.getQ_idx()));
		}
		
		List<Response_content> replies2 = surveyservice.getResp_contents(survey.getS_idx());
		for(Response_content rc : replies2) {
			String result = "[['',''],";
			rc.setResp_items(surveyservice.getResp_items(rc.getQ_idx()));
			for(Response_item item : rc.getResp_items()) {
				if(item.getI_idx() != 0) {
					int cnt = surveyservice.getItemCount(item.getI_idx());
					result += "['"+item.getI_value()+"', "+cnt+"],";
				}
			}
			result = result.replaceAll(",$", "");
			result += "]";
//			if(!result.equals("[['','']]")) {
				replyCntList.add(result);
//			}
		}
		System.out.println(replyCntList);

		model.addAttribute("replyCntList", replyCntList);
		model.addAttribute("replies", replies);
		model.addAttribute("survey", targetSurvey);
		model.addAttribute("respondentsCnt", surveyservice.getRespondentsCount(targetSurvey.getS_idx()));
		return "/statistics";
	}
	   
}
