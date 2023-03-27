package com.myweb.domain;

import java.util.Date;
import java.util.List;

public class BoardVO {
	private int bno; // 게시판 번호
	private String title; // 게시판 제목
	private String content; // 게시판 내용
	private String writer; // 게시판 작성자
	private Date regdate; // 게시판 등록일
	private Date moddate; // 게시판 수정일
	private int readcount; // 조회수
	private List<FileVO> flist; // 파일
	
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getModdate() {
		return moddate;
	}
	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}
	public List<FileVO> getFlist() {
		return flist;
	}
	public void setFlist(List<FileVO> flist) {
		this.flist = flist;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", moddate=" + moddate + ", readcount=" + readcount + "]";
	}
	
}
