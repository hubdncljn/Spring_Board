package com.myweb.service;

import java.util.List;

import com.myweb.domain.BoardVO;
import com.myweb.domain.PageVO;

public interface BoardService {
	public int register(BoardVO board); // 등록
	public List<BoardVO> getList(); // 목록 조회(페이징X)
	public List<BoardVO> getListPaging(PageVO pgvo); // 목록 조회(페이징O)
	public int totalCount(); // 총 게시글 수
	public BoardVO getDetail(int bno); // 게시글 상세 조회
	public int getCurrBno(); // 현재 게시글 번호 조회
}
