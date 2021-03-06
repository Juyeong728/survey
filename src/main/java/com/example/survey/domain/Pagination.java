package com.example.survey.domain;

public class Pagination {
	
	int postCount;       // survey테이블에 등록된 총 survey 수 
	int page;           // 현재 페이지번호
	int pageNum;        // postCount / page = 화면에 나타 낼 survey index번호
	int startPage;     //﻿ pagination의 시작(ex,1,6,11)
	int endPage;      // ﻿pagination의 끝(ex,5,10,15)
	int lastPage;     // (postCount/화면에 표시할 갯수), pagination 마지막 번호
	int prevPage;     // pagination의 이전 목록
	int nextPage;     // pagination의 다음 목록
	public static final int pageUnit=5;  // 한번에 불러 올 pagination 수
	public static final int perPage=6;   // 한번에 불러 올 postCount 수 
	
	
	public Pagination() {
		
	}
	
	public Pagination(int page, int count) {		
		this.page = page;
		postCount = count;
		startPage =((page-1)/pageUnit)*pageUnit+1;
		lastPage = (int)Math.ceil(postCount / (float)perPage);
		endPage = startPage+pageUnit-1;
		endPage = endPage < lastPage ? endPage : lastPage;
		prevPage=(startPage-1);
		nextPage=(startPage+pageUnit);
		pageNum = (page-1)*perPage;
	}
	
	
	public int getPostCount() {
		return postCount;
	}
	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public static int getPageunit() {
		return pageUnit;
	}
	public static int getPerpage() {
		return perPage;
	}
	
	
	private Search search;

	public Search getSearch() {
		return search;
	}

	public void setSearch(Search search) {
		this.search = search;
	}
	
	
}

