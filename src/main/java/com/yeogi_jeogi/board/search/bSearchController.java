package com.yeogi_jeogi.board.search;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.yeogi_jeogi.board.board;

@Controller
public class bSearchController {
	final bSearchDAO dao;
	
	public bSearchController(bSearchDAO dao) {
		this.dao = dao;
	}
	@GetMapping("/search/" )
	public String getSearchBFList(@ModelAttribute bSearch bs, Model m) {
		ArrayList<board> bf = new ArrayList<board>();
		try {
			bf = dao.searchBFListAll(bs);
			m.addAttribute("searchBF", bf);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/search/searchView";
	}
	@PostMapping("/search/ing")
	public String searchBF() {
		return "";
	}
	
}
