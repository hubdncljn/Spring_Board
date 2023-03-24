package com.myweb.service;

import java.util.List;

import com.myweb.domain.BoardVO;
import com.myweb.domain.PageVO;

public interface BoardService {
	public int register(BoardVO board);
	public List<BoardVO> getList();
	public List<BoardVO> getListPaging(PageVO pgvo);
	public int totalCount();
}
