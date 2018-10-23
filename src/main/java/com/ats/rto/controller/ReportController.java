package com.ats.rto.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.rto.common.Constants;
import com.ats.rto.common.DateConvertor;
import com.ats.rto.model.GetWork;
import com.ats.rto.model.TaskDesc;
import com.ats.rto.model.WorkType;

@Controller
public class ReportController {

	RestTemplate rest = new RestTemplate();
	List<GetWork> workList;

	@RequestMapping(value = "/showReportStatuswise", method = RequestMethod.GET)
	public ModelAndView showReportStatuswise(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("reports/enqwiseReport");
		try {

			WorkType[] workListArray = rest.getForObject(Constants.url + "/getAllWorkTypeList", WorkType[].class);
			List<WorkType> workList = new ArrayList<WorkType>(Arrays.asList(workListArray));
			model.addObject("workList", workList);

			TaskDesc[] taskListArray = rest.getForObject(Constants.url + "/getAllTaskList", TaskDesc[].class);
			List<TaskDesc> taskList = new ArrayList<TaskDesc>(Arrays.asList(taskListArray));
			model.addObject("taskList", taskList);

		} catch (Exception e) {

			System.err.println("Exception in showing Error Message Page " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/getEnqByDate", method = RequestMethod.GET)
	@ResponseBody
	public List<GetWork> getEnqByDate(HttpServletRequest request, HttpServletResponse response) {

		workList = new ArrayList<GetWork>();
		try {

			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String wokTypeId = request.getParameter("wokTypeId");
			String status = request.getParameter("status");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));

			map.add("wokTypeId", wokTypeId);
			map.add("status", status);
			GetWork[] getList = rest.postForObject(Constants.url + "getcategoryDistReport", map, GetWork[].class);
			workList = new ArrayList<GetWork>(Arrays.asList(getList));
			// export to excel

		} catch (Exception e) {
			e.printStackTrace();
		}

		return workList;
	}

}
