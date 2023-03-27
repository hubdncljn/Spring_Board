package com.myweb.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.domain.FileVO;

@Repository
public class FileDaoImpl implements FileDao {
	private static Logger logger = LoggerFactory.getLogger(FileDaoImpl.class);
	private final String NS = "FileMapper.";
	
	@Autowired
	private SqlSession sql;

	@Override
	public int insert(FileVO fvo) {
		return sql.insert(NS + "regist", fvo);
	}

	@Override
	public int selectBno(int bno) {
		return sql.selectOne(NS + "selectBno", bno);
	}

	@Override
	public List<FileVO> getList(int bno) {
		return sql.selectList(NS + "list", bno);
	}

	@Override
	public int delete(int bno) {
		return sql.delete(NS + "delete", bno);
	}

}
