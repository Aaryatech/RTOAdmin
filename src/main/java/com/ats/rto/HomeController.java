package com.ats.rto;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.rto.common.Constants;
import com.ats.rto.model.LoginResUser;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "login";
	}

	RestTemplate rest = new RestTemplate();

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest request, HttpServletResponse response) {
		System.err.println("Inside Login Process");

		ModelAndView model = null;

		String mobNo = request.getParameter("username");

		String pass = request.getParameter("password");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("userMobile", mobNo);
		map.add("userPassword", pass);

		LoginResUser logResUser = rest.postForObject(Constants.url + "/loginResponseUser", map, LoginResUser.class);
		if (logResUser.isError() == false) {

			model = new ModelAndView("home");

			HttpSession session = request.getSession();

			session.setAttribute("user", logResUser.getUser());
			session.setAttribute("hubId", logResUser.getUser().getUserId());

			System.err.println("logResUser " + logResUser.toString());

			return "redirect:/home";

		} else {
			model = new ModelAndView("login");
			model.addObject("loginErr", "Login Failed");

			System.err.println("logResUser" + logResUser.toString());

			return "redirect:/invalidLogin";

		}

	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("home");
		try {

		} catch (Exception e) {

			System.err.println("Exce ing etHubDashBoard  " + e.getMessage());
			e.printStackTrace();

		}

		return model;
	}

}
