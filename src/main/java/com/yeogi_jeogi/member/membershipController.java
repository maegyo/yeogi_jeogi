package com.yeogi_jeogi.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class membershipController {
	final membershipDAO dao;
	
	@Autowired
	public membershipController(membershipDAO dao) {
		this.dao = dao;
	}
	@GetMapping("/membership")
	public String membershipPage() {
		return "member/membership";
	}
	@PostMapping("/membership/add")
	public String addmembership(@ModelAttribute membership mem, Model m) {
		try {
			dao.addmember(mem);
		}
		catch (Exception e) {
			e.printStackTrace();
			return "login/membershipFail";
		}
		return "member/membershipSuccess";
	}
}
