package com.spring.muknolja.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.muknolja.mail.RegisterMail;

@Controller
public class AccountController {

	@Autowired
	private RegisterMail rm;

	
	// �̸��� ����
	@RequestMapping("pleaseMail.me")
	@ResponseBody
	String mailConfirm(@RequestParam("email") String email) throws Exception {
		String code = rm.sendSimpleMessage(email);
		System.out.println("�����ڵ� : " + code);
		return code;
	}
}
