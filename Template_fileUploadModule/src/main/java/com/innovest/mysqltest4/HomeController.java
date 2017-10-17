package com.innovest.mysqltest4;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.innovest.dao.MemberDao;
import com.innovest.dto.MemberDto;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	MemberDao memberdao;

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

		int cnt = 0;

		// selctOne 시작
		cnt = memberdao.mysqlCheck("admin");
		System.out.println("this is usercheck and cnt is :" + cnt);
		// selctOne 끝

		// selctList 시작
		List<MemberDto> memberlist_result = memberdao.select_allList();
		for (int i = 0; i < memberlist_result.size(); i++) {
			System.out.println("this is memberlist_result and id: " + memberlist_result.get(i).admin_id + " and pw: "
					+ memberlist_result.get(i).admin_pw);
		}
		// selctList 끝

		// delte 시작
		// memberdao.deleteDatabaseDaoMethod(new Integer(6));

		// insertbyMaps 시작
		/*
		 * Map<String, Object> parms = new HashMap<String, Object>();
		 * parms.put("id_bymap", "map_idbyMap_2"); parms.put("cmd_bymap", new
		 * Integer(12)); parms.put("pw_bymap", "map_pwbyMap_2");
		 * memberdao.insertDatabseByMapDaoMehthod(parms);
		 */
		// insertbyMaps 끝

		// insertbyObj 시작
/*		MemberDto insertNewObjbyObj = new MemberDto("adminIDinsertTestbyObj2", new Integer(13),
				"adminPWinsertTestbyObj2");
		memberdao.insertDatabaseyByObjDaoMethod(insertNewObjbyObj);*/
		// insertbyObj 끝

		return "home";
	}
	
	@RequestMapping("/fileupload")
	public String fileupload(Locale locale, Model model) {

		return "fileupload";
	}

	@RequestMapping("/fileupload_process")
	public String fileupload_process(HttpServletRequest httpServletRequest, Locale locale, Model model) {

		// checkupinfo TABLE INSERT 시작
		System.out.println("this is fileupload_process");
		return "redirect:/fileupload";
	}

	

}
