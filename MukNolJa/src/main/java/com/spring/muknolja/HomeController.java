package com.spring.muknolja;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class HomeController {
		
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(HttpSession session) {
		return "home";
	}
	
}