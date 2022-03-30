package com.example.survey.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.GrantedAuthority;

import com.example.survey.domain.User;

@Mapper
public interface UserMapper {
	   //유저읽기
	   public User readUser(String u_id);
	   
	   //유저생성
	   public void createUser(User user);

	   // 권한 생성
	   public void createAuthority(User user);

	   // 권한 읽기
	   public List<GrantedAuthority> readAuthorities(String u_id);

}

