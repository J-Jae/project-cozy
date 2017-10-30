package com.nts.cozy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * @author project_박정재_신창환
 *
 */
@Controller
public class WelcomeController {

	@GetMapping({"/", "index"})
	public String loadIndexViewByGet() {
		return "redirect:/review/list";
	}
	
	@PostMapping({"/", "index"})
	public String loadIndexViewByPost() {
		return "redirect:/review/list";
	}
		
}
