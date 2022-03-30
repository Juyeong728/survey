package com.example.survey.controller;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.survey.domain.Survey;
import com.example.survey.service.SurveyService;

@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired SurveyService surveyservice;
   
	@RequestMapping("/list")
	public String surveyList() {
		return "/mySurveys";
	}
	
	@RequestMapping("/createSurvey")
	public String createSurvey(Model model, Principal principal) {
		return "/form";
	}
	
	@RequestMapping("/createSurvey/process")
	public String createSurveyProcess(Model model, @RequestBody Survey survey, Principal principal) {
		surveyservice.insertSurvey(survey);
		
		return "/completed";
	}
	
	@RequestMapping("/result")
	public String showResult(Model model, @RequestBody Survey surveyresult, Principal principal) {
		
		return "/index";
	}
	   
	@RequestMapping("/joinSurvey")
	public String joinSurvey() {
		
		return "/joinSv";
	}
	   
}
