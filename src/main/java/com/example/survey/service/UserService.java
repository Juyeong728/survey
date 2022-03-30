package com.example.survey.service;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.example.survey.domain.User;

public interface UserService extends UserDetailsService{
	   //유저읽기
	   public User readUser(String u_id);
	      
	   //유저생성
	   public void createUser(User user);

	   // 권한 생성
	   public void createAuthorities(User user);
	   
	   // 시큐리티 권한 얻기
	   Collection<GrantedAuthority> getAuthorities(String u_id);
	}
