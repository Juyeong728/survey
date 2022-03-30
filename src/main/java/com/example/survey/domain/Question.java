package com.example.survey.domain;

import java.util.List;

public class Question {
	int q_idx;
	String q_value;
	String q_type;
	List<Item> items;
	
	
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	
	public String getQ_value() {
		return q_value;
	}
	public void setQ_value(String q_value) {
		this.q_value = q_value;
	}
	
	public String getQ_type() {
		return q_type;
	}
	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}
	
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	
}
