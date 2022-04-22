package com.example.survey.domain;

import java.util.List;

public class Response_content {
	int s_idx;
	int q_idx;
	List<Response_item> resp_items;
	
	
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}
	
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	
	public List<Response_item> getResp_items() {
		return resp_items;
	}
	public void setResp_items(List<Response_item> resp_items) {
		this.resp_items = resp_items;
	}
	
}
