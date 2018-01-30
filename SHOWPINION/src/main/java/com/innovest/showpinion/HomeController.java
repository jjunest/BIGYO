package com.innovest.showpinion;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
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
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		System.out.println("this is home");
		
		return "redirect:main";
	}
	
	@RequestMapping("/main")
	public String main(Model model) {
		System.out.println("this is main");
		
		return "main";
	}
	
	@RequestMapping("/login_custom")
	public String login_custom(Model model) {
		System.out.println("this is login_custom");
		
		return "login_custom";
	}
	
	@RequestMapping("/thisWeekTopics")
	public String thisWeekTopics(Model model) {
		System.out.println("this is thisWeekTopics");
		
		return "thisWeekTopics";
	}
	
	@RequestMapping("/all_TVshow_Topics")
	public String all_TVshow_Topics(Model model) {
		System.out.println("this is all_TVshow_Topics");
		
		return "all_TVshow_Topics";
	}
	@RequestMapping("/all_Showpinion_Topics")
	public String all_Showpinion_Topics(Model model) {
		System.out.println("this is all_Showpinion_Topics");
		
		return "all_Showpinion_Topics";
	}
	
	
	@RequestMapping("/masonryportfolio3")
	public String masonryportfolio3(Model model) {
		System.out.println("this is masonry-portfolio-3");
		
		return "masonry-portfolio-3";
	}
	
	@RequestMapping("/detail_TVshow_Topics")
	public String detail_TVshow_Topics(Model model) {
		System.out.println("this is detail_TVshow_Topics");
		
		return "detail_TVshow_Topics";
	}
	
	
	
	
}
