package com.ats.rto.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.rto.common.Constants;
import com.ats.rto.model.User;
import com.ats.rto.model.WorkType;

@Controller
public class TxController {
	RestTemplate rest = new RestTemplate();

	@RequestMapping(value = "/showAddWorkHeader", method = RequestMethod.GET)
	public ModelAndView showAddWorkHeader(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/addWorkHeader");
		try {
			WorkType[] workListArray = rest.getForObject(Constants.url + "/getAllUserList", WorkType[].class);
			List<WorkType> workList = new ArrayList<WorkType>(Arrays.asList(workListArray));
			model.addObject("workList", workList);

		} catch (Exception e) {

			System.err.println("Exception in showing Error Message Page " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

}
