package com.myweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.domain.BoardVO;
import com.myweb.domain.FileVO;
import com.myweb.domain.PageVO;
import com.myweb.persistence.BoardDao;
import com.myweb.persistence.FileDao;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao bdao;
	
	@Autowired
	private FileDao fdao;
	
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

	@Override
	public BoardVO getDetail(int bno) {
		BoardVO bvo = bdao.getDetail(bno);
		int fcnt = fdao.selectBno(bno);
		if(fcnt > 0) { // 파일 유무 확인
			List<FileVO> flist = fdao.getList(bno);
			bvo.setFlist(flist);
		}
		return bvo;
	}

	@Override
	public int getCurrBno() {
		return bdao.getCurrBno();
	}

	@Override
	public int modify(BoardVO board) {
		fdao.delete(board.getBno()); // 기존 파일 삭제
		return bdao.modify(board);
	}

	@Override
	public int remove(int bno) {
		fdao.delete(bno); // 기존 파일 삭제
		return bdao.remove(bno);
	}

}
