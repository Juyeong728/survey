package com.example.survey.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.survey.service.UserService;
import com.example.survey.domain.User;

@org.springframework.stereotype.Controller
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	
	@RequestMapping("/")
	public String home(Model model, Principal principal) {
		logger.debug("debug");
	    logger.info("info");
	    logger.error("error");
	    
//	    if(principal != null) {
//		    User user = (User)((Authentication)principal).getPrincipal();
//		    List<Survey> surveylist = SurveyService.selectSurveyList(user);
//		    
//		    model.addAttribute("surveylist", surveylist);	
//	    }
//	    
//	    List<Survey> surveylistAll = SurveyService.selectSurveyListAll();
//	    
//	    model.addAttribute("surveylistall", surveylistAll);	
		
		return "/index";
	}
	
	@RequestMapping("/beforeSignUp") 
	public String beforeSignUp() {
		return "/signup";
	}
	
	@RequestMapping("/signup")
	   public String signup(User user) {
	      //비밀번호 암호화
	      String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());

	      //유저 데이터 세팅
	      user.setPassword(encodedPassword);
	      user.setAccountNonExpired(true);
	      user.setEnabled(true);
	      user.setAccountNonLocked(true);
	      user.setCredentialsNonExpired(true);
	      user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));   
	      
	      //유저 생성
	      userservice.createUser(user);
	      //유저 권한 생성
	      userservice.createAuthorities(user);
	      
	      return "/login";
	   }
	
	@RequestMapping("/login")
	public String beforeLogin(Model model) {
		return "/login";
	}
	
	@RequestMapping("/loginPro")
	public String loginProcess(Model model) {
		return "/index";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping("/admin")
	public String admin(Model model) {
		return "/admin";
	}
	   
   @Secured({"ROLE_USER"})
   @RequestMapping("/user/info")
   public String userInfo(Model model) {
      return "/user_info";
   }
   
   @RequestMapping("/denied")
   public String denied(Model model) {
      return "/denied";
   }
}
