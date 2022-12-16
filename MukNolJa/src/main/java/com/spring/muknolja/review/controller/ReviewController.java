package com.spring.muknolja.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.muknolja.review.model.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService rService;
	
	@RequestMapping("reviewList")
	public String reviewList() {
		return "reveiwList";
	}
}
