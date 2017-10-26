package com.innoest.bigyo;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import com.innovest.dtos.ServAge_DTO;
import com.innovest.dtos.ServPrice_DTO;
import com.innovest.dtos.Serv_DTO;
import com.innovest.utils.GeoPoint;
import com.innovest.utils.GeoTrans;

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
		if (httpServletRequest.getParameter("pNo") == null) {
			pNo = "1";
		} else if (Integer.parseInt(httpServletRequest.getParameter("pNo")) < 1) {

			pNo = "1";
		} else {
			pNo = httpServletRequest.getParameter("pNo");
		}
		// pageNo에 따라서 10개씩 가져오기. offset = (pNo-1) * 10
		int offset = (Integer.parseInt(pNo) - 1) * 10;

		// Sido 선택
		String siDoSelect = (String) httpServletRequest.getParameter("siDoSelect");
		System.out.println("this is sidoSelect:" + siDoSelect);
		if (siDoSelect == null || siDoSelect.equals("") || siDoSelect.equals("전체")) {
			List<Chk_Hos_Serv_DTO> result_list = medicaldao.selectAll_chk_hos_serv(offset);
			model.addAttribute("result_list", result_list);
			// pageNo 전달해주기 - 밑에 pageNavigator를 위해서
			model.addAttribute("pNo", pNo);
		} else {
			// HashMap 에 담에서 sql에 전달하자
			HashMap<String, Object> sqlParameterHashMap = new HashMap<String, Object>();
			sqlParameterHashMap.put("offset", offset);
			sqlParameterHashMap.put("chk_loc_sido", siDoSelect);
			List<Chk_Hos_Serv_DTO> result_list = medicaldao.selectAll_chk_hos_serv_filter(sqlParameterHashMap);
			model.addAttribute("result_list", result_list);
			// pageNo 전달해주기 - 밑에 pageNavigator를 위해서
			model.addAttribute("pNo", pNo);
		}
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
		/* String chk_price = httpServletRequest.getParameter("chk_price"); */
		String chk_loc_sido = httpServletRequest.getParameter("chk_loc_sido");
		String chk_loc_full = httpServletRequest.getParameter("chk_loc_full");
		String chk_loc_lat = httpServletRequest.getParameter("chk_loc_lat");
		String chk_loc_lng = httpServletRequest.getParameter("chk_loc_lng");

		/*
		 * GEO TRANSFER 부분 GeoPoint grs80 = new
		 * GeoPoint(Double.parseDouble(chk_loc_lng),Double.parseDouble(chk_loc_lat));
		 * System.out.println("grs80 : x=" + grs80.getX() + ", y=" + grs80.getY());
		 * GeoPoint GEO = GeoTrans.convert(GeoTrans.GRS80, GeoTrans.GEO, grs80);
		 * System.out.println("GEO : x=" + GEO.getX() + ", y=" + GEO.getY());
		 * chk_loc_lng = String.valueOf(GEO.getY()); chk_loc_lat =
		 * String.valueOf(GEO.getX());
		 */

		String chk_info_link = httpServletRequest.getParameter("chk_info_link");
		String chk_mid_company = httpServletRequest.getParameter("chk_mid_company");
		String chk_mid_company_pnum = httpServletRequest.getParameter("chk_mid_company_pnum");
		String chk_mid_company_link = httpServletRequest.getParameter("chk_mid_company_link");
		String chk_end_date_string = httpServletRequest.getParameter("chk_end_date");
		System.out.println("this is enddatestring :" + chk_end_date_string);
		// 게시물 마감 시간을 위한 endDate 설정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		// default 로 2018-12-10으로 마감 기간 지정.
		if (chk_end_date_string == null || chk_end_date_string.equals("")) {
			System.out.println("chk_end_date_string is null");
			chk_end_date_string = "2018-12-30";
		}
		Date chk_end_date = java.sql.Date.valueOf(chk_end_date_string);

		// 게시글이 만들어진 현재 시각 저장 current Time stamp
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String currentTimeStamp = null;
		currentTimeStamp = formatter.format(cal.getTime());
		Timestamp created_date = Timestamp.valueOf(currentTimeStamp);

		CheckUp_DTO insert_chkDTO = new CheckUp_DTO(chk_hos_name, chk_hos_pnum, "chk_price: field: not used",
				chk_loc_sido, chk_loc_full, chk_loc_lat, chk_loc_lng, "chk_target_age field: not used", chk_info_link,
				chk_mid_company, chk_mid_company_pnum, chk_mid_company_link, chk_end_date, created_date, "N");
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
		for (int i = 0; i < imageMultiFile_List.size(); i++) {
			// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
			String randId = UUID.randomUUID().toString();
			MultipartFile multipartFile = imageMultiFile_List.get(i);
			String originalFilename = multipartFile.getOriginalFilename(); // 파일명

			// 만약 파일명이 없으면, Hos_infoTABLE에 넣지 않아도 된다.
			if (originalFilename.equals("")) {

			} else {
				System.out.println("this is originalFileName is empty");
				Integer originalFileBytes = new Integer((int) multipartFile.getSize());

				String storedFileName = randId + "." + getExtension(originalFilename);
				String uploadResourcesPath = session.getServletContext().getRealPath("/resources/img/hostable_pic/");
				String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
				String imageUrl = "resources/img/hostable_pic/" + storedFileName;
				try {

					// HOS_DTO 객체 만들기
					Hos_DTO hos_dto = new Hos_DTO(chk_rcdno, imageUrl, originalFilename, storedFileName,
							originalFileBytes, "ho_picStoredId", "N", created_date);

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
			// 만약 파일이 없으면, DB에 넣지 않아도 된다.
			if (originalFilename.equals("")) {

			} else {
				System.out.println("this is originalfile name:" + originalFilename);
				Integer originalFileBytes = new Integer((int) multipartFile.getSize());
				String storedFileName = randId + "." + getExtension(originalFilename);
				String uploadResourcesPath = session.getServletContext().getRealPath("/resources/img/servtable_pic/");
				String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
				String imageUrl = "resources/img/servtable_pic/" + storedFileName;
				try {

					// Serv_DTO 객체 만들기
					Serv_DTO serv_dto = new Serv_DTO(chk_rcdno, imageUrl, originalFilename, storedFileName,
							originalFileBytes, new Integer(999999), "serv_target_age column : not used anymore",
							"storedid", "N", created_date);

					// 파일 서버에 저장
					multipartFile.transferTo(new File(uploadFullPath)); // 파일저장 실제로는 service에서 처리

					// Serv_DTO 객체를 service_info DataBase에 INSERT 해준다.
					int insert_result_serv_table = medicaldao.insert_serv_DTO_ByObj(serv_dto);

				} catch (Exception e) {
					System.out.println("postTempFile_ERROR===s===>" + uploadFullPath);
					e.printStackTrace();
				}
			}
		}

		// serv_info TABLE INSERT 끝
		// service_price TABLE and service_age TABLE 에 ServPrice_DTO 를 INSERT 시작
		// select Box에서 몇개의 건강검진 상품이 존재하는지 검색한 후에 시작하자.
		String service_priceTotalNum = httpServletRequest.getParameter("service_priceTotalNum");
		for (int j = 1; j < Integer.parseInt(service_priceTotalNum) + 1; j++) {
			String serv_price = httpServletRequest.getParameter("serv_price" + String.valueOf(j));
			if (serv_price == null || serv_price.equals("")) {
				// serv_price가 아무것도 없으면 9999999으로 UPDATE.
				serv_price = "9999999";
			}

			serv_price = serv_price.replace(",", "");
			ServPrice_DTO servPrice_DTO = new ServPrice_DTO(chk_rcdno, Integer.parseInt(serv_price));
			// ServPrice_DTO 객체를 service_price TABLE에 UPDATE 해준다.
			int insert_result_servprice_table = medicaldao.insert_servPrice_DTO_ByObj(servPrice_DTO);

			// service_age TABLE 에 ServAge_DTO 를 UPDATE 시작
			int servprice_rcdno = medicaldao.select_rcdno_servPriceTable();

			String[] serv_age_list = httpServletRequest.getParameterValues("serv_age" + String.valueOf(j));
			System.out.println("this is serv_age_list in modify:" + serv_age_list);
			if (serv_age_list != null) {
				for (int k = 0; k < serv_age_list.length; k++) {
					System.out.println("this is age list value" + serv_age_list[k]);
					ServAge_DTO servage_dto = new ServAge_DTO(servprice_rcdno, serv_age_list[k]);
					int insert_result_servage_table = medicaldao.insert_servAge_DTO_ByObj(servage_dto);
				}
			}
			// service_age TABLE 에 ServAge_DTO 를 INSERT 끝
		}
		return "redirect:hospitalDetails?chk_rcdno=" + chk_rcdno;
	}

	@RequestMapping("/jusoPopup")
	public String jusoPopup(Locale locale, Model model) {

		return "jusoPopup";
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

	@RequestMapping("/security/admin")
	public String security_admin(Locale locale, Model model) {

		return "security/admin";
	}

	@RequestMapping("/modifyHospitalDetail")
	public String modifyHospitalDetail(HttpServletRequest httpServletRequest, Locale locale, Model model) {
		String chk_rcdno = httpServletRequest.getParameter("chk_rcdno");
		Chk_Hos_Serv_DTO chk_hos_serv_dto = medicaldao.selectOne_chk_hos_serv(Integer.parseInt(chk_rcdno));

		model.addAttribute("chk_hos_serv_dto", chk_hos_serv_dto);
		return "modifyHospitalDetail";
	}

	@RequestMapping("/deleteHospitalDetail")
	public String deleteHospitalDetail(Locale locale, Model model) {

		return "eventHospitals";
	}

	@RequestMapping("/modify_eventhos_process")
	public String modify_eventhos_process(HttpServletRequest httpServletRequest, Locale locale, Model model,
			HttpSession session) {
		// checkupinfo TABLE UPDATE 시작
		System.out.println("this is modify_eventhos_process");
		String chk_rcdno = httpServletRequest.getParameter("chk_rcdno");
		String chk_hos_name = httpServletRequest.getParameter("chk_hos_name");
		String chk_hos_pnum = httpServletRequest.getParameter("chk_hos_pnum");
		/* String chk_price = httpServletRequest.getParameter("chk_price"); */
		String chk_loc_sido = httpServletRequest.getParameter("chk_loc_sido");
		String chk_loc_full = httpServletRequest.getParameter("chk_loc_full");
		String chk_loc_lat = httpServletRequest.getParameter("chk_loc_lat");
		String chk_loc_lng = httpServletRequest.getParameter("chk_loc_lng");

		/*
		 * GEO TRANSFER 부분 GeoPoint grs80 = new
		 * GeoPoint(Double.parseDouble(chk_loc_lng),Double.parseDouble(chk_loc_lat));
		 * System.out.println("grs80 : x=" + grs80.getX() + ", y=" + grs80.getY());
		 * GeoPoint GEO = GeoTrans.convert(GeoTrans.GRS80, GeoTrans.GEO, grs80);
		 * System.out.println("GEO : x=" + GEO.getX() + ", y=" + GEO.getY());
		 * chk_loc_lng = String.valueOf(GEO.getY()); chk_loc_lat =
		 * String.valueOf(GEO.getX());
		 */

		String chk_info_link = httpServletRequest.getParameter("chk_info_link");
		String chk_mid_company = httpServletRequest.getParameter("chk_mid_company");
		String chk_mid_company_pnum = httpServletRequest.getParameter("chk_mid_company_pnum");
		String chk_mid_company_link = httpServletRequest.getParameter("chk_mid_company_link");
		String chk_end_date_string = httpServletRequest.getParameter("chk_end_date");
		String deletedHosPic_hos_rcdno = httpServletRequest.getParameter("deletedHosPic_hos_rcdno");
		String deletedServPic_serv_rcdno = httpServletRequest.getParameter("deletedServPic_serv_rcdno");
		System.out.println("this is updateRcdno :" + chk_rcdno);
		System.out.println("this is enddatestring :" + chk_end_date_string);

		// 게시물 마감 시간을 위한 endDate 설정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		// default 로 2018-12-10으로 마감 기간 지정.
		if (chk_end_date_string == null || chk_end_date_string.equals("")) {
			System.out.println("chk_end_date_string is null");
			chk_end_date_string = "2018-12-30";
		}
		Date chk_end_date = java.sql.Date.valueOf(chk_end_date_string);

		// 게시글이 만들어진 현재 시각 저장 current Time stamp
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String currentTimeStamp = null;
		currentTimeStamp = formatter.format(cal.getTime());
		Timestamp created_date = Timestamp.valueOf(currentTimeStamp);

		CheckUp_DTO update_chkDTO = new CheckUp_DTO(Integer.parseInt(chk_rcdno), chk_hos_name, chk_hos_pnum,
				"chk_price: field: not used", chk_loc_sido, chk_loc_full, chk_loc_lat, chk_loc_lng,
				"chk_target_age field: not used", chk_info_link, chk_mid_company, chk_mid_company_pnum,
				chk_mid_company_link, chk_end_date, created_date, "N");
		int result_chk_table = medicaldao.update_chk_DTO_ByObj(update_chkDTO);
		// checkupinfo TABLE UPDATE 끝

		// hos TABLE UPDATE 시작
		// 삭제할 병원사진& 건강검진상품사진의 rcd를 받아서, 배열로 묶은 후에, 해당 rcdno값을 지닌 테이블에 'Y'값으로 설정
		System.out.println("this is deletedHosPic_hos_rcdno :" + deletedHosPic_hos_rcdno);
		if (deletedHosPic_hos_rcdno.equals("")) {

		} else {
			String[] delete_hos_rcdno_array = deletedHosPic_hos_rcdno.split(",");
			for (int i = 0; i < delete_hos_rcdno_array.length; i++) {
				int result_hos_table = medicaldao.deleteByUpdate_hos_DTO(Integer.parseInt(delete_hos_rcdno_array[i]));
			}
		}
		if (deletedServPic_serv_rcdno.equals("")) {

		} else {
			String[] delete_serv_rcdno_array = deletedServPic_serv_rcdno.split(",");
			for (int i = 0; i < delete_serv_rcdno_array.length; i++) {
				int result_hos_table = medicaldao.deleteByUpdate_serv_DTO(Integer.parseInt(delete_serv_rcdno_array[i]));

			}
		}
		// 새로 추가된 사진은 chk_rcdno를 사용해서 hos TABLE의 hos_chk_rcdno필드에 INSERT 해준다.
		// 새로 추가된 병원 사진 서버에 전송 시작
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) httpServletRequest;
		System.out.println("this is multipartHttpServletRequest: " + multipartHttpServletRequest);
		List<MultipartFile> imageMultiFile_List = multipartHttpServletRequest.getFiles("imageFile");
		for (int i = 0; i < imageMultiFile_List.size(); i++) {
			// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
			String randId = UUID.randomUUID().toString();
			MultipartFile multipartFile = imageMultiFile_List.get(i);
			String originalFilename = multipartFile.getOriginalFilename(); // 파일명

			// 만약 파일명이 없으면, Hos_infoTABLE에 넣지 않아도 된다.
			if (originalFilename.equals("")) {

			} else {
				System.out.println("this is originalFileName is empty");
				Integer originalFileBytes = new Integer((int) multipartFile.getSize());

				String storedFileName = randId + "." + getExtension(originalFilename);
				String uploadResourcesPath = session.getServletContext().getRealPath("/resources/img/hostable_pic/");
				String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
				String imageUrl = "resources/img/hostable_pic/" + storedFileName;
				try {

					// HOS_DTO 객체 만들기
					Hos_DTO hos_dto = new Hos_DTO(Integer.parseInt(chk_rcdno), imageUrl, originalFilename,
							storedFileName, originalFileBytes, "ho_picStoredId", "N", created_date);

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
		}
		// hos TABLE UPDATE 끝
		// 건강검진 서비스 사진 서버에 전송 시작
		List<MultipartFile> serviceMultiFile_List = multipartHttpServletRequest.getFiles("serviceFile");
		for (int i = 0; i < serviceMultiFile_List.size(); i++) {
			// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
			String randId = UUID.randomUUID().toString();
			MultipartFile multipartFile = serviceMultiFile_List.get(i);
			String originalFilename = multipartFile.getOriginalFilename(); // 파일명
			// 건강검진 상품 사진은 반드시 존재해야한다. 캡쳐 사진이라도 넣어라
			System.out.println("this is originalfile name:" + originalFilename);
			Integer originalFileBytes = new Integer((int) multipartFile.getSize());
			// 만약 파일명이 없으면, serv_infoTABLE에 넣지 않아도 된다.
			if (originalFilename.equals("")) {
			} else {

				String storedFileName = randId + "." + getExtension(originalFilename);
				String uploadResourcesPath = session.getServletContext().getRealPath("/resources/img/servtable_pic/");
				String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
				String imageUrl = "resources/img/servtable_pic/" + storedFileName;
				try {

					// Serv_DTO 객체 만들기
					Serv_DTO serv_dto = new Serv_DTO(Integer.parseInt(chk_rcdno), imageUrl, originalFilename,
							storedFileName, originalFileBytes, new Integer(999999),
							"serv_target_age column : not used anymore", "storedid", "N", created_date);

					// 파일 서버에 저장
					multipartFile.transferTo(new File(uploadFullPath)); // 파일저장 실제로는 service에서 처리

					// Serv_DTO 객체를 service_info DataBase에 INSERT 해준다.
					int insert_result_serv_table = medicaldao.insert_serv_DTO_ByObj(serv_dto);

				} catch (Exception e) {
					System.out.println("postTempFile_ERROR===s===>" + uploadFullPath);
					e.printStackTrace();
				}
			}
		}

		// price와 age는 데이터베이스에서 삭제 후에, 다시 입력해주자. DB가 CASCADE 삭제방식이라, price를 지우면 자연스럽게
		// AGE도 삭제 된다.
		int delete_servPrice_result = medicaldao.delete_servPrice_chkrcdno(Integer.parseInt(chk_rcdno));

		String service_priceTotalNum = httpServletRequest.getParameter("service_priceTotalNum");
		for (int j = 1; j < Integer.parseInt(service_priceTotalNum) + 1; j++) {
			String serv_price = httpServletRequest.getParameter("serv_price" + String.valueOf(j));
			if (serv_price == null || serv_price.equals("")) {
				// serv_price가 아무것도 없으면 9999999으로 UPDATE.
				serv_price = "9999999";
			}

			serv_price = serv_price.replace(",", "");
			ServPrice_DTO servPrice_DTO = new ServPrice_DTO(Integer.parseInt(chk_rcdno), Integer.parseInt(serv_price));
			// ServPrice_DTO 객체를 service_price TABLE에 UPDATE 해준다.
			int insert_result_servprice_table = medicaldao.insert_servPrice_DTO_ByObj(servPrice_DTO);

			// service_age TABLE 에 ServAge_DTO 를 UPDATE 시작
			int servprice_rcdno = medicaldao.select_rcdno_servPriceTable();

			String[] serv_age_list = httpServletRequest.getParameterValues("serv_age" + String.valueOf(j));
			System.out.println("this is serv_age_list in modify:" + serv_age_list);
			if (serv_age_list != null) {
				for (int k = 0; k < serv_age_list.length; k++) {
					System.out.println("this is age list value" + serv_age_list[k]);
					ServAge_DTO servage_dto = new ServAge_DTO(servprice_rcdno, serv_age_list[k]);
					int insert_result_servage_table = medicaldao.insert_servAge_DTO_ByObj(servage_dto);
				}
			}
			// service_age TABLE 에 ServAge_DTO 를 UPDATE 끝
		}

		return "redirect:hospitalDetails?chk_rcdno=" + chk_rcdno;
	}

	@RequestMapping("/deleteHospitalDetailFromDatabaseBT")
	public String deleteHospitalDetailFromDatabaseBT(Locale locale, Model model,
			HttpServletRequest httpServletRequest) {
		String chk_rcdno = httpServletRequest.getParameter("chk_rcdno");
		int dbresult = medicaldao.delete_chkTable_chkrcdno(Integer.parseInt(chk_rcdno));

		return "redirect:eventHospitals";
	}

	@RequestMapping("/deleteByUpdate_chk_DTO")
	public String deleteByUpdate_chk_DTO(Locale locale, Model model, HttpServletRequest httpServletRequest) {
		String chk_rcdno = httpServletRequest.getParameter("chk_rcdno");
		int dbresult = medicaldao.deleteByUpdate_chk_DTO(Integer.parseInt(chk_rcdno));

		return "redirect:eventHospitals";
	}
}
