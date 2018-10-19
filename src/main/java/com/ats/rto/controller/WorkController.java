package com.ats.rto.controller;

import java.util.ArrayList;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.rto.common.Constants;
import com.ats.rto.model.GetWork;
import com.ats.rto.model.UpdateStatus;
import com.ats.rto.model.User;

@Controller
public class WorkController {

	RestTemplate rest = new RestTemplate();
	List<GetWork> workList = null;

	@RequestMapping(value = "/showWorkList", method = RequestMethod.GET)
	public ModelAndView showWorkList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/workList");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", 1);

			GetWork[] workListArray = rest.postForObject(Constants.url + "/getWorkHeaderByStatus", map,
					GetWork[].class);
			workList = new ArrayList<GetWork>(Arrays.asList(workListArray));
			model.addObject("workList", workList);

		} catch (Exception e) {

			System.err.println("Exception in showing Error Message Page " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/updateStatusAndCost", method = RequestMethod.POST)
	public String updateStatusAndCost(HttpServletRequest request, HttpServletResponse response) {

		try {

			String[] sendWorkIds = request.getParameterValues("sendWorkIds");

			System.err.println("work ids " + sendWorkIds.toString());

			System.err.println("work ids 0 " + sendWorkIds[0]);

			List<UpdateStatus> upList = new ArrayList<UpdateStatus>();

			for (int i = 0; i < sendWorkIds.length; i++) {

				UpdateStatus up = new UpdateStatus();
				up.setWorkId(Integer.parseInt(sendWorkIds[i]));
				up.setWorkCost(Float.parseFloat(request.getParameter("workCost" + up.getWorkId())));
				up.setStatus(2);
				upList.add(up);
				System.out.println("up" + up.toString());

			}
			System.out.println("updateList" + upList.toString());

			Info errMsg = rest.postForObject(Constants.url + "updateWorkHeaderStatusAndCost", upList, Info.class);
			System.out.println("errMsg" + errMsg);

		} catch (Exception e) {
			System.err.println("err ord updt " + e.getMessage());

			e.printStackTrace();

		}

		return "redirect:/showWorkList";
	}

	@RequestMapping(value = "/editWorkList/{workId}", method = RequestMethod.GET)
	public ModelAndView editWorkList(@PathVariable int workId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/workHeaderDetail");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("workId", workId);
			GetWork getWork = rest.postForObject(Constants.url + "/getWorkHeaderByWorkId", map, GetWork.class);
			model.addObject("getWork", getWork);
			model.addObject("workdetail", getWork.getWorkDetailList());
			System.out.println("list" + getWork.getWorkDetailList());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

}
