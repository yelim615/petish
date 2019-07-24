package com.community.petish.hospital.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.hospital.domain.Criteria;
import com.community.petish.hospital.domain.PageDTO;
import com.community.petish.hospital.domain.ReviewVO;
import com.community.petish.hospital.service.ReviewService;
@RestController
@RequestMapping("/hospital/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/{id}/{page}", produces="application/json;charset=UTF-8")
	public Map<String, Object> getReview(@PathVariable("id") Long id,@PathVariable("page")int page) {
		List<ReviewVO> rlist;
		rlist = reviewService.getHospitalReview(id);
		boolean isReview = true;
		//페이징 설정위해 만드는 객체
		Criteria cri = new Criteria();
		cri.setHospital_id(id);
		cri.setPageNum(page);
		cri.setAmount(10);
		
		int total = reviewService.getTotalCount(id);
		PageDTO paging = new PageDTO(cri, total, isReview);
		rlist = reviewService.getReviewWithPaging(cri);
		
//		System.out.println("list="+rlist);
//		System.out.println("paging="+paging);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("paging", paging);
		result.put("rlist", rlist);
		return result;
		
	}
	
	@PostMapping(produces="application/json;charset=UTF-8")
	public Map<String, Object> insertReview(@RequestBody ReviewVO vo){
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = reviewService.insertReview(vo);
			retVal.put("res","OK");
			
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
}
