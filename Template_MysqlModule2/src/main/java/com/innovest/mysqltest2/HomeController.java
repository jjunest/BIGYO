package com.innovest.mysqltest2;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private MemberService memberservice;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String usercheck() throws Exception {
		System.out.println("this is usercheck() in HomeController.java");
		System.out.println("this is usercheck() in HomeController.java and @autowired memberservice is "+memberservice);
		int cnt = 0;
		cnt = memberservice.userIdCheck("admin");
		System.out.println("this is usercheck and cnt is :" + cnt);
		return "main/index";
	}

}