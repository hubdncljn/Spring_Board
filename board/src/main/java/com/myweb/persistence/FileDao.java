package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.FileVO;

public interface FileDao {

	public int insert(FileVO fvo); // 파일 등록
	public int selectBno(int bno); // 파일 유무 확인
	public List<FileVO> getList(int bno); // 파일 목록 조회
	public int delete(int bno); // 파일 삭제

}
