package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.BoardVO;
import com.myweb.domain.PageVO;

public interface BoardDao {
	public int insert(BoardVO board); // 등록
	public List<BoardVO> getList(); // 목록 조회(페이징X)
	public List<BoardVO> getListPaging(PageVO pgvo); // 목록 조회(페이징O)
	public int totalCount(); // 총 게시글 수
	public BoardVO getDetail(int bno); // 상세 조회
}
