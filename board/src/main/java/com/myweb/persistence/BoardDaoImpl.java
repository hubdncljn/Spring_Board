package com.myweb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.domain.BoardVO;
import com.myweb.domain.PageVO;

@Repository
public class BoardDaoImpl implements BoardDao {
	private final String NS = "BoardMapper.";
	
	@Autowired
	private SqlSession sql;
	
	@Override
	public int regist(BoardVO board) {
		return sql.insert(NS + "regist", board);
	}

	@Override
	public List<BoardVO> getList() {
		return sql.selectList(NS + "getList");
	}

	@Override
	public List<BoardVO> getListPaging(PageVO pgvo) {
		return sql.selectList(NS + "getListPaging" , pgvo);
	}

	@Override
	public int totalCount(PageVO pgvo) {
		return sql.selectOne(NS + "totalCount" , pgvo);
	}

	@Override
	public BoardVO getDetail(int bno) {
		return sql.selectOne(NS + "getDetail", bno);
	}

	@Override
	public int getCurrBno() {
		return sql.selectOne(NS + "getCurrBno");
	}

	@Override
	public int modify(BoardVO board) {
		return sql.update(NS + "modify", board);
	}

	@Override
	public int remove(int bno) {
		return sql.delete(NS + "remove", bno);
	}

	@Override
	public void updateRC(int bno, int qty) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("bno", bno);
		map.put("qty", qty);
		sql.update(NS + "upReadCount", map);
	}

}
