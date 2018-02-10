package com.innovest.showpinion;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.innovest.dao.SPDao;
import com.innovest.dto.opinion_DTO;
import com.innovest.dto.tvTopic_DTO;
import com.innovest.dto.userDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	SPDao spdao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		System.out.println("this is home");

		return "redirect:main";
	}

	@RequestMapping("/index")
	public String index(Model model) {
		System.out.println("this is index");

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
		List<tvTopic_DTO> result_list = spdao.selectAll_TVshow_TopicDTO();
		model.addAttribute("result_list_tvtopics", result_list);

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
	public String detail_TVshow_Topics(HttpServletRequest httpServletRequest, Model model) {
		System.out.println("this is detail_TVshow_Topics");
		String topic_rcdno = httpServletRequest.getParameter("topic_rcdno");
		HashMap<String, Object> sqlParameterHashMap = new HashMap<String, Object>();
		sqlParameterHashMap.put("topic_rcdno", topic_rcdno);
		// 조회수 +1 해주기.
		int result = spdao.update_DetailViewNumber(sqlParameterHashMap);
		// tvtopic_DTO 구하기
		tvTopic_DTO detail_tvTopic = spdao.selectOne_TvTopic(sqlParameterHashMap);
		model.addAttribute("detail_tvTopic", detail_tvTopic);

		
		//쇼피니언 의견 모두 LIST로 뽑기
		List<opinion_DTO> opinions_list_show = spdao.selectAll_opinion_show(sqlParameterHashMap);
		model.addAttribute("opinions_list_show", opinions_list_show);
		
		//일반 의견 모두 LIST로 뽑기
		List<opinion_DTO> opinions_list_normal = spdao.selectAll_opinion_normal(sqlParameterHashMap);
		model.addAttribute("opinions_list_normal", opinions_list_normal);
		
		
		
		return "detail_TVshow_Topics";
	}
	
	@RequestMapping("/detail_opinion")
	public String detail_opinion(Model model , @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is detail_opinion");
		// 글 쓴 날짜는 default로 현재시각으로 저장이 된다.
		opinion_DTO opinion_DTO = spdao.selectOpinionDetail(paramMap);
		model.addAttribute("opinion_DTO", opinion_DTO);
		return "detail_opinion";
	}
	
	

	@RequestMapping("/rankings")
	public String rankings(Model model) {
		System.out.println("this is rankings");

		return "rankings";
	}

	@RequestMapping("/userInfo")
	public String userInfo(Model model) {
		System.out.println("this is userInfo");

		return "userInfo";
	}

	@RequestMapping("/writeShowpinion")
	public String writeShowpinion(HttpServletRequest httpServletRequest, Model model) {
		System.out.println("this is writeShowpinion");
		String topic_rcdno = httpServletRequest.getParameter("topic_rcdno");
		HashMap<String, Object> sqlParameterHashMap = new HashMap<String, Object>();
		sqlParameterHashMap.put("topic_rcdno", topic_rcdno);
		tvTopic_DTO detail_tvTopic = spdao.selectOne_TvTopic(sqlParameterHashMap);
		model.addAttribute("detail_tvTopic", detail_tvTopic);
		return "writeShowpinion";
	}

	@RequestMapping("/search_result_user")
	public String search_result_user(Model model) {
		System.out.println("this is search_result_user");

		return "search_result_user";
	}

	@RequestMapping("/sign_up")
	public String sign_up(Model model) {
		System.out.println("this is sign_up");
		return "sign_up";
	}

	@RequestMapping("/writeTVTopics")
	public String writeTVTopics(Model model) {
		System.out.println("this is writeTVTopics");
		return "writeTVTopics";
	}

	@RequestMapping(value = "/duplicateIdCheck")
	@ResponseBody
	public String duplicateIdCheck(Locale locale, Model model,
			HttpServletRequest httpServletRequest) {
		String duplicateIdCheckResult = "fail";
		String userIdInputValue = httpServletRequest.getParameter("userIdInputValue");
		System.out.println("this is duplicateIdCheck " + userIdInputValue);

		int dup_result = spdao.duplicateIdCheck(userIdInputValue);

		if (dup_result == 0) {
			duplicateIdCheckResult = "success";

		} else {
			duplicateIdCheckResult = "fail";
		}
		return duplicateIdCheckResult;
	}

	@RequestMapping("/signup_process")
	@ResponseBody
	public String signup_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest) {
		System.out.println("this is signup_process");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String email_dup_check_id = httpServletRequest.getParameter("email_dup_check_id");
		System.out.println("this is email_dup_check_id : " + email_dup_check_id);
		String signup_realname = httpServletRequest.getParameter("signup_realname");
		System.out.println("this is signup_realname : " + signup_realname);
		String signup_nickname = httpServletRequest.getParameter("signup_nickname");
		System.out.println("this is signup_nickname : " + signup_nickname);
		String open_name = httpServletRequest.getParameter("open_name");
		System.out.println("this is open_name :  " + open_name);
		String signup_group = httpServletRequest.getParameter("signup_group");
		System.out.println("this is signup_group : " + signup_group);
		String signup_group_open = httpServletRequest.getParameter("signup_group_open");
		System.out.println("this is signup_group_open : " + signup_group_open);
		String signup_sns = httpServletRequest.getParameter("signup_sns");
		System.out.println("this is signup_sns : " + signup_sns);
		String signup_sns_open = httpServletRequest.getParameter("signup_sns_open");
		System.out.println("this is signup_sns_open : " + signup_sns_open);
		String signup_password = httpServletRequest.getParameter("signup_password");
		System.out.println("this is signup_realname : " + signup_password);
		// 비밀번호 인코딩해서 저장하기
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(signup_password.trim());
		userDTO newUserDTO = new userDTO(email_dup_check_id, hashedPassword, 1, signup_realname,
				signup_nickname, open_name, signup_group, signup_group_open, signup_sns,
				signup_sns_open);
		int insert_result = spdao.insert_user_ByObj(newUserDTO);
		if (insert_result == 0) {
			System.out.println("this is insertresult ==0");
			// 새로운 user database 삽입 실패시
			return "fail";
		} else if (insert_result == 1) {
			Map<String, String> insertMap = new HashMap<String, String>();
			insertMap.put("userid", email_dup_check_id);
			insertMap.put("role", "ROLE_USER");
			int role_insert_result = spdao.insert_userrole_byMap(insertMap);
			if (role_insert_result == 0) {
				return "fail";
			} else if (role_insert_result == 1) {
				System.out.println("this is insertresult ==1");
				return "success";
			}
		}
		return "fail";
	}

	@RequestMapping("/admin")
	public String admin(Model model) {
		System.out.println("this is admin");
		return "admin";
	}

	@RequestMapping("/admin_insert_TVTopic")
	public String admin_insert_TVTopic(Model model, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is admin_insert_TVTopic");
		return "admin_insert_TVTopic";
	}



	@RequestMapping(value = "/tvshowtopic_insert_process", method = RequestMethod.POST)
	@ResponseBody
	public String tvshowtopic_insert_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap,
			@RequestParam(required = false) MultipartFile tvtopic_tvshow_img, HttpSession session) {
		System.out.println("this is tvshowtopic_insert_process");
		String aJaxResult = "fail";
		Integer originalFileBytes = 0;
		String storedFileName = "";
		String imageUrl = "";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 스탭 1. TV 프로그램 이미지 파일 삽입.
		if (tvtopic_tvshow_img == null) {
			// 만약에 tv쇼 이미지 파일이 없다면 이미지 저장하기 작업을 안해도 된다.

		} else {
			// 1. TVSHOW 프로그램 포스터 이미지 저장하기 작업
			MultipartFile multipartFile = tvtopic_tvshow_img;
			// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
			String randId = UUID.randomUUID().toString();
			String originalFilename = multipartFile.getOriginalFilename(); // 파일명
			// 만약 파일이 없으면, DB에 넣지 않아도 된다.
			if (originalFilename.equals("")) {

			} else {
				System.out.println("this is originalfile name:" + originalFilename);
				originalFileBytes = new Integer((int) multipartFile.getSize());
				storedFileName = randId + "." + getExtension(originalFilename);
				String uploadResourcesPath = session.getServletContext()
						.getRealPath("/resources/img_tvshow_poster/");
				// 로컬에서 돌아가는 업로드 경로
				String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
				// 서버에서 돌아가는 업로드 경로
				// String uploadFullPath = uploadResourcesPath + storedFileName;

				imageUrl = "resources/img_tvshow_poster/" + storedFileName;
				System.out.println("this is imageUrl:" + imageUrl);
				try {
					/*
					 * // Serv_DTO 객체 만들기 Serv_DTO serv_dto = new Serv_DTO(chk_rcdno, imageUrl,
					 * originalFilename, storedFileName, originalFileBytes, new Integer(999999),
					 * "serv_target_age column : not used anymore", "storedid", "N", created_date);
					 */
					// 파일 서버에 저장
					multipartFile.transferTo(new File(uploadFullPath)); // 파일저장 실제로는 service에서 처리
					/*
					 * // Serv_DTO 객체를 service_info DataBase에 INSERT 해준다. int
					 * insert_result_serv_table = medicaldao.insert_serv_DTO_ByObj(serv_dto);
					 */
				} catch (Exception e) {
					System.out.println("postTempFile_ERROR===s===>" + uploadFullPath);
					e.printStackTrace();
				}
			}
		}

		String tvtopic_desc_content = httpServletRequest.getParameter("tvtopic_desc_content");
		System.out.println("this is tvtopic_desc_content : " + tvtopic_desc_content);

		String date = httpServletRequest.getParameter("tvtopic_tvshow_date");
		System.out.println("this is date value:" + date);
		if (httpServletRequest.getParameter("tvtopic_tvshow_date") == null
				|| httpServletRequest.getParameter("tvtopic_tvshow_date").equals("")) {
			System.out.println("this is null or equal null");
			String tvtopic_tvshow_date = "0000-01-01";
			paramMap.put("tvtopic_tvshow_date", tvtopic_tvshow_date);
		}
		// 추가적으로 paramMap에서 알아야할 정보들, writer아이디,이미지 이름, 이미지 url,
		paramMap.put("originalFileBytes", originalFileBytes);
		paramMap.put("imageUrl", imageUrl);
		// 글 쓴 날짜는 default로 현재시각으로 저장이 된다.
		int result = spdao.insertTVShowTopic(paramMap);

		// DBinsert 결과 확인하기
		if (result == 1) {
			aJaxResult = "success";
		}

		return aJaxResult;
	}

	@RequestMapping(value = "/opinion_insert_process", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject opinion_insert_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String options_myside = httpServletRequest.getParameter("options_myside");
		System.out.println("this is options_myside : " + options_myside);
		String sp_tvtopics_rcdno = httpServletRequest.getParameter("sp_tvtopics_rcdno");
		System.out.println("this is sp_tvtopics_rcdno : " + sp_tvtopics_rcdno);
		String sp_tvtopics_title = httpServletRequest.getParameter("sp_tvtopics_title");
		System.out.println("this is sp_tvtopics_title : " + sp_tvtopics_title);
		String sp_tvtopics_writer = httpServletRequest.getParameter("sp_tvtopics_writer");
		System.out.println("this is sp_tvtopics_writer : " + sp_tvtopics_writer);
		String type = httpServletRequest.getParameter("type");
		System.out.println("this is type : " + type);
		// 이유가 직접입력이면, 직접입력값을
		for (int i = 1; i < 4; i++) {
			String myside_reason = httpServletRequest.getParameter("myside_reason" + i);
			if (myside_reason.equals("1")) {
				System.out.println("this is my self :" + i);
				String myside_reason_self = httpServletRequest
						.getParameter("myside_reason" + i + "_self");
				System.out.println("this is myside_reason_self :" + myside_reason_self);
				paramMap.put("myside_reason" + i, myside_reason_self);
			}
			String opside_reason = httpServletRequest.getParameter("opside_reason" + i);
			if (opside_reason.equals("1")) {
				System.out.println("this is op self :" + i);
				String opside_reason_self = httpServletRequest
						.getParameter("opside_reason" + i + "_self");
				paramMap.put("opside_reason" + i, opside_reason_self);
			}

		}

		// 추가적으로 paramMap에서 알아야할 정보들, writer아이디,이미지 이름, 이미지 url,
		paramMap.put("sp_tvtopics_rcdno", sp_tvtopics_rcdno);
		paramMap.put("sp_tvtopics_title", sp_tvtopics_title);
		paramMap.put("sp_tvtopics_writer", sp_tvtopics_writer);
		paramMap.put("sp_tvtopics_type", type);
		// 글 쓴 날짜는 default로 현재시각으로 저장이 된다.
		int result = spdao.insertOpinion(paramMap);
		Long sp_opinion_rcdno = (Long) paramMap.get("sp_opinion_rcdno");
		// DBinsert 결과 확인하기
		JSONObject company_jsonlist = new JSONObject();
		if (result == 1) {
			aJaxResult = "success";
			// 명확한 jsonObject로 만들어서 결과값을 보내준다.
			company_jsonlist.put("sp_opinion_rcdno", sp_opinion_rcdno);
		}
		company_jsonlist.put("aJaxResult", aJaxResult);

		return company_jsonlist;
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
