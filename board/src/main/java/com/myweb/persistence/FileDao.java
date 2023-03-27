package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.FileVO;

public interface FileDao {

	public int insert(FileVO fvo); // 등록
	public int selectBno(int bno); // 해당 게시글 번호에 파일 유무 확인
	public List<FileVO> getList(int bno); // 목록 조회

}
