package com.yeogi_jeogi.myPage;

import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.yeogi_jeogi.board.board;
import com.yeogi_jeogi.board.boardComment;
import com.yeogi_jeogi.board.boardDAO;
import com.yeogi_jeogi.login.login;
import com.yeogi_jeogi.reservation.reservation;

@Controller
public class myPageController {
	final myPageDAO dao;
	
	@Autowired
	public myPageController(myPageDAO dao) {
		this.dao = dao;
	}
	@GetMapping("/mypage")
	public String myPagePage(HttpSession Session, Model m) {
		return myPageWrites_bf(Session, m);
	}
	@GetMapping("/mypage/wants")
	public String myPageWants(HttpSession session, Model m) {
		if (session.getAttribute("userInfo") != null) {
			try {
				login lg = (login) session.getAttribute("userInfo");
				myPage mp = dao.getMyInfo(lg.getlUserNum());
				LinkedList<myPageTravel> mpt = dao.getMyInfoTravel(lg.getlUserNum());
				LinkedList<myPagePackage> mpp = dao.getMyInfoPackage(lg.getlUserNum());
				LinkedList<myPageFestival> mpf = dao.getMyInfoFestival(lg.getlUserNum());
				
				session.setAttribute("userMyPageInfo", mp);
				session.setAttribute("userMyPageTravelInfo", mpt);
				session.setAttribute("userMyPagePackageInfo", mpp);
				session.setAttribute("userMyPageFestivalInfo", mpf);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return "myPage/myPageWants";
		}
		return "myPage/myPageFail";
	}
	@GetMapping("/mypage/bfwrites")
	public String myPageWrites_bf(HttpSession session, Model m) {
		return myPageWrites_bf(1, session, m);
	}
	@GetMapping("/mypage/bfwrites/{startNum}")
	public String myPageWrites_bf(@PathVariable int startNum, HttpSession session, Model m) {
		if (session.getAttribute("userInfo") != null) {
			try {
				login lg = (login) session.getAttribute("userInfo");
				myPage mp = dao.getMyInfo(lg.getlUserNum());
				int pageNum = dao.pageNum;
				LinkedList<board> mpwBF = dao.getMyInfoWrites(lg.getlUserNum(), startNum, true);
				session.setAttribute("userMyPageInfo", mp);
				session.setAttribute("userMyPageBfWritesList", mpwBF);
				int maxPageNum_bf = dao.getMaxPageNum(lg.getlUserNum(), true);
				session.setAttribute("MaxPage_bf", maxPageNum_bf);
				session.setAttribute("myWritePageNum", pageNum);
				session.setAttribute("myPageWriteNumColor", startNum);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return "myPage/myPageWrites_bf";
		}
		return "myPage/myPageFail";
	}
	@GetMapping("/mypage/btwrites")
	public String myPageWrites_bt(HttpSession session, Model m) {
		return myPageWrites_bt(1, session, m);
	}
	@GetMapping("/mypage/btwrites/{startNum}")
	public String myPageWrites_bt(@PathVariable int startNum, HttpSession session, Model m) {
		if (session.getAttribute("userInfo") != null) {
			try {
				login lg = (login) session.getAttribute("userInfo");
				myPage mp = dao.getMyInfo(lg.getlUserNum());
				int pageNum = dao.pageNum;
				LinkedList<board> mpwBT = dao.getMyInfoWrites(lg.getlUserNum(), startNum, false);
				session.setAttribute("userMyPageInfo", mp);
				session.setAttribute("userMyPageBtWritesList", mpwBT);
				int maxPageNum_bt = dao.getMaxPageNum(lg.getlUserNum(), false);
				session.setAttribute("MaxPage_bt", maxPageNum_bt);
				session.setAttribute("myWritePageNum", pageNum);
				session.setAttribute("myPageWriteNumColor", startNum);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return "myPage/myPageWrites_bt";
		}
		return "myPage/myPageFail";
	}
	@GetMapping("/mypage/bfwrites/delete/{bNum}")
	public String deleteMyBF(@PathVariable int bNum, HttpSession session) {
		login lg = (login) session.getAttribute("userInfo");
		if (lg != null) {
			boardDAO bfDao = new boardDAO();
			board bf = null;
			try {
				bf = bfDao.getBoard(bNum, true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (lg.getlUserId().equals(bf.getbUserId())) {
				try {
					dao.deleteMyBFWrites(bNum);
				}
				catch (Exception e2) {
					e2.printStackTrace();
				}
				return "redirect:/mypage/bfwrites";
			}
			return "myPage/myPageWrites_bf";
		}
		return "myPage/myPageFail";
	}
	@GetMapping("/mypage/btwrites/delete/{bNum}")
	public String deleteMyBT(@PathVariable int bNum, HttpSession session) {
		login lg = (login) session.getAttribute("userInfo");
		if (lg != null) {
			boardDAO bfDao = new boardDAO();
			board bt = null;
			try {
				bt = bfDao.getBoard(bNum, false);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (lg.getlUserId().equals(bt.getbUserId())) {
				try {
					dao.deleteMyBFWrites(bNum);
				}
				catch (Exception e2) {
					e2.printStackTrace();
				}
				return "redirect:/mypage/btwrites";
			}
			return "myPage/myPageWrites_bt";
		}
		return "myPage/myPageFail";
	}
	@GetMapping("mypage/coms")
	public String myCommentsList(HttpSession session, Model m) {
		return myCommentsList(1, session, m);
	}
	@GetMapping("mypage/coms/{startNum}")
	public String myCommentsList(@PathVariable int startNum, HttpSession session, Model m) {
		login lg = (login) session.getAttribute("userInfo");
		if (lg != null) {
			try {
				LinkedList<boardComment> bdc = dao.getMyAllComments(lg.getlUserNum());
				session.setAttribute("myComList", bdc);
				int maxComPageNum = dao.getComsPageNum(lg.getlUserNum());
				myPage mp = dao.getMyInfo(lg.getlUserNum());
				session.setAttribute("userMyPageInfo", mp);
				session.setAttribute("myComPageNum", maxComPageNum);
				session.setAttribute("myComMaxPageNum", dao.comPageNum);
				session.setAttribute("pageColor", startNum);
			}
			catch (Exception e) {
				e.printStackTrace();
			}	
			return "myPage/myPageComs";
		}
		return "myPage/myPageFail";
	}
	@GetMapping("/mypage/coms/delete/{cNum}")
	public String deleteMyBfCom(@PathVariable long cNum, @RequestParam(value="num") int cUserNum, HttpSession session) {
		login lg = (login) session.getAttribute("userInfo");
		if (lg != null) {
			if (lg.getlUserNum() == cUserNum) {
				try {
					if (String.valueOf(cNum).substring(0, 3).equals("402")) {
						dao.deleteMyComs(true ,cNum);
					}
					else {
						dao.deleteMyComs(false ,cNum);
					}
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				return "redirect:/mypage/coms";
			}
			return "/myPage/myPageNoAuth";
		}
		return "myPage/myPageFail";
	}
	@GetMapping("/mypage/reservations/{startNum}")
	public String myPageReservations(@PathVariable int startNum, HttpSession session, Model m) {
		if (session.getAttribute("userInfo") != null) {
			try {
				login lg = (login) session.getAttribute("userInfo");
				myPage mp = dao.getMyInfo(lg.getlUserNum());
				session.setAttribute("userMyPageInfo", mp);
				LinkedList<reservation> rsvList = dao.getMyAllReservation(lg.getlUserNum());
				int maxRsvPageNum = dao.getRsvPageNum(lg.getlUserNum());
				session.setAttribute("myReservations", rsvList);
				session.setAttribute("myRsvMaxPageNum", maxRsvPageNum);
				session.setAttribute("myRsvPageNum", dao.pageNum);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return "myPage/myPageReservations";
		}
		return "myPage/myPageFail";
	}
	@GetMapping("/mypage/reservations")
	public String myPageReservations(HttpSession session, Model m) {
		return myPageReservations(1, session, m);
	}
}
