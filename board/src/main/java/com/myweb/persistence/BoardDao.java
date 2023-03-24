package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.BoardVO;
import com.myweb.domain.PageVO;

public interface BoardDao {

	public int insert(BoardVO board);
	public List<BoardVO> getList();
	public List<BoardVO> getListPaging(PageVO pgvo);
	public int totalCount();
}
