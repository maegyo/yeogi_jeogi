package com.yeogi_jeogi.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
//@SessionAttributes("userInfo")
public class loginController {
	final loginDAO dao;
	
	@Autowired
	public loginController(loginDAO dao) {
		this.dao = dao;
	}
	@GetMapping("/login")
	public String loginPage(HttpSession Session) {
		if (Session.getAttribute("userInfo") == null) {
			return "login/login";
		}
		return "login/allogin";
	}
	@PostMapping("/login/send")
	public String loginProduce(HttpSession Session, @ModelAttribute loginUserData lud) {
		try {
			login lg = dao.getUser(lud);
			Session.setAttribute("userInfo", lg);
		}
		catch (Exception e) {
			return "login/loginFail";
		}
		return "main/main";
	}
	
	@GetMapping("/logout")
	public String loginExit(HttpSession session) {
		session.invalidate();
		
		return "/main/main";
	}
}

