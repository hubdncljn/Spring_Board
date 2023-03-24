package com.myweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.domain.BoardVO;
import com.myweb.domain.PageVO;
import com.myweb.persistence.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao bdao;
	
	@Override
	public int register(BoardVO board) {
		return bdao.insert(board);
	}

	@Override
	public List<BoardVO> getList() {
		return bdao.getList();
	}

	@Override
	public List<BoardVO> getListPaging(PageVO pgvo) {
		return bdao.getListPaging(pgvo);
	}

	@Override
	public int totalCount() {
		return bdao.totalCount();
	}

}
