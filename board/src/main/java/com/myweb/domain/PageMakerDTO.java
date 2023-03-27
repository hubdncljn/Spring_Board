package com.myweb.domain;

public class PageMakerDTO {
	private int startPage; // 화면에 보여지는 시작 페이지
	private int endPage; // 화면에 보여지는 마지막 페이지
	private boolean prev, next; // 이전 페이지, 다음 페이지 존재유무
	private int total; // 전체 게시글 수
	private PageVO page; // 현재 페이지, 페이지당 보여질 게시글 수 정보
	
	public PageMakerDTO(PageVO page, int total) {
		this.page = page;
		this.total = total;
		
		/* 화면에 보여지는 마지막 페이지 */
        this.endPage = (int)(Math.ceil(page.getPageNum()/10.0))*10;
        /* 화면에 보여지는 시작 페이지 */
        this.startPage = this.endPage - 9;
        
        /* 전체 마지막 페이지 */
        int realEnd = (int)(Math.ceil(total * 1.0/page.getAmount()));
        
        /* 전체 마지막 페이지(realEnd)가 화면에 보여지는 마지막페이지(endPage)보다 작은 경우, 화면에 보여지는 페이지(endPage) 값 조정 */
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
        
        /* 화면에 보여지는 시작 페이지(startPage)값이 1보다 큰 경우 true */
        this.prev = this.startPage > 1;
        
        /* 화면에 보여지는 마지막 페이지(endPage)값이 전체 마지막 페이지(realEnd) 보다 작을 경우 true */
        this.next = this.endPage < realEnd;
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
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public PageVO getPage() {
		return page;
	}
	public void setPage(PageVO page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "PageMakerDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", page=" + page + "]";
	}
	
}