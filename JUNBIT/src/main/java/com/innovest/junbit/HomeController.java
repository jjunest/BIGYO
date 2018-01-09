package com.innovest.junbit;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.innovest.dao.CalendarDao;
import com.innovest.dao.MemberDao;
import com.innovest.dto.calendarDTO;
import com.innovest.dto.userDTO;
import com.innovest.freetalkboard.service.BoardService;
import com.innovest.freetalkboard.service.BoardService_coininfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	MemberDao memberdao;

	@Autowired
	CalendarDao calendardao;

	@Autowired
	BoardService boardService;
	

	@Autowired
	BoardService_coininfo boardService_coininfo;
	
	

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "redirect:index";
	}

	@RequestMapping("/notYetPage")
	public String notYetPage(Locale locale, Model model) {

		return "notYetPage";
	}
	
	@RequestMapping("/coinCalculator")
	public String coinCalculator(Locale locale, Model model) {

		return "coinCalculator";
	}

	

	@RequestMapping("/coinCalendarInsertProcessing")
	@ResponseBody
	public String coinCalendarInsertProcessing(Locale locale, Model model,
			HttpServletRequest httpServletRequest) {
		String jsonInfo = httpServletRequest.getParameter("jsonInfo");
		System.out.println("this is json Info :" + jsonInfo);
		try {
			JSONParser jsonParser = new JSONParser();
			// JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonInfo);
			// books의 배열을 추출
			JSONArray calendarInfoArray = (JSONArray) jsonObject.get("coinCalendar");
			for (int i = 0; i < calendarInfoArray.size(); i++) {
				// 배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
				JSONObject calendarObject = (JSONObject) calendarInfoArray.get(i);
				// JSON name으로 추출

				String calendar_title = (String) calendarObject.get("title");
				String calendar_url = (String) calendarObject.get("url");
				String start = (String) calendarObject.get("start_date");
				String end = (String) calendarObject.get("end_date");
				// 데이터베이스에 삽

				if (end == null || end.equals("")) {
					end = start;

				}
				Date calendar_start = java.sql.Date.valueOf(start);
				Date calendar_end = java.sql.Date.valueOf(end);
				calendarDTO insertDTO = new calendarDTO(calendar_title, calendar_url,
						calendar_start, calendar_end, "etc1", "etc2", "etc3");

				calendardao.insertCalendarByObj(insertDTO);

			}

			/* Date chk_end_date = java.sql.Date.valueOf(chk_end_date_string); */

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "success";
	}

	@RequestMapping("/good_point_processing")
	@ResponseBody
	public String good_point_processing(Locale locale, Model model, HttpServletRequest httpServletRequest) {
		String boardViewID = httpServletRequest.getParameter("boardViewID");
		System.out.println("this is user boardID:"+boardViewID);
		//업데이트
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardViewID", boardViewID);
		
		
		boardService.goodPointPlusOne(paramMap);
	
		return "success";
	}

	@RequestMapping("/coinCalendarWrite")
	public String coinCalendarWrite(Locale locale, Model model) {

		return "coinCalendarWrite";
	}

	@RequestMapping("/coinCalendar")
	public String coinCalendar(Model model) {
		System.out.println("this is coinCalendar");
		List<calendarDTO> result_list = calendardao.selectAllCalendar();
		model.addAttribute("result_list", result_list);

		return "coinCalendar";
	}

	@RequestMapping("/calendarTest")
	public String calendarTest(Model model) {
		System.out.println("this is calendarTest");

		return "calendarTest";
	}

	@RequestMapping("/index")
	public String index(Model model) {
		System.out.println("this is index");

		return "index";
	}

	@RequestMapping("/serviceIntro")
	public String serviceIntro(Model model) {
		System.out.println("this is serviceIntro");

		return "serviceIntro";
	}

	@RequestMapping("/howToUseJunbit")
	public String howToUseJunbit(Model model) {
		System.out.println("this is howToUseJunbit");

		return "howToUseJunbit";
	}

	@RequestMapping("/downloadJunbit")
	public String downloadJunbit(Model model) {

		System.out.println("this is downloadJunbit");

		return "downloadJunbit";
	}

	@RequestMapping("/faqs")
	public String faqs(Model model) {

		System.out.println("this is faqs");

		return "faqs";
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
	public String signup(Locale locale, Model model, HttpServletRequest httpServletRequest) {
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "signup";
	}

	@RequestMapping("/security/admin")
	public String security_admin(Locale locale, Model model) {

		return "security/admin";
	}

	@RequestMapping(value = "/duplicateIdCheck")
	@ResponseBody
	public String duplicateIdCheck(Locale locale, Model model,
			HttpServletRequest httpServletRequest) {
		String duplicateIdCheckResult = "fail";

		String userIdInputValue = httpServletRequest.getParameter("userIdInputValue");
		System.out.println("this is duplicateIdCheck : and value: " + userIdInputValue);

		int dup_result = memberdao.duplicateIdCheck(userIdInputValue);

		if (dup_result == 0) {
			duplicateIdCheckResult = "success";

		} else {
			duplicateIdCheckResult = "fail";
		}
		return duplicateIdCheckResult;
	}

	@RequestMapping(value = "/signUpProcessing")
	public String signUpProcessing(Locale locale, Model model,
			HttpServletRequest httpServletRequest) {
		try {

			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String insertNewUserResult = "fail";
		String userIdInput = httpServletRequest.getParameter("userIdInput");
		String userPwInput = httpServletRequest.getParameter("userPwInput");
		String fullNameInput = httpServletRequest.getParameter("fullNameInput");
		String phoneNumInput = httpServletRequest.getParameter("phoneNumInput");
		String emailInput = httpServletRequest.getParameter("emailInput");

		System.out.println("this is fullNameInput:" + fullNameInput);
		userDTO newUserObj = new userDTO(userIdInput, userPwInput, 1, fullNameInput, phoneNumInput,
				emailInput);
		int insert_result = memberdao.insertNewUserIntoDatabaseByObj(newUserObj);

		if (insert_result == 0) {
			System.out.println("this is insertresult ==0");
			// 새로운 user database 삽입 실패시
			return "redirect:signUp?ng";
		} else if (insert_result == 1) {

			Map<String, String> insertMap = new HashMap<String, String>();
			insertMap.put("userid", userIdInput);
			insertMap.put("role", "ROLE_USER");

			int role_insert_result = memberdao.insertUserRoleIntoDatabaseByMap(insertMap);

			if (role_insert_result == 0) {
				return "redirect:signUp?ng";

			} else if (role_insert_result == 1) {
				System.out.println("this is insertresult ==1");
				return "redirect:downloadJunbit";
			}

		}

		return "redirect:signUp?ng";
	}

	@RequestMapping(value = "/idpwCheckFromJUNBIT")
	@ResponseBody
	public JSONObject idpwCheckFromJUNBIT(Locale locale, Model model,
			HttpServletRequest httpServletRequest) {
		String userIdFromJunbit = httpServletRequest.getParameter("userIdFromJunbit");
		String userPwFromJunbit = httpServletRequest.getParameter("userPwFromJunbit");
		String junbit_version = httpServletRequest.getParameter("junbit_version");
		String checkResult = "loginFail&userIdFromJunbit:" + userIdFromJunbit + ",userPwFromJunbit:"
				+ userPwFromJunbit;

		if (junbit_version.equals("1.0")) {
			try {

				System.out.println("this is userIdFromJunbit:" + userIdFromJunbit);
				if (userIdFromJunbit == null || userPwFromJunbit == null) {
					checkResult = "loginFail&userIdFromJunbit:" + userIdFromJunbit
							+ ",userPwFromJunbit:" + userPwFromJunbit;
				} else {
					Map<String, String> insertMap = new HashMap<String, String>();
					insertMap.put("userid", userIdFromJunbit);

					userDTO selectedUserDTO = memberdao.passwordCheck(insertMap);

					if (userPwFromJunbit.equals(selectedUserDTO.getPassword())) {
						System.out.println("this is loginCheck Success");
						checkResult = "loginSuccess";
					} else {
						System.out.println("this is loginCheck Fail");
						checkResult = "loginFail&userIdFromJunbit:" + userIdFromJunbit
								+ ",userPwFromJunbit:" + userPwFromJunbit;
					}

				}
			} catch (Exception e) {
				System.out
						.println("this is error exception in idpwCheckFromJUNBIT(); and exception:"
								+ e.toString());
				// 명확한 jsonObject로 만들어서 결과값을 보내준다.
				JSONObject jsonObjectResult = new JSONObject();
				jsonObjectResult.put("checkResult", checkResult);

			}

		} else {

			checkResult = "versionProblem";
		}

		// 명확한 jsonObject로 만들어서 결과값을 보내준다.
		JSONObject jsonObjectResult = new JSONObject();
		jsonObjectResult.put("checkResult", checkResult);

		return jsonObjectResult;
	}

	// freetalkboard(자유게시판) 시작

	// �Խñ� ����Ʈ ��ȸ
	@RequestMapping(value = "/freetalkboard/list")
	public String boardList(@RequestParam Map<String, Object> paramMap, Model model) {

		// ��ȸ �Ϸ��� ������
		int startPage = (paramMap.get("startPage") != null
				? Integer.parseInt(paramMap.get("startPage").toString())
				: 1);
		// ���������� ������ ����Ʈ ��
		int visiblePages = (paramMap.get("visiblePages") != null
				? Integer.parseInt(paramMap.get("visiblePages").toString())
				: 10);
		// �ϴ� ��ü �Ǽ��� �����´�.
		int totalCnt = boardService.getContentCnt(paramMap);

		// �Ʒ� 1,2�� ���� ���߿����� class�� ���ش�. (���⼭�� ���ظ� ���� ���� ����)
		// 1.�ϴ� ������ �׺���̼ǿ��� ������ ����Ʈ ���� ���Ѵ�.
		BigDecimal decimal1 = new BigDecimal(totalCnt);
		BigDecimal decimal2 = new BigDecimal(visiblePages);
		BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);

		int startLimitPage = 0;
		// 2.mysql limit ������ ���ϱ� ���� ���
		if (startPage == 1) {
			startLimitPage = 0;
		} else {
			startLimitPage = (startPage - 1) * visiblePages;
		}

		paramMap.put("start", startLimitPage);
		paramMap.put("end", visiblePages);
		// jsp ���� ������ ���� ����
		model.addAttribute("startPage", startPage + "");// ���� ������
		model.addAttribute("totalCnt", totalCnt);// ��ü �Խù���
		model.addAttribute("totalPage", totalPage);// ������ �׺���̼ǿ� ������ ����Ʈ ��
		model.addAttribute("boardList", boardService.getContentList(paramMap));// �˻�
		return "freetalkboard/boardList";

	}

	// �Խñ� �� ����
	@RequestMapping(value = "/freetalkboard/view")
	public String boardView(@RequestParam Map<String, Object> paramMap, Model model) {

		model.addAttribute("replyList", boardService.getReplyList(paramMap));
		model.addAttribute("boardView", boardService.getContentView(paramMap));

		return "freetalkboard/boardView";

	}

	// �Խñ� ��� �� ����
	@RequestMapping(value = "/freetalkboard/edit")
	public String boardEdit(HttpServletRequest request, @RequestParam Map<String, Object> paramMap,
			Model model) {

		// Referer �˻�
		String Referer = request.getHeader("referer");
		System.out.println("this is refer:" + Referer);
		if (Referer != null) {// URL�� ���� ���� �Ұ�
			if (paramMap.get("id") != null) { // �Խñ� ����
				System.out.println("this is refer:" + Referer);
				if (Referer.indexOf("/freetalkboard/view") > -1) {
					System.out.println("this is indexOf:" + Referer);
					// ������ �����´�.
					model.addAttribute("boardView", boardService.getContentView(paramMap));
					return "freetalkboard/boardEdit";
				} else {
					return "redirect:/freetalkboard/list";
				}
			} else { // �Խñ� ���
				if (Referer.indexOf("freetalkboard/list") > -1) {
					return "freetalkboard/boardEdit";
				} else {
					return "redirect:/freetalkboard/list";
				}
			}
		} else {
			return "redirect:freetalkboard/list";
		}

	}

	// AJAX ȣ�� (�Խñ� ���)
	@RequestMapping(value = "/freetalkboard/save", method = RequestMethod.POST)
	@ResponseBody
	public Object boardSave(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("password").toString(), null);
		paramMap.put("password", password);

		// �����Է�
		int result = boardService.regContent(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
			retVal.put("message", "��Ͽ� ���� �Ͽ����ϴ�.");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "��Ͽ� ���� �Ͽ����ϴ�.");
		}

		return retVal;

	}

	// AJAX ȣ�� (�Խñ� ����)
	@RequestMapping(value = "/freetalkboard/del", method = RequestMethod.POST)
	@ResponseBody
	public Object boardDel(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("password").toString(), null);
		paramMap.put("password", password);

		// �����Է�
		int result = boardService.delBoard(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "�н����带 Ȯ�����ּ���.");
		}

		return retVal;

	}

	// AJAX ȣ�� (�Խñ� �н����� Ȯ��)
	@RequestMapping(value = "/freetalkboard/check", method = RequestMethod.POST)
	@ResponseBody
	public Object boardCheck(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("password").toString(), null);
		paramMap.put("password", password);

		// �����Է�
		int result = boardService.getBoardCheck(paramMap);

		if (result > 0) {
			System.out.println("this is success result");
			retVal.put("code", "OK");
		} else {
			System.out.println("this is fail result");
			retVal.put("code", "FAIL");
			retVal.put("message", "�н����带 Ȯ�����ּ���.");
		}

		return retVal;

	}

	// AJAX ȣ�� (��� ���)
	@RequestMapping(value = "/freetalkboard/reply/save", method = RequestMethod.POST)
	@ResponseBody
	public Object boardReplySave(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		paramMap.put("reply_password", password);

		// �����Է�
		int result = boardService.regReply(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
			retVal.put("message", "댓글 등록에 성공하였습니다");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "댓글 등록에 실패하였습니다");
		}

		return retVal;

	}

	// AJAX ȣ�� (��� ����)
	@RequestMapping(value = "/freetalkboard/reply/del", method = RequestMethod.POST)
	@ResponseBody
	public Object boardReplyDel(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		paramMap.put("reply_password", password);

		// �����Է�
		int result = boardService.delReply(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "������ �����߽��ϴ�. �н����带 Ȯ�����ּ���.");
		}

		return retVal;

	}

	@RequestMapping(value = "/freetalkboard/imageUpload", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, @RequestParam MultipartFile upload) {

		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		// 건강검진 서비스 사진 서버에 전송 시작
		// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
		String randId = UUID.randomUUID().toString();
		MultipartFile multipartFile = upload;
		String originalFilename = multipartFile.getOriginalFilename(); // 파일명
		// 만약 파일이 없으면, DB에 넣지 않아도 된다.
		if (originalFilename.equals("")) {

		} else {
			System.out.println("this is originalfile name:" + originalFilename);
			Integer originalFileBytes = new Integer((int) multipartFile.getSize());
			String storedFileName = randId + "." + getExtension(originalFilename);
			String uploadResourcesPath = session.getServletContext()
					.getRealPath("/resources/upload_imagefile/");
			// 로컬에서 돌아가는 업로드 경로
			 //String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
			// 서버에서 돌아가는 업로드 경로
			 String uploadFullPath = uploadResourcesPath + storedFileName;

			String imageUrl = "../resources/upload_imagefile/" + storedFileName;
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

				String callback = request.getParameter("CKEditorFuncNum");

				printWriter = response.getWriter();
				String fileUrl = imageUrl;// url경로

				printWriter.println(
						"<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
								+ callback + ",'" + fileUrl + "','이미지를 업로드 하였습니다.'" + ")</script>");
				printWriter.flush();

			} catch (Exception e) {
				System.out.println("postTempFile_ERROR===s===>" + uploadFullPath);
				e.printStackTrace();
			}
		}
		return;
	}

	// freetalk board 끝---------
	
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


	
	
	// coinInfo board 시작---
	@RequestMapping(value = "/coininfoboard/list")
	public String coinInfoboardList(@RequestParam Map<String, Object> paramMap, Model model) {
		// ��ȸ �Ϸ��� ������
		int startPage = (paramMap.get("startPage") != null
				? Integer.parseInt(paramMap.get("startPage").toString())
				: 1);
		// ���������� ������ ����Ʈ ��
		int visiblePages = (paramMap.get("visiblePages") != null
				? Integer.parseInt(paramMap.get("visiblePages").toString())
				: 10);
		// �ϴ� ��ü �Ǽ��� �����´�.
		int totalCnt = boardService_coininfo.getContentCnt(paramMap);
		// �Ʒ� 1,2�� ���� ���߿����� class�� ���ش�. (���⼭�� ���ظ� ���� ���� ����)
		// 1.�ϴ� ������ �׺���̼ǿ��� ������ ����Ʈ ���� ���Ѵ�.
		BigDecimal decimal1 = new BigDecimal(totalCnt);
		BigDecimal decimal2 = new BigDecimal(visiblePages);
		BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);

		int startLimitPage = 0;
		// 2.mysql limit ������ ���ϱ� ���� ���
		if (startPage == 1) {
			startLimitPage = 0;
		} else {
			startLimitPage = (startPage - 1) * visiblePages;
		}

		paramMap.put("start", startLimitPage);
		paramMap.put("end", visiblePages);
		// jsp ���� ������ ���� ����
		model.addAttribute("startPage", startPage + "");// ���� ������
		model.addAttribute("totalCnt", totalCnt);// ��ü �Խù���
		model.addAttribute("totalPage", totalPage);// ������ �׺���̼ǿ� ������ ����Ʈ ��
		model.addAttribute("boardList", boardService_coininfo.getContentList(paramMap));// �˻�
		return "coininfoboard/boardList";

	}

	// �Խñ� �� ����
	@RequestMapping(value = "/coininfoboard/view")
	public String coinIcoinInfoboardView(@RequestParam Map<String, Object> paramMap, Model model) {

		model.addAttribute("replyList", boardService_coininfo.getReplyList(paramMap));
		model.addAttribute("boardView", boardService_coininfo.getContentView(paramMap));

		return "coininfoboard/boardView";

	}

	// �Խñ� ��� �� ����
	@RequestMapping(value = "/coininfoboard/edit")
	public String coinInfoboardEdit(HttpServletRequest request, @RequestParam Map<String, Object> paramMap,
			Model model) {

		// Referer �˻�
		String Referer = request.getHeader("referer");
		System.out.println("this is refer:" + Referer);
		if (Referer != null) {// URL�� ���� ���� �Ұ�
			if (paramMap.get("id") != null) { // �Խñ� ����
				System.out.println("this is refer:" + Referer);
				if (Referer.indexOf("/coininfoboard/view") > -1) {
					System.out.println("this is indexOf:" + Referer);
					// ������ �����´�.
					model.addAttribute("boardView", boardService_coininfo.getContentView(paramMap));
					return "coininfoboard/boardEdit";
				} else {
					return "redirect:/coininfoboard/list";
				}
			} else {
				if (Referer.indexOf("coininfoboard/list") > -1) {
					return "coininfoboard/boardEdit";
				} else {
					return "redirect:/coininfoboard/list";
				}
			}
		} else {
			return "coininfoboard/list";
		}

	}

	// AJAX ȣ�� (�Խñ� ���)
	@RequestMapping(value = "/coininfoboard/save", method = RequestMethod.POST)
	@ResponseBody
	public Object coinInfoboardSave(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("password").toString(), null);
		paramMap.put("password", password);

		// �����Է�
		int result = boardService_coininfo.regContent(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
			retVal.put("message", "��Ͽ� ���� �Ͽ����ϴ�.");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "��Ͽ� ���� �Ͽ����ϴ�.");
		}

		return retVal;

	}

	// AJAX ȣ�� (�Խñ� ����)
	@RequestMapping(value = "/coininfoboard/del", method = RequestMethod.POST)
	@ResponseBody
	public Object coinInfoboardDel(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("password").toString(), null);
		paramMap.put("password", password);

		// �����Է�
		int result = boardService_coininfo.delBoard(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "�н����带 Ȯ�����ּ���.");
		}

		return retVal;

	}

	// AJAX ȣ�� (�Խñ� �н����� Ȯ��)
	@RequestMapping(value = "/coininfoboard/check", method = RequestMethod.POST)
	@ResponseBody
	public Object coinInfoboardCheck(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("password").toString(), null);
		paramMap.put("password", password);

		// �����Է�
		int result = boardService_coininfo.getBoardCheck(paramMap);

		if (result > 0) {
			System.out.println("this is success result");
			retVal.put("code", "OK");
		} else {
			System.out.println("this is fail result");
			retVal.put("code", "FAIL");
			retVal.put("message", "�н����带 Ȯ�����ּ���.");
		}

		return retVal;

	}

	// AJAX ȣ�� (��� ���)
	@RequestMapping(value = "/coininfoboard/reply/save", method = RequestMethod.POST)
	@ResponseBody
	public Object coinInfoboardReplySave(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		paramMap.put("reply_password", password);

		// �����Է�
		int result = boardService_coininfo.regReply(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
			retVal.put("message", "댓글 등록에 성공하였습니다");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "댓글 등록에 실패하였습니다");
		}

		return retVal;

	}

	// AJAX ȣ�� (��� ����)
	@RequestMapping(value = "/coininfoboard/reply/del", method = RequestMethod.POST)
	@ResponseBody
	public Object coinInfoboardReplyDel(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		paramMap.put("reply_password", password);

		// �����Է�
		int result = boardService_coininfo.delReply(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "������ �����߽��ϴ�. �н����带 Ȯ�����ּ���.");
		}

		return retVal;

	}

	@RequestMapping(value = "/coininfoboard/imageUpload", method = RequestMethod.POST)
	public void coinInfocommunityImageUpload(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, @RequestParam MultipartFile upload) {

		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		// 건강검진 서비스 사진 서버에 전송 시작
		// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
		String randId = UUID.randomUUID().toString();
		MultipartFile multipartFile = upload;
		String originalFilename = multipartFile.getOriginalFilename(); // 파일명
		// 만약 파일이 없으면, DB에 넣지 않아도 된다.
		if (originalFilename.equals("")) {

		} else {
			System.out.println("this is originalfile name:" + originalFilename);
			Integer originalFileBytes = new Integer((int) multipartFile.getSize());
			String storedFileName = randId + "." + getExtension(originalFilename);
			String uploadResourcesPath = session.getServletContext()
					.getRealPath("/resources/upload_imagefile/");
			// 로컬에서 돌아가는 업로드 경로
		
		//String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
			// 서버에서 돌아가는 업로드 경로
			 String uploadFullPath = uploadResourcesPath + storedFileName;

			String imageUrl = "../resources/upload_imagefile/" + storedFileName;
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

				String callback = request.getParameter("CKEditorFuncNum");

				printWriter = response.getWriter();
				String fileUrl = imageUrl;// url경로

				printWriter.println(
						"<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
								+ callback + ",'" + fileUrl + "','이미지를 업로드 하였습니다.'" + ")</script>");
				printWriter.flush();

			} catch (Exception e) {
				System.out.println("postTempFile_ERROR===s===>" + uploadFullPath);
				e.printStackTrace();
			}
		}
		return;
	}
	//coinInfo board 끝 --- 
}
