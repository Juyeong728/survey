package com.example.survey.domain;

public class Search {
	private String searchType;
	private String keyword;	
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;		
	}
	public String getSearchType() {
		return searchType;
	}	
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;		
	}	
	public String getKeyword() {
		return keyword;
	}
	
	
	// 검색 타입과 검색어
	/*
	private String searchTypeKeyword;	
	
	public void setSearchTypeKeyword(String searchType, String keyword) {
		
		if(searchType.equals("") || keyword.equals("")) {
			searchTypeKeyword = "";	
		} else {
			searchTypeKeyword = "&searchType=" + searchType + "&keyword=" + keyword;	
		}		
	}
	*/
	
	public String getSearchTypeKeyword() {
		
		if(searchType.equals("") || keyword.equals("")) {
			return "";	
		} else {
			return "&searchType=" + searchType + "&keyword=" + keyword;	
		}
	}

}
