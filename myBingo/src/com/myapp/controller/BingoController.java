package com.myapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.myapp.service.bingo.BingoService;
import com.myapp.util.HttpUtil;

@Controller
public class BingoController {
	
	@Autowired
	private BingoService bingoService;

	// 빙고 리스트 페이지 이동
	@RequestMapping(value="/bingo/goBingoPage.do")
	public String goBingoPage(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		return "../document/bingo/bingoPage";
	}
	
	// 빙고 조회
	@RequestMapping(value="/bingo/selectBingoIntro.do")
	public String selectBingoIntro(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(request);
		List<Map<String, Object>> listMap = new ArrayList<Map<String,Object>>();
		
		// id 로그 찍을위치
		
		listMap.add(0,paramMap);
		model.addAttribute("list",listMap);
		
		return "../document/bingo/bingoPage_sub";
	}
	
	// 빙고 데이터 가져오기
	@RequestMapping(value="/bingo/selectBingo")
	public ModelAndView selectBingo(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "file", required = false) MultipartFile file) {
		System.out.println("selectBingo Start");
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(request);
		HashMap<String, Object> map = new HashMap<String, Object>();
		try{
			System.out.println("Select1");
			map = bingoService.selectBingo(paramMap);
			System.out.println("Select2");
		}catch(DataAccessException e){
			e.printStackTrace();
		}
		
		
		System.out.println(map);
		System.out.println("selectBingo End");

		return HttpUtil.makeHashToJsonModelAndView(map);
	}
}
