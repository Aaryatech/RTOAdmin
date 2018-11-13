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
	List<GetWork> workList;
	List<User> userList = null;

	@RequestMapping(value = "/showWorkList", method = RequestMethod.GET)
	public ModelAndView showWorkList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/workList");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", 1);

			GetWork[] workListArray = rest.postForObject(Constants.url + "/getWorkHeaderByStatus", map,
					GetWork[].class);
			workList = new ArrayList<GetWork>(Arrays.asList(workListArray));
			System.out.println("workListArray" + workListArray.toString());

			System.out.println("workLIst" + workList.toString());
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

	@RequestMapping(value = "/updateStatusAndCostHeaderDetail", method = RequestMethod.POST)
	public String updateStatusAndCostHeaderDetail(HttpServletRequest request, HttpServletResponse response) {

		try {

			String sendWorkId = request.getParameter("sendWorkId");

			String workCost = request.getParameter("workCost");

			System.err.println("work ids " + sendWorkId.toString());

			List<UpdateStatus> upList = new ArrayList<UpdateStatus>();

			UpdateStatus up = new UpdateStatus();
			up.setWorkId(Integer.parseInt(sendWorkId));
			up.setWorkCost(Float.parseFloat(workCost));
			up.setStatus(2);
			upList.add(up);
			System.out.println("up" + up.toString());

			System.out.println("updateList" + upList.toString());

			Info errMsg = rest.postForObject(Constants.url + "updateWorkHeaderStatusAndCost", upList, Info.class);
			System.out.println("errMsg" + errMsg);

		} catch (Exception e) {
			System.err.println("err ord updt " + e.getMessage());

			e.printStackTrace();

		}

		return "redirect:/showWorkList";
	}

	@RequestMapping(value = "/showUpdatePayment", method = RequestMethod.GET)
	public ModelAndView showUpdatePayment(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/updatePayment");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", 2);

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

	@RequestMapping(value = "/updatePaymentAndStatus", method = RequestMethod.POST)
	public String updatePaymentAndStatus(HttpServletRequest request, HttpServletResponse response) {

		try {

			String[] sendWorkIds = request.getParameterValues("sendWorkIds");

			System.err.println("work ids " + sendWorkIds.toString());

			System.err.println("work ids 0 " + sendWorkIds[0]);

			List<UpdateStatus> upList = new ArrayList<UpdateStatus>();

			for (int i = 0; i < sendWorkIds.length; i++) {

				UpdateStatus up = new UpdateStatus();

				float a = Float.parseFloat(request.getParameter("workCost" + sendWorkIds[i]));
				float b = Float.parseFloat(request.getParameter("exInt1" + sendWorkIds[i]));

				float c = a - b;

				int workCost1;
				workCost1 = (int) c;

				up.setWorkId(Integer.parseInt(sendWorkIds[i]));
				up.setExInt1(Integer.parseInt(request.getParameter("exInt1" + up.getWorkId())));
				up.setExInt2(workCost1);

				up.setStatus(3);
				upList.add(up);
				System.out.println("up" + up.toString());

			}
			System.out.println("updateList" + upList.toString());

			Info errMsg = rest.postForObject(Constants.url + "updateWorkPayment", upList, Info.class);
			System.out.println("errMsg" + errMsg);

		} catch (Exception e) {
			System.err.println("err ord updt " + e.getMessage());

			e.printStackTrace();

		}

		return "redirect:/showUpdatePayment";
	}

	@RequestMapping(value = "/showUserAllocation", method = RequestMethod.GET)
	public ModelAndView showUserAllocation(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/userAllocation");
		try {

			User[] userListArray = rest.getForObject(Constants.url + "/getAllUserList", User[].class);
			userList = new ArrayList<User>(Arrays.asList(userListArray));
			model.addObject("userList", userList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", 3);

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

	@RequestMapping(value = "/updateStatusAndUserId", method = RequestMethod.POST)
	public String updateStatusAndUserId(HttpServletRequest request, HttpServletResponse response) {

		try {
			String userId = request.getParameter("userId");

			String[] sendWorkIds = request.getParameterValues("sendWorkIds");

			StringBuilder sb = new StringBuilder();

			for (int i = 0; i < sendWorkIds.length; i++) {
				sb = sb.append(sendWorkIds[i] + ",");

			}
			String items = sb.toString();
			items = items.substring(0, items.length() - 1);

			System.err.println("work ids " + sendWorkIds.toString());

			System.err.println("work ids 0 " + sendWorkIds[0]);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("workIdList", items);
			map.add("status", 4);
			map.add("userId", userId);

			Info errMsg = rest.postForObject(Constants.url + "updateWorkStatusAndUserId", map, Info.class);
			System.out.println("errMsg" + errMsg);

		} catch (Exception e) {
			System.err.println("err ord updt " + e.getMessage());

			e.printStackTrace();

		}
		return "redirect:/showUserAllocation";

	}

	@RequestMapping(value = "/showDocInOffice", method = RequestMethod.GET)
	public ModelAndView showDocInOffice(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/docInOffice");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", 4);

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

	@RequestMapping(value = "/showDocSubmitAtRto", method = RequestMethod.GET)
	public ModelAndView showDocSubmitAtRto(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/docSubmitAtRto");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", 5);

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

	@RequestMapping(value = "/showActualDocToCust", method = RequestMethod.GET)
	public ModelAndView showActualDocToCust(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/actualDocToCust");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", 6);

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

	@RequestMapping(value = "/updateWorkStatus", method = RequestMethod.POST)
	public String updateWorkStatus(HttpServletRequest request, HttpServletResponse response) {
		int status = Integer.parseInt(request.getParameter("status"));
		try {

			String[] sendWorkIds = request.getParameterValues("sendWorkIds");

			StringBuilder sb = new StringBuilder();

			for (int i = 0; i < sendWorkIds.length; i++) {
				sb = sb.append(sendWorkIds[i] + ",");

			}
			String items = sb.toString();
			items = items.substring(0, items.length() - 1);

			System.err.println("work ids " + sendWorkIds.toString());

			System.err.println("work ids 0 " + sendWorkIds[0]);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("workIdList", items);
			map.add("status", status);

			Info errMsg = rest.postForObject(Constants.url + "updateWorkStatus", map, Info.class);
			System.out.println("errMsg" + errMsg);

		} catch (Exception e) {
			System.err.println("err ord updt " + e.getMessage());

			e.printStackTrace();

		}
		if (status == 5) {
			return "redirect:/showDocInOffice";
		} else if (status == 6) {
			return "redirect:/showDocSubmitAtRto";
		} else if (status == 7) {
			return "redirect:/showActualDocToCust";

		}

		return "redirect:/showDocInOffice";
	}

	@RequestMapping(value = "/editWorkDetail/{workId}", method = RequestMethod.GET)
	public ModelAndView editWorkDetail(@PathVariable int workId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/workDetail");
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

	@RequestMapping(value = "/editWorkPaymentDetail/{workId}", method = RequestMethod.GET)
	public ModelAndView editWorkPaymentDetail(@PathVariable int workId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/upPaymentDetail");
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

	@RequestMapping(value = "/updateDetailPaymentAndStatus", method = RequestMethod.POST)
	public String updateDetailPaymentAndStatus(HttpServletRequest request, HttpServletResponse response) {

		try {

			String sendWorkId = request.getParameter("sendWorkId");

			List<UpdateStatus> upList = new ArrayList<UpdateStatus>();

			UpdateStatus up = new UpdateStatus();

			float a = Float.parseFloat(request.getParameter("workCost"));
			float b = Float.parseFloat(request.getParameter("exInt1"));

			float c = a - b;

			int workCost1;
			workCost1 = (int) c;

			up.setWorkId(Integer.parseInt(sendWorkId));
			up.setExInt1(Integer.parseInt(request.getParameter("exInt1")));
			up.setExInt2(workCost1);

			up.setStatus(3);
			upList.add(up);
			System.out.println("up" + up.toString());

			System.out.println("updateList" + upList.toString());

			Info errMsg = rest.postForObject(Constants.url + "updateWorkPayment", upList, Info.class);
			System.out.println("errMsg" + errMsg);

		} catch (Exception e) {
			System.err.println("err ord updt " + e.getMessage());

			e.printStackTrace();

		}

		return "redirect:/showUpdatePayment";
	}

}
