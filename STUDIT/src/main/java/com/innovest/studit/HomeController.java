package com.innovest.studit;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innovest.dao.MemberDao;
import com.innovest.dto.questionDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	MemberDao memberdao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		return "redirect:home";
	}

	
	@RequestMapping(value = "/home")
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping("/questionProcess")
	@ResponseBody
	public String questionProcess(Model model, HttpServletRequest httpServletRequest) {
		System.out.println("this is questionProcess");
		String user_name = httpServletRequest.getParameter("user_name");
		String user_phone = httpServletRequest.getParameter("user_phone");
		String user_phone_extra = httpServletRequest.getParameter("user_phone_extra");
		String question_title = httpServletRequest.getParameter("question_title");
		String question_body = httpServletRequest.getParameter("question_body");

		// 게시글이 만들어진 현재 시각 저장 current Time stamp
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());


		questionDTO questionDTO = new questionDTO(user_name,user_phone,user_phone_extra, question_title,question_body, sqlDate);
		
		System.out.println("this is questionDTO's username:"+questionDTO.getUser_name());
		int result_DB = memberdao.insertQuestionByObj(questionDTO);
		
		System.out.println("this is resultDB:"+result_DB);
		
		return "success";
	}
	
	
	@RequestMapping(value = "/admin")
	public String admin(Locale locale, Model model) {
		
		List<questionDTO> resultList = memberdao.selectAllList();
		model.addAttribute("resultList", resultList);
		return "admin";
	}	
	
	
}
