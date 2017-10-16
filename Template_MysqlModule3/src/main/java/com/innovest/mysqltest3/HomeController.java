package com.innovest.mysqltest3;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
		
		
		
		// insertbyMaps 시작
/*		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("map_id", "map_idbyMap");
		parms.put("map_cmd", new Integer(9));
		parms.put("map_pw", "map_pwbyMap");
		memberdao.insertTest(parms);*/
		// insertbyMaps 끝
		
		// insertbyObj 시작
/*		MemberDto insertNewObjbyObj = new MemberDto("adminIDinsertTestbyObj",new Integer(11),"adminPWinsertTestbyObj");
		memberdao.insertTestbyObj(insertNewObjbyObj);*/
		// insertbyObj 끝
		
		// update 시작
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("admin_id", "updatedID");
		parms.put("cmd_num", new Integer(11));
		parms.put("admin_pw", "updatedPW");
		memberdao.updateTest(parms);
		// update 끝
		
		
		// delete 시작
		memberdao.deleteTest(new Integer(3));
		// delete 끝

		return "home";
	}

}
