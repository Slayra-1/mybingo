package com.myapp.service.bingo.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myapp.dao.bingo.BingoSqlMapDAO;
import com.myapp.service.bingo.BingoService;

@Service("BingoService")
public class BingoServiceImpl implements BingoService{

	@Autowired
	private BingoSqlMapDAO bingoSqlMapDAO;

	// 빙고 상세 조회
	@Override
	public HashMap<String, Object> selectBingo(HashMap<String, Object> paramMap) {
		// start log
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("bingoId : " + paramMap.get("bingoId"));
		
		try {
			boolean check = true;
			
			if(null==paramMap.get("bingoId") || ("").equals(paramMap.get("bingoId"))) {
				check = false;
				map.put("msgCode", -1);
				map.put("msgTitle", "알림");
				map.put("msgDesc", "해당 빙고 데이터 조회에 실패했습니다.");
			}
			
			if(check) {
				List<Map<String, Object>> bingoListMap = bingoSqlMapDAO.selectBingo(paramMap);
				
				map.put("msgCode", 0);
				map.put("rows", bingoListMap);
				System.out.println("insert");
			}
		}catch(DataAccessException e) {
			
		}
		
		// end 로그
		return map;
	}
	
}
