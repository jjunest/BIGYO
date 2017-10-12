package com.innoest.bigyo;

import java.io.Console;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
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

import com.innovest.dao.MemberDao;
import com.innovest.daos.MedicalDao;
import com.innovest.dto.HospitalDto_Test;
import com.innovest.dto.HospitalDto_Test_Detail;
import com.innovest.dto.MemberDto;
import com.innovest.dtos.CheckUp_DTO;
import com.innovest.dtos.Chk_Hos_Serv_DTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	MemberDao memberdao;
	
	@Autowired
	MedicalDao medicaldao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	

		return "redirect:index";
	}

	@RequestMapping("/index")
	public String index(Model model) {

		System.out.println("this is index");

		return "index";
	}

	@RequestMapping("/blog")
	public String blog(Model model) {

		System.out.println("this is blog");

		return "blog";
	}

	@RequestMapping("/listing_details_left")
	public String listing_details_left(Model model) {

		System.out.println("this is listing_details_left");

		return "listing_details_left";
	}

	@RequestMapping("/listing_sidebar_map")
	public String listing_sidebar_map(Model model) {

		System.out.println("this is listing_sidebar_map");

		return "listing_sidebar_map";
	}

	@RequestMapping("/jspfile")
	public String jspfile(Model model) {

		System.out.println("this is jspfile");

		return "jspfile";
	}

	@RequestMapping("/NewFile")
	public String NewFile(Model model) {

		System.out.println("this is NewFile");

		return "NewFile";
	}

	@RequestMapping("/serviceIntro")
	public String serviceIntro(Model model) {

		System.out.println("this is serviceIntro");

		return "serviceIntro";
	}

	@RequestMapping("/companyIntro")
	public String companyIntro(Model model) {

		System.out.println("this is companyIntro");

		return "companyIntro";
	}

	@RequestMapping("/eventHospitals")
	public String eventHospitals(HttpServletRequest httpServletRequest, Model model) {
		System.out.println("this is eventHospitals");
		String pNo;
		if (httpServletRequest.getParameter("pNo") != null) {
			pNo = httpServletRequest.getParameter("pNo");
		} else {
			pNo = "1";
		}
		// pageNo에 따라서 10개씩 가져오기. offset = (pNo-1) * 10
		int offset = (Integer.parseInt(pNo) - 1) * 10;
		List<CheckUp_DTO> result_list = medicaldao.selectAll_chkDTO(offset);
		model.addAttribute("result_list", result_list);
		// pageNo 전달해주기 - 밑에 pageNavigator를 위해서
		model.addAttribute("pNo", pNo);
		return "eventHospitals";
	}
	

	
	
	@RequestMapping("/eventHospitals_map")
	public String eventHospitals_map(HttpServletRequest httpServletRequest, Model model) {
		System.out.println("this is eventHospitals_map");
		String pNo;
		if (httpServletRequest.getParameter("pNo") != null) {
			pNo = httpServletRequest.getParameter("pNo");
		} else {
			pNo = "1";
		}
		// pageNo에 따라서 10개씩 가져오기. offset = (pNo-1) * 10
		int offset = (Integer.parseInt(pNo) - 1) * 10;
		List<HospitalDto_Test> result_list = memberdao.selectAllhosDTO(offset);
		model.addAttribute("result_list", result_list);
		// pageNo 전달해주기 - 밑에 pageNavigator를 위해서
		model.addAttribute("pNo", pNo);
		return "eventHospitals_map";
	}

	@RequestMapping("/allHospitals")
	public String allHospitals(Model model) {
		System.out.println("this is allHospitals");
		return "allHospitals";
	}

	@RequestMapping("/questions")
	public String questions(Model model) {
		System.out.println("this is questions");

		return "/questions";
	}

	@RequestMapping("/hospitalDetails")
	public String hospitalDetails(HttpServletRequest httpServletRequest, Model model) {
		String chk_rcdno = httpServletRequest.getParameter("chk_rcdno");
		System.out.println("this is hospitalDetails and chk_rcdno :"+chk_rcdno);
		
		Chk_Hos_Serv_DTO chk_hos_serv_dto = medicaldao.selectOne_chk_hos_serv(Integer.parseInt(chk_rcdno));
		
		model.addAttribute("chk_hos_serv_dto", chk_hos_serv_dto);
		return "hospitalDetails";
	}
	


	@RequestMapping("dbtest")
	public String dbtest() {
		System.out.println("this is dbtest() start");

		// selctList 시작
		List<MemberDto> memberlist_result = memberdao.select_allList();
		for (int i = 0; i < memberlist_result.size(); i++) {
			System.out.println("this is memberlist_result and id: " + memberlist_result.get(i).admin_id + " and pw: "
					+ memberlist_result.get(i).admin_pw);
		}

		return "dbtest";
	}
	
	
	@RequestMapping("/maptest")
	public String maptest(Model model) {
		System.out.println("this is maptest");
		return "maptest";
	}

	@RequestMapping("/login.html")
	public String login(Locale locale, Model model) {
		
		return "security/login";
	}
	
	@RequestMapping("/welcome.html")
	public String welcome(Locale locale, Model model) {
		
		return "security/welcome";
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
	@RequestMapping("/signup")
	public String signup(Locale locale, Model model) {
		
		return "signup";
	}
	
}
