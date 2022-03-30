package com.example.survey.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.survey.domain.User;
import com.example.survey.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	   @Autowired
	   UserMapper userMapper;
	   
	   @Override
	   public UserDetails loadUserByUsername(String u_id) throws UsernameNotFoundException {
	      User user = userMapper.readUser(u_id);
	      user.setAuthorities(getAuthorities(u_id));
	      
	      return user;
	   }
	   
	   @Override
	   public Collection<GrantedAuthority> getAuthorities(String u_id) {
	      List<GrantedAuthority> authorities = userMapper.readAuthorities(u_id);
	      return authorities;
	   }
	   
	   @Override
	   public void createUser(User user) {
	      userMapper.createUser(user);
	   }

	   @Override
	   public void createAuthorities(User user) {
	      userMapper.createAuthority(user);
	   }

	   @Override
	   public User readUser(String u_id) {
	      return userMapper.readUser(u_id);
	   }

	}