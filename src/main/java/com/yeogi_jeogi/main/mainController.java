package com.yeogi_jeogi.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mainController {
	
	@GetMapping("/main")
	public String mainPage() {
		return "main/main";
	}
}
