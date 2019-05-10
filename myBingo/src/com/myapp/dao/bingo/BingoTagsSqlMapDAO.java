package com.myapp.dao.bingo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class BingoTagsSqlMapDAO extends SqlSessionDaoSupport{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@PostConstruct
	void init() {
		setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	// 빙고 태그 조회
	public List<Map<String, Object>> selectBingoTags(HashMap<String, Object> paramMap) throws DataAccessException{
		// 시작 로그
		String sqlId = "BingoTags.selectBingoTags";
		// 종료 로그
		return getSqlSession().selectList(sqlId, paramMap);
	}
}
