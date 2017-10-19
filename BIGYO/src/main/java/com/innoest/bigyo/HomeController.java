package com.innoest.bigyo;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.innovest.dao.MemberDao;
import com.innovest.daos.MedicalDao;
import com.innovest.dto.HospitalDto_Test;
import com.innovest.dto.MemberDto;
import com.innovest.dtos.CheckUp_DTO;
import com.innovest.dtos.Chk_Hos_Serv_DTO;
import com.innovest.dtos.Hos_DTO;
import com.innovest.dtos.Serv_DTO;

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

		String pNo = httpServletRequest.getParameter("pNo");
		System.out.println("this is eventHospitals_map and pNo:" + pNo);
		if (httpServletRequest.getParameter("pNo") == null) {
			pNo = "1";
		} else if (Integer.parseInt(httpServletRequest.getParameter("pNo")) < 1) {

			pNo = "1";
		} else {
			pNo = httpServletRequest.getParameter("pNo");
		}
		// pageNo에 따라서 10개씩 가져오기. offset = (pNo-1) * 10
		int offset = (Integer.parseInt(pNo) - 1) * 10;
		List<Chk_Hos_Serv_DTO> result_list = medicaldao.selectAll_chk_hos_serv(offset);
		model.addAttribute("result_list", result_list);
		// pageNo 전달해주기 - 밑에 pageNavigator를 위해서
		model.addAttribute("pNo", pNo);
		return "eventHospitals";
	}

	@RequestMapping("/eventHospitals_map")
	public String eventHospitals_map(HttpServletRequest httpServletRequest, Model model) {

		String pNo = httpServletRequest.getParameter("pNo");
		System.out.println("this is eventHospitals_map and pNo:" + pNo);
		if (httpServletRequest.getParameter("pNo") == null) {
			pNo = "1";
		} else if (Integer.parseInt(httpServletRequest.getParameter("pNo")) < 1) {

			pNo = "1";
		} else {
			pNo = httpServletRequest.getParameter("pNo");
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

	@RequestMapping("/insert_eventhos")
	public String insert_eventhos(Locale locale, Model model) {

		return "insert_eventhos";
	}

	@RequestMapping("/insert_eventhos_process")
	public String insert_eventhos_process(HttpServletRequest httpServletRequest, Locale locale, Model model,
			HttpSession session) {

		// checkupinfo TABLE INSERT 시작
		System.out.println("this is insert_eventhos_process");
		String chk_hos_name = httpServletRequest.getParameter("chk_hos_name");
		String chk_hos_pnum = httpServletRequest.getParameter("chk_hos_pnum");
		String chk_price = httpServletRequest.getParameter("chk_price");
		String chk_loc_sido = httpServletRequest.getParameter("chk_loc_sido");
		String chk_loc_full = httpServletRequest.getParameter("chk_loc_full");
		String chk_loc_lat = httpServletRequest.getParameter("chk_loc_lat");
		String chk_loc_lng = httpServletRequest.getParameter("chk_loc_lng");
		String chk_target_age = httpServletRequest.getParameter("chk_target_age");
		String chk_info_link = httpServletRequest.getParameter("chk_info_link");
		String chk_mid_company = httpServletRequest.getParameter("chk_mid_company");
		String chk_mid_company_pnum = httpServletRequest.getParameter("chk_mid_company_pnum");
		String chk_mid_company_link = httpServletRequest.getParameter("chk_mid_company_link");
		String chk_end_date = httpServletRequest.getParameter("chk_end_date");
		CheckUp_DTO insert_chkDTO = new CheckUp_DTO(chk_hos_name, chk_hos_pnum, chk_price, chk_loc_sido, chk_loc_full,
				chk_loc_lat, chk_loc_lng, chk_target_age, chk_info_link, chk_mid_company, chk_mid_company_pnum,
				chk_mid_company_link, chk_end_date);
		int insert_result_chk_hos_serv_table = medicaldao.insert_chk_hos_serv_DTO_ByObj(insert_chkDTO);
		// checkupinfo TABLE INSERT 끝

		// checkupinfo TABLE 에서 select해서 rcdno 찾아오기.
		int chk_rcdno = medicaldao.select_rcdno_chkTable();
		System.out.println("this is chk_rcdno : " + chk_rcdno);

		// hos_info TABLE INSERT 시작
		// 병원 사진 서버에 전송 시작
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) httpServletRequest;
		System.out.println("this is multipartHttpServletRequest: " + multipartHttpServletRequest);
		List<MultipartFile> imageMultiFile_List = multipartHttpServletRequest.getFiles("imageFile");
		String filePath = "C:/"; // 설정파일로 뺀다.
		for (int i = 0; i < imageMultiFile_List.size(); i++) {
			// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
			String randId = UUID.randomUUID().toString();
			MultipartFile multipartFile = imageMultiFile_List.get(i);
			String originalFilename = multipartFile.getOriginalFilename(); // 파일명
			Integer originalFileBytes = new Integer((int) multipartFile.getSize());

			String storedFileName = randId + "." + getExtension(originalFilename);
			String uploadResourcesPath = session.getServletContext().getRealPath("/resources/img/hostable_pic/");
			String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
			String imageUrl = "resources/img/hostable_pic/" + storedFileName;
			try {
				// HOS_DTO 객체 만들기
				Hos_DTO hos_dto = new Hos_DTO(chk_rcdno, imageUrl, originalFilename, storedFileName, originalFileBytes,
						"ho_picStoredId", "N");

				// 파일 서버에 저장
				multipartFile.transferTo(new File(uploadFullPath)); // 파일저장 실제로는 service에서 처리
				System.out.println("originalFilename => " + originalFilename);
				System.out.println("fileFullPath => " + uploadFullPath);

				// HOS_DTO 객체를 DataBase에 INSERT 해준다.
				int insert_result_hos_table = medicaldao.insert_hos_DTO_ByObj(hos_dto);
			} catch (Exception e) {
				System.out.println("postTempFile_ERROR===s===>" + uploadFullPath);
				e.printStackTrace();
			}
		}
		// hos_info TABLE INSERT 끝

		// serv_info TABLE INSERT 시작
		// 건강검진 서비스 사진 서버에 전송 시작
		List<MultipartFile> serviceMultiFile_List = multipartHttpServletRequest.getFiles("serviceFile");
		for (int i = 0; i < serviceMultiFile_List.size(); i++) {
			// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
			String randId = UUID.randomUUID().toString();
			MultipartFile multipartFile = serviceMultiFile_List.get(i);
			String originalFilename = multipartFile.getOriginalFilename(); // 파일명
			System.out.println("this is originalfile name:" + originalFilename);
			Integer originalFileBytes = new Integer((int) multipartFile.getSize());
			String storedFileName = randId + "." + getExtension(originalFilename);
			String uploadResourcesPath = session.getServletContext().getRealPath("/resources/img/servtable_pic/");
			String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
			String imageUrl = "resources/img/servtable_pic/" + storedFileName;
			try {

				// Serv_DTO 객체 만들기
				Serv_DTO serv_dto = new Serv_DTO(chk_rcdno, imageUrl, originalFilename, storedFileName,
						originalFileBytes, new Integer(999999), "20", "storedid", "N", "20171011");

				// 파일 서버에 저장
				multipartFile.transferTo(new File(uploadFullPath)); // 파일저장 실제로는 service에서 처리

				// Serv_DTO 객체를 service_info DataBase에 INSERT 해준다.
				int insert_result_serv_table = medicaldao.insert_serv_DTO_ByObj(serv_dto);

			

			

			} catch (Exception e) {
				System.out.println("postTempFile_ERROR===s===>" + uploadFullPath);
				e.printStackTrace();
			}
		}

		// serv_info TABLE INSERT 끝
		
		// service_price TABLE 에 ServPrice_DTO 를 INSERT 시작
		// select Box에서 몇개의 건강검진 상품이 존재하는지 검색한 후에 시작하자. 
		String service_priceTotalNum = httpServletRequest.getParameter("service_priceTotalNum");
		for(int i =1; i<Integer.parseInt(service_priceTotalNum)+1;i++) {
			String[] serv_age_list = httpServletRequest.getParameterValues("serv_age"+String.valueOf(i));
			if (serv_age_list != null) {
				for (int j = 0; j < serv_age_list.length; j++) {
					System.out.println("this is age list value"+serv_age_list[j]);
				}
			}	
		}
		// service_price TABLE 에 ServPrice_DTO 를 INSERT 끝
		// service_age TABLE 에 ServAge_DTO 를 INSERT 시작
		for(int i =1; i<Integer.parseInt(service_priceTotalNum)+1;i++) {
			String[] serv_age_list = httpServletRequest.getParameterValues("serv_age"+String.valueOf(i));
			if (serv_age_list != null) {
				for (int j = 0; j < serv_age_list.length; j++) {
					System.out.println("this is age list value"+serv_age_list[j]);
				}
			}	
		}
		
		// service_age TABLE 에 ServAge_DTO 를 INSERT 끝
		
		
		
		/* return "redirect:hospitalDetails?chk_rcdno=" + chk_rcdno; */
		return "redirect:index";
	}

	/**
	 * 파일이름으로부터 확장자를 반환하는 메서드 파일이름에 확장자 구분을 위한 . 문자가 없거나. 가장 끝에 있는 경우는 빈문자열 ""을 리턴
	 */
	private String getExtension(String fileName) {
		int dotPosition = fileName.lastIndexOf('.');
		if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
			return fileName.substring(dotPosition + 1);
		} else {
			return "";
		}
	}
}
