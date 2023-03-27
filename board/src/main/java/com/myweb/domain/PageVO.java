package com.myweb.domain;

public class PageVO {
	private int pageNum; // 현재 페이지
	private int amount; // 한 페이지 당 보여질 게시글 수
	private String keyword;
	
	/* 기본 세팅 : pageNum = 1, amount = 10 */
	public PageVO() {
		this(1, 10);
	}
	public PageVO(int pageNum, int amount) { 
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public PageVO(int pageNum, String keyword) {
		this.pageNum = pageNum;
		this.keyword = keyword;
	}
	public PageVO(int pageNum, int amount, String keyword) { 
		this.pageNum = pageNum;
		this.amount = amount;
		this.keyword = keyword;
	}
	public PageVO(String keyword) {
		this.keyword = keyword;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "PageVO [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	
}
