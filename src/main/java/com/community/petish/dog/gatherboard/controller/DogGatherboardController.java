package com.community.petish.dog.gatherboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dog/gatherboard/*")
public class DogGatherboardController {

	@RequestMapping("/list")
	public String dogGatherboardList() {
		return "petish/dog/gatherboard/list";
	}
	
}