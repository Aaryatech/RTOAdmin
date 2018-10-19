package com.ats.rto.controller;

import java.util.ArrayList;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.rto.common.Constants;
import com.ats.rto.model.GetWork;

@Controller
public class WorkController {

	RestTemplate rest = new RestTemplate();

	@RequestMapping(value = "/showWorkList", method = RequestMethod.GET)
	public ModelAndView showWorkList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/workList");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", 1);

			GetWork[] workListArray = rest.postForObject(Constants.url + "/getWorkHeaderByStatus", map, GetWork[].class);
			List<GetWork> workList = new ArrayList<GetWork>(Arrays.asList(workListArray));
			model.addObject("workList", workList);

		} catch (Exception e) {

			System.err.println("Exception in showing Error Message Page " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

}
