package com.yeogi_jeogi.board;

import java.util.LinkedList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.yeogi_jeogi.login.login;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class boardController {
	final boardDAO dao = new boardDAO();
	
	@GetMapping("/bflist")
	public String boardFreeList(Model m) {
		LinkedList<board> bd = new LinkedList<board>();
		try {
			int pageNum = dao.pageNum;
			bd = dao.getAllList(1, true);
			int maxPageNum = dao.getMaxPageNum(true);
			m.addAttribute("bfMaxPageNum", maxPageNum);
			m.addAttribute("bfList", bd);
			m.addAttribute("PageNum", pageNum);
			m.addAttribute("bfPageColor", 1);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "board/boardFree/boardFreeList";
	}
	@GetMapping("/btlist")
	public String boardTravelList(Model m) {
		LinkedList<board> bd = new LinkedList<board>();
		try {
			int pageNum = dao.pageNum;
			bd = dao.getAllList(1, false);
			int maxPageNum = dao.getMaxPageNum(false);
			m.addAttribute("btMaxPageNum", maxPageNum);
			m.addAttribute("btList", bd);
			m.addAttribute("PageNum", pageNum);
			m.addAttribute("btPageColor", 1);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "board/boardTravel/boardTravelList";
	}
	@GetMapping("/bflist/{startNum}")
	public String boardFreeList(@PathVariable int startNum, Model m) {
		LinkedList<board> bd = new LinkedList<board>();
		try {
			int pageNum = dao.pageNum;
			bd = dao.getAllList(startNum, true);
			int maxPageNum = dao.getMaxPageNum(true);
			m.addAttribute("bfMaxPageNum", maxPageNum);
			m.addAttribute("bfList", bd);
			m.addAttribute("PageNum", pageNum);
			m.addAttribute("bfPageColor", startNum);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "board/boardFree/boardFreeList";
	}
	@GetMapping("/btlist/{startNum}")
	public String boardTravelList(@PathVariable int startNum, Model m) {
		LinkedList<board> bd = new LinkedList<board>();
		try {
			int pageNum = dao.pageNum;
			bd = dao.getAllList(startNum, false);
			int maxPageNum = dao.getMaxPageNum(false);
			m.addAttribute("btMaxPageNum", maxPageNum);
			m.addAttribute("btList", bd);
			m.addAttribute("PageNum", pageNum);
			m.addAttribute("btPageColor", startNum);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "board/boardTravel/boardTravelList";
	}
	@GetMapping("/bfpost/{bNum}")
	public String getbf(@PathVariable int bNum, Model m) {
		LinkedList<boardComment> bdc = new LinkedList<boardComment>();
		try {
			dao.updateCount(bNum, true);
			board bd = dao.getBoard(bNum, true);
			bdc = dao.getAllCommentList(bNum, true);
			m.addAttribute("boardFree", bd);
			m.addAttribute("bfComList", bdc);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "board/boardFree/boardFreeView";
	}
	@GetMapping("/btpost/{bNum}")
	public String getbt(@PathVariable int bNum, Model m) {
		LinkedList<boardComment> bdc = new LinkedList<boardComment>();
		try {
			dao.updateCount(bNum, false);
			board bd = dao.getBoard(bNum, false);
			bdc = dao.getAllCommentList(bNum, false);
			m.addAttribute("boardTravel", bd);
			m.addAttribute("btComList", bdc);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "board/boardTravel/boardTravelView";
	}
	@GetMapping("/bfwrite")
	public String bfWritePage() {
		return "board/boardFree/boardFreeWrite";
	}
	@GetMapping("/btwrite")
	public String btWritePage() {
		return "board/boardTravel/boardTravelWrite";
	}
	@PostMapping("/bfwrite/add")
	public String addNewBfWrite(HttpSession session, @ModelAttribute board bd, Model m) {
		try {
			login lg = (login) session.getAttribute("userInfo");
			bd.setbUserId(lg.getlUserId());
			dao.addWrite(bd, true);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/bflist";
	}
	@PostMapping("/btwrite/add")
	public String addNewBtWrite(HttpSession session, @ModelAttribute board bd, Model m) {
		try {
			login lg = (login) session.getAttribute("userInfo");
			bd.setbUserId(lg.getlUserId());
			dao.addWrite(bd, false);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/btlist";
	}
	@PostMapping("/bfpost/addcom")
	public String addNewBfComment(HttpSession session, @ModelAttribute boardComment bdc, Model m) {
		try {
			login lg = (login) session.getAttribute("userInfo");
			bdc.setcUserNum(lg.getlUserNum());
			dao.addComment(bdc, true);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/bfpost/"+bdc.getcBNum();
	}
	@PostMapping("/btpost/addcom")
	public String addNewBtComment(HttpSession session, @ModelAttribute boardComment bdc, Model m) {
		try {
			login lg = (login) session.getAttribute("userInfo");
			bdc.setcUserNum(lg.getlUserNum());
			dao.addComment(bdc, false);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/btpost/"+bdc.getcBNum();
	}
}
