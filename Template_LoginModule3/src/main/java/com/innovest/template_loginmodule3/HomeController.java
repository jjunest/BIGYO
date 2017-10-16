package com.innovest.template_loginmodule3;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.html", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/security/login.html")
	public String login(Locale locale, Model model) {
		
		return "security/login";
	}
	
	@RequestMapping("/welcome.html")
	public String welcome(Locale locale, Model model) {
		
		return "security/welcome";
	}
	
	@RequestMapping("/index")
	public String index(Locale locale, Model model) {
		
		return "index";
	}
	
	@RequestMapping("/logoutsuccess")
	public String logoutsuccess(Locale locale, Model model) {
		
		return "logoutsuccess";
	}
	
	@RequestMapping("/loginform_custom")
	public String loginform_custom(Locale locale, Model model) {
		
		return "loginform_custom";
	}
	@RequestMapping("/defaultpage")
	public String defaultpage(Locale locale, Model model) {
		
		return "defaultpage";
	}
	@RequestMapping("/accessdenial")
	public String accessdenial(Locale locale, Model model) {
		
		return "accessdenial";
	}
	
}
