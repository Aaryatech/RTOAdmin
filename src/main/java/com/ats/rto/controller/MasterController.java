package com.ats.rto.controller;

import java.text.DateFormat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ats.rto.common.Constants;
import com.ats.rto.common.DateConvertor;
import com.ats.rto.common.VpsImageUpload;
import com.ats.rto.model.Cust;
import com.ats.rto.model.GetCount;
import com.ats.rto.model.GetWork;
import com.ats.rto.model.User;
import com.ats.rto.model.WorkType;

@Controller
public class MasterController {
	RestTemplate rest = new RestTemplate();

	@RequestMapping(value = "/showAddUser", method = RequestMethod.GET)
	public ModelAndView showAddUserMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addUser");
		try {
			User[] userListArray = rest.getForObject(Constants.url + "/getAllUserList", User[].class);
			List<User> userList = new ArrayList<User>(Arrays.asList(userListArray));
			model.addObject("userList", userList);

		} catch (Exception e) {

			System.err.println("Exception in showing Error Message Page " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

	/*
	 * @RequestMapping(value = "/showDashbord", method = RequestMethod.GET) public
	 * ModelAndView showDashbord(HttpServletRequest request, HttpServletResponse
	 * response) {
	 * 
	 * ModelAndView model = new ModelAndView("work/home"); try {
	 * 
	 * } catch (Exception e) {
	 * 
	 * System.err.println("Exception in showing Error Message Page " +
	 * e.getMessage()); e.printStackTrace(); }
	 * 
	 * return model;
	 * 
	 * }
	 */
	@RequestMapping(value = "/showDashbord", method = RequestMethod.GET)
	public ModelAndView showWorkList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("work/home");
		try {

			GetCount count = rest.getForObject(Constants.url + "/getCountByStatus", GetCount.class);

			System.out.println("count" + count.toString());
			model.addObject("dashBoard", count);

		} catch (Exception e) {

			System.err.println("Exception in showing Error Message Page " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	public String insertUser(HttpServletRequest request, HttpServletResponse response) {

		try {
			Date now = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String datetime = sdf1.format(now.getTime());

			String userId = request.getParameter("userId");

			String userName = request.getParameter("userName");
			String userEmail = request.getParameter("userEmail");
			String contactNo = request.getParameter("contactNo");
			String pwd = request.getParameter("password");
			String dateOfBirth = request.getParameter("dateOfBirth");

			User user = new User();

			if (userId == "" || userId == null)
				user.setUserId(0);
			else
				user.setUserId(Integer.parseInt(userId));
			user.setIsUsed(1);
			user.setLastUpdatedTime(datetime);
			user.setUserDob(DateConvertor.convertToYMD(dateOfBirth));
			user.setUserEmail(userEmail);
			user.setUserName(userName);
			user.setUserMobile(contactNo);
			user.setUserPassword(pwd);

			User userInserRes = rest.postForObject(Constants.url + "/saveUser", user, User.class);

			System.out.println("hubUserInserRes " + userInserRes);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showAddUser";
	}

	@RequestMapping(value = "/editUser/{userId}", method = RequestMethod.GET)
	public ModelAndView editUser(@PathVariable int userId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addUser");
		try {

			User[] userListArray = rest.getForObject(Constants.url + "/getAllUserList", User[].class);
			List<User> userList = new ArrayList<User>(Arrays.asList(userListArray));
			model.addObject("userList", userList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("userId", userId);
			User editUser = rest.postForObject(Constants.url + "/getUserByUserId", map, User.class);
			model.addObject("editUser", editUser);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/deleteUser/{userId}", method = RequestMethod.GET)
	public String deleteUser(@PathVariable int userId, HttpServletRequest request, HttpServletResponse response) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("userId", userId);
			Info info = rest.postForObject(Constants.url + "/deleteUser", map, Info.class);

			System.out.println("info " + info);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showAddUser";
	}

	@RequestMapping(value = "/showAddCustomer", method = RequestMethod.GET)
	public ModelAndView showAddCustomer(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addCust");
		try {
			Cust[] userListArray = rest.getForObject(Constants.url + "/getAllCustList", Cust[].class);
			List<Cust> custList = new ArrayList<Cust>(Arrays.asList(userListArray));
			model.addObject("userList", custList);

		} catch (Exception e) {

			System.err.println("Exception in showing Error Message Page " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/insertCust", method = RequestMethod.POST)
	public String insertCust(HttpServletRequest request, HttpServletResponse response) {

		try {
			Date now = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String datetime = sdf1.format(now.getTime());

			String custId = request.getParameter("custId");

			String userName = request.getParameter("userName");
			String userEmail = request.getParameter("userEmail");
			String contactNo = request.getParameter("contactNo");
			String pwd = request.getParameter("password");
			String dateOfBirth = request.getParameter("dateOfBirth");
			String addPincode = request.getParameter("addPincode");

			Cust cust = new Cust();

			if (custId == "" || custId == null)
				cust.setCustId(0);

			else

				cust.setCustId(Integer.parseInt(custId));

			cust.setCustDob(DateConvertor.convertToYMD(dateOfBirth));
			cust.setIsUsed(1);
			cust.setCustEmail(userEmail);
			cust.setCustName(userName);
			cust.setCustMobile(contactNo);
			cust.setCustPassword(pwd);
			cust.setLastUpdateTime(datetime);
			cust.setSutTime(datetime);
			cust.setAddPincode(addPincode);

			Cust userInserRes = rest.postForObject(Constants.url + "/saveCust", cust, Cust.class);

			System.out.println("cusInserRes " + userInserRes);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showAddCustomer";
	}

	@RequestMapping(value = "/editCust/{custId}", method = RequestMethod.GET)
	public ModelAndView editCust(@PathVariable int custId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addCust");
		try {

			Cust[] userListArray = rest.getForObject(Constants.url + "/getAllCustList", Cust[].class);
			List<Cust> custList = new ArrayList<Cust>(Arrays.asList(userListArray));
			model.addObject("userList", custList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("custId", custId);
			Cust editCust = rest.postForObject(Constants.url + "/getCustByCustId", map, Cust.class);
			model.addObject("editUser", editCust);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/deleteCust/{custId}", method = RequestMethod.GET)
	public String deleteCust(@PathVariable int custId, HttpServletRequest request, HttpServletResponse response) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("custId", custId);
			Info info = rest.postForObject(Constants.url + "/deleteCust", map, Info.class);

			System.out.println("info " + info);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showAddCustomer";
	}

	@RequestMapping(value = "/showAddWorkType", method = RequestMethod.GET)
	public ModelAndView showAddWorkType(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addWorkType");
		try {

			WorkType[] workListArray = rest.getForObject(Constants.url + "/getAllWorkTypeList", WorkType[].class);
			List<WorkType> workList = new ArrayList<WorkType>(Arrays.asList(workListArray));
			model.addObject("workList", workList);

			model.addObject("workImageUrl", Constants.IMAGE_FOLDER);

		} catch (Exception e) {

			System.err.println("Exception in showing Error Message Page " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/insertWorkType", method = RequestMethod.POST)
	public String insertWorkType(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("imgInp") List<MultipartFile> file, @RequestParam("imgInp1") List<MultipartFile> file1) {

		try {

			String workTypeName = request.getParameter("workTypeName");

			String workTypeId = request.getParameter("workTypeId");

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date now = new Date();
			Calendar cal = Calendar.getInstance();
			String datetime = sdf.format(now.getTime());
			System.out.println("datetime" + datetime);

			System.out.println("datetime" + datetime);

			int wType = Integer.parseInt(request.getParameter("wType"));
			System.out.println("wType" + wType);

			System.out.println("Previous Image1" + file.get(0).getOriginalFilename());
			System.out.println("Previous Image2" + file1.get(0).getOriginalFilename());

			// System.out.println("Previous Image2" + prevImage2);
			WorkType workType = new WorkType();
			String prevImage2 = null;
			String prevImage1 = null;

			try {
				if (!file.get(0).getOriginalFilename().equalsIgnoreCase("")) {
					VpsImageUpload imgUpload = new VpsImageUpload();

					String tStamp = dateFormat.format(cal.getTime());
					String extension = FilenameUtils.getExtension(file.get(0).getOriginalFilename());

					// String prevImage1 = new String();
					prevImage1 = tStamp + "." + extension;
					imgUpload.saveUploadedFiles(file.get(0), Constants.CAT_FILE_TYPE, prevImage1);

					System.out.println("prevImage1" + prevImage1);
				}

				if (!file1.get(0).getOriginalFilename().equalsIgnoreCase("")) {
					VpsImageUpload imgUpload = new VpsImageUpload();

					String tStamp = dateFormat.format(cal.getTime());
					String extension = FilenameUtils.getExtension(file1.get(0).getOriginalFilename());

					prevImage2 = tStamp + "25." + extension;
					imgUpload.saveUploadedFiles(file1.get(0), Constants.CAT_FILE_TYPE, prevImage2);
					System.out.println("prevImage2" + prevImage2);

				}
			} catch (Exception e) {
				System.err.println("Exc in uploading WorkType Imag " + e.getMessage());
				e.printStackTrace();

			}

			workType.setWorkTypeId(Integer.parseInt(workTypeId));
			workType.setWorkImage2(prevImage2);
			workType.setWorkImage1(prevImage1);

			workType.setIsUsed(1);

			workType.setLastUpdateTime(datetime);
			workType.setwType(wType);
			workType.setWorkTypeName(workTypeName);
			System.out.println("workTypeInsert bean" + workType.toString());

			WorkType workTypeInsertResponse = rest.postForObject(Constants.url + "/saveWorkType", workType,
					WorkType.class);
			System.out.println("workTypeInsert Response" + workTypeInsertResponse.toString());

		} catch (Exception e) {

			System.err.println("Exception in /insertWorktype @MastContr  " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showAddWorkType";

	}

	@RequestMapping(value = "/getEditWorkType", method = RequestMethod.GET)
	public @ResponseBody WorkType getEditCategoryMethod(HttpServletRequest request, HttpServletResponse response) {
		WorkType workEdit = null;

		try {
			int workTypeId = Integer.parseInt(request.getParameter("workTypeId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("workTypeId", workTypeId);
			workEdit = rest.postForObject(Constants.url + "/getWorkTypeByWorkTypeId", map, WorkType.class);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return workEdit;

	}

	@RequestMapping(value = "/deleteWorkType/{workTypeId}", method = RequestMethod.GET)
	public String deleteWorkType(@PathVariable int workTypeId, HttpServletRequest request,
			HttpServletResponse response) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("workTypeId", workTypeId);
			Info info = rest.postForObject(Constants.url + "/deleteWorkType", map, Info.class);

			System.out.println("info " + info);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showAddWorkType";
	}

	@RequestMapping(value = "/editMyProfile/{userId}", method = RequestMethod.GET)
	public ModelAndView editMyProfile(@PathVariable int userId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("editProfile");
		try {

			HttpSession session = request.getSession();
			User login = (User) session.getAttribute("user");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("userId", login.getUserId());
			User editUser = rest.postForObject(Constants.url + "/getUserByUserId", map, User.class);
			model.addObject("editUser", editUser);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/getMobileNoForAdd", method = RequestMethod.GET)
	public @ResponseBody Info getMobileNoForAdd(HttpServletRequest request, HttpServletResponse response) {
		Info info = new Info();
		try {

			String contactNo = request.getParameter("contactNo");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("userMobile", contactNo);
			info = rest.postForObject(Constants.url + "/getUserByMobileNo", map, Info.class);
			System.out.println("info" + info.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return info;
	}

	@RequestMapping(value = "/getMobileNoForAddCust", method = RequestMethod.GET)
	public @ResponseBody Info getMobileNoForAddCust(HttpServletRequest request, HttpServletResponse response) {
		Info info = new Info();
		try {

			String contactNo = request.getParameter("contactNo");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("custMobile", contactNo);
			info = rest.postForObject(Constants.url + "/getCustomerByMobileNo", map, Info.class);
			System.out.println("info" + info.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return info;
	}

}
