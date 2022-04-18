package com.example.survey.domain;

import java.sql.Date;
import java.util.List;

public class Response_user {
	int r_idx;
	int s_idx;
	String u_name;
	Date r_date;
	List<Response_content> r_contents;
	
	
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}
	
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	
	public List<Response_content> getR_contents() {
		return r_contents;
	}
	public void setR_contents(List<Response_content> r_contents) {
		this.r_contents = r_contents;
	}

}
