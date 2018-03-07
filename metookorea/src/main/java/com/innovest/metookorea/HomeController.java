package com.innovest.metookorea;
/*
 * Copyright 2002-2011 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import java.security.SecureRandom;
import java.util.regex.Pattern;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONObject;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.io.File;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.innovest.dao.BoardDao;
import com.innovest.dao.meDao;
import com.innovest.dto.reportDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	meDao medao;

	@Autowired
	BoardDao boardDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

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

	@RequestMapping("/sign_up")
	public String sign_up(Model model) {
		System.out.println("this is sign_up");

		return "sign_up";
	}

	@RequestMapping("/me_report_write")
	public String me_report_write(Model model) {
		System.out.println("this is me_report_write");

		return "me_report_write";
	}

	@RequestMapping("/me_report_write_article")
	public String me_report_write_article(Model model) {
		System.out.println("this is me_report_write_article");

		return "me_report_write_article";
	}

	@RequestMapping("/report_edit")
	public String report_edit(HttpServletRequest request, Model model,
			@RequestParam Map<String, Object> paramMap) {
		System.out.println("this is report_edit");

		// Referer �˻�
		String Referer = request.getHeader("referer");

		if (Referer != null) {// URL�� ���� ���� �Ұ�
			if (paramMap.get("id") != null) { // �Խñ� ����
				if (Referer.indexOf("/report_detail") > -1) {
					// report_detail에서 왓을 시에
					List<reportDTO> reportDetail = medao.report_detail(paramMap);

					// textarea부분 치환
					String replaced = reportDetail.get(0).getM2_report_content()
							.replaceAll("<br />", "\r\n");
					reportDetail.get(0).setM2_report_content(replaced);
					
					model.addAttribute("reportDetail", reportDetail);
					// detail_report 정보를 rcdno 를 통해 얻어온 후에
					return "report_edit";
				} else {
					return "redirect:/main";
				}
			} else { // �Խñ� ���
				if (Referer.indexOf("/report_detail") > -1) {
					// report_detail에서 왓을 시에
					List<reportDTO> reportDetail = medao.report_detail(paramMap);

					// textarea부분 치환
					String replaced = reportDetail.get(0).getM2_report_content()
							.replaceAll("<br />", "\r\n");
					reportDetail.get(0).setM2_report_content(replaced);
					
					model.addAttribute("reportDetail", reportDetail);
					// detail_report 정보를 rcdno 를 통해 얻어온 후에
					
					return "report_edit";
				} else {
					return "redirect:/main";
				}
			}
		} else {
			return "redirect:/main";
		}

	}

	@RequestMapping("/report_delete_process")
	@ResponseBody
	public String report_delete_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is report_delete_process");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int insert_result = medao.report_delete(paramMap);
		if (insert_result == 0) {
			System.out.println("this is fail1");
			// 새로운 user database 삽입 실패시
			return "fail";
		} else if (insert_result == 1) {
			System.out.println("this is success");
			return "success";

		}
		System.out.println("this is fail2");
		return "fail";

	}

	@RequestMapping("/report_thumbup")
	@ResponseBody
	public String report_thumbup(Locale locale, Model model, HttpServletRequest httpServletRequest,
			@RequestParam Map<String, Object> paramMap) {
		System.out.println("this is report_thumbup");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 기존에 추천이 되있나 체크
		int result_already = medao.report_thumbup_already(paramMap);
		if (result_already >= 1) {
			return "fail";
		}

		// 추천 안되있으면 추천입력

		int insert_result = medao.report_thumbup(paramMap);
		// report table에도 +1을 해준다.
		int insert_final = medao.report_thumbup_plusone(paramMap);
		System.out.println("this is result" + insert_final);
		if (insert_final == 0) {
			System.out.println("this is fail");
			// 새로운 user database 삽입 실패시
			return "fail";
		} else if (insert_final == 1) {
			System.out.println("this is success");
			return "success";

		}
		return "fail";

	}

	@RequestMapping("/report_warning")
	@ResponseBody
	public String report_warning(Locale locale, Model model, HttpServletRequest httpServletRequest,
			@RequestParam Map<String, Object> paramMap) {
		System.out.println("this is report_warning");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 기존에 추천이 되있나 체크
		int result_already = medao.report_warning_already(paramMap);
		if (result_already >= 1) {
			return "fail";
		}

		// 추천 안되있으면 추천입력

		int insert_result = medao.report_warning(paramMap);
		// report table에도 +1을 해준다.
		int insert_final = medao.report_warning_plusone(paramMap);
		System.out.println("this is result" + insert_final);
		if (insert_final == 0) {
			System.out.println("this is fail");
			// 새로운 user database 삽입 실패시
			return "fail";
		} else if (insert_final == 1) {
			System.out.println("this is success");
			return "success";

		}
		return "fail";

	}

	@RequestMapping("/report_passwordCheck")
	@ResponseBody
	public String report_passwordCheck(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is report_passwordCheck");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int result = medao.report_passwordCheck(paramMap);
		System.out.println("this is result" + result);
		if (result == 0) {
			System.out.println("this is fail");
			// 새로운 user database 삽입 실패시
			return "fail";
		} else if (result == 1) {
			System.out.println("this is success");
			return "success";

		}
		return "fail";

	}

	@RequestMapping("/me_intro")
	public String me_intro(Model model) {
		System.out.println("this is me_intro");

		return "me_intro";
	}

	@RequestMapping(value = "/duplicateIdCheck")
	@ResponseBody
	public String duplicateIdCheck(Locale locale, Model model,
			HttpServletRequest httpServletRequest) {
		String duplicateIdCheckResult = "fail";
		String userIdInputValue = httpServletRequest.getParameter("userIdInputValue");
		System.out.println("this is duplicateIdCheck " + userIdInputValue);

		int dup_result = medao.duplicateIdCheck(userIdInputValue);

		if (dup_result == 0) {
			duplicateIdCheckResult = "success";

		} else {
			duplicateIdCheckResult = "fail";
		}
		return duplicateIdCheckResult;
	}

	@RequestMapping("/signup_process")
	@ResponseBody
	public String signup_process(Locale locale, Model model, HttpServletRequest httpServletRequest,
			@RequestParam Map<String, Object> paramMap) {
		System.out.println("this is signup_process");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String email_dup_check_id = httpServletRequest.getParameter("email_dup_check_id");
		String signup_password = httpServletRequest.getParameter("signup_password");
		// 비밀번호 인코딩해서 저장하기
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(signup_password.trim());
		paramMap.put("userid", email_dup_check_id);
		paramMap.put("password", hashedPassword);
		paramMap.put("enabled", 1);
		paramMap.put("username", httpServletRequest.getParameter("signup_username"));

		int insert_result = medao.insert_user_ByMap(paramMap);
		if (insert_result == 0) {
			System.out.println("this is insertresult ==0");
			return "fail";
		} else if (insert_result == 1) {
			Map<String, String> insertMap = new HashMap<String, String>();
			insertMap.put("userid", email_dup_check_id);
			insertMap.put("role", "ROLE_USER");
			int role_insert_result = medao.insert_userrole_byMap(insertMap);
			if (role_insert_result == 0) {
				return "fail";
			} else if (role_insert_result == 1) {
				System.out.println("this is insertresult ==1");
				return "success";
			}
		}
		return "fail";
	}

	@RequestMapping("/report_edit_process")
	@ResponseBody
	public JSONObject report_edit_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap,
			@RequestParam(required = false) MultipartFile tvtopic_tvshow_img , HttpSession session ) {
		System.out.println("this is report_edit_process");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String originalFilename = "";
		Integer originalFileBytes = 0;
		String storedFileName = "";
		String imageUrl = "";
		// 스탭 1. TV 프로그램 이미지 파일 삽입.
		if (tvtopic_tvshow_img == null) {
			// 만약에 tv쇼 이미지 파일이 없다면, default 값을 저장하자.

		} else {
			// 1. TVSHOW 프로그램 포스터 이미지 저장하기 작업
			MultipartFile multipartFile = tvtopic_tvshow_img;
			// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
			String randId = UUID.randomUUID().toString();
			originalFilename = multipartFile.getOriginalFilename(); // 파일명
			// 만약 파일이 없으면, DB에 넣지 않아도 된다.
			if (originalFilename.equals("")) {

			} else {
				System.out.println("this is originalfile name:" + originalFilename);
				originalFileBytes = new Integer((int) multipartFile.getSize());
				storedFileName = randId + "." + getExtension(originalFilename);
				String uploadResourcesPath = session.getServletContext()
						.getRealPath("/resources/img_tvshow_poster/");
				// 로컬에서 돌아가는 업로드 경로
				//String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
				// 서버에서 돌아가는 업로드 경로
				 String uploadFullPath = uploadResourcesPath + storedFileName;
				imageUrl = "resources/img_tvshow_poster/" + storedFileName;
				System.out.println("this is imageUrl:" + imageUrl);
				try {
					// 파일 서버에 저장
					multipartFile.transferTo(new File(uploadFullPath)); // 파일저장 실제로는 service에서 처리
				} catch (Exception e) {
					System.out.println("postTempFile_ERROR===s===>" + uploadFullPath);
					e.printStackTrace();
				}
			}
		}
		paramMap.put("m2_report_link", imageUrl);
		
		
		String report_rcdno = (String) paramMap.get("report_rcdno");
		System.out.println("this is report_rcdno:" + report_rcdno);
		String onNews = httpServletRequest.getParameter("onNews");
		System.out.println("this is onNews:" + onNews);
		paramMap.put("onNews", onNews);
		
		String report_content_ckeditor = httpServletRequest.getParameter("report_content_ckeditor");
		System.out.println("this is report_content_ckeditor:"+report_content_ckeditor);
		paramMap.put("report_content", report_content_ckeditor);
		
		int insert_result = medao.update_report_ByMap(paramMap);

		JSONObject company_jsonlist = new JSONObject();
		if (insert_result == 1) {
			aJaxResult = "success";
			// 명확한 jsonObject로 만들어서 결과값을 보내준다.
			company_jsonlist.put("report_rcdno", report_rcdno);
		}
		company_jsonlist.put("aJaxResult", aJaxResult);
		return company_jsonlist;

	}

	@RequestMapping(value = "/report_insert_process", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject report_insert_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap,
			@RequestParam(required = false) MultipartFile tvtopic_tvshow_img , HttpSession session) {
		System.out.println("this is report_insert_process");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String originalFilename = "";
		Integer originalFileBytes = 0;
		String storedFileName = "";
		String imageUrl = "";
		// 스탭 1. TV 프로그램 이미지 파일 삽입.
		if (tvtopic_tvshow_img == null) {
			// 만약에 tv쇼 이미지 파일이 없다면, default 값을 저장하자.

		} else {
			// 1. TVSHOW 프로그램 포스터 이미지 저장하기 작업
			MultipartFile multipartFile = tvtopic_tvshow_img;
			// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
			String randId = UUID.randomUUID().toString();
			originalFilename = multipartFile.getOriginalFilename(); // 파일명
			// 만약 파일이 없으면, DB에 넣지 않아도 된다.
			if (originalFilename.equals("")) {

			} else {
				System.out.println("this is originalfile name:" + originalFilename);
				originalFileBytes = new Integer((int) multipartFile.getSize());
				storedFileName = randId + "." + getExtension(originalFilename);
				String uploadResourcesPath = session.getServletContext()
						.getRealPath("/resources/img_tvshow_poster/");
				// 로컬에서 돌아가는 업로드 경로
				//String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
				// 서버에서 돌아가는 업로드 경로
				 String uploadFullPath = uploadResourcesPath + storedFileName;
				imageUrl = "resources/img_tvshow_poster/" + storedFileName;
				System.out.println("this is imageUrl:" + imageUrl);
				try {
					// 파일 서버에 저장
					multipartFile.transferTo(new File(uploadFullPath)); // 파일저장 실제로는 service에서 처리
				} catch (Exception e) {
					System.out.println("postTempFile_ERROR===s===>" + uploadFullPath);
					e.printStackTrace();
				}
			}
		}
		paramMap.put("m2_report_link", imageUrl);

		String onNews = httpServletRequest.getParameter("onNews");
		System.out.println("this is onNews:" + onNews);
		paramMap.put("onNews", onNews);

		String test = httpServletRequest.getParameter("test");
		System.out.println("this is test:" + test);
		
		String report_content_ckeditor = httpServletRequest.getParameter("report_content_ckeditor");
		System.out.println("this is report_content_ckeditor:"+report_content_ckeditor);
		paramMap.put("report_content", report_content_ckeditor);
		int insert_result = medao.insert_report_ByMap(paramMap);
		// 데이터 베이스에 입력 후 값을 파라미터를 통해 가져올 수 있다.
		Long m2_report_rcdno = (Long) paramMap.get("m2_report_rcdno");
		JSONObject company_jsonlist = new JSONObject();
		if (insert_result == 1) {
			aJaxResult = "success";
			// 명확한 jsonObject로 만들어서 결과값을 보내준다.
			company_jsonlist.put("m2_report_rcdno", m2_report_rcdno);
		}
		company_jsonlist.put("aJaxResult", aJaxResult);
		return company_jsonlist;

	}

	@RequestMapping("/me_report_list")
	public String me_report_list(Model model, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is me_report_list");
		List<reportDTO> normallist = medao.report_select_normallist(paramMap);

		//텍스트만 뽑아서 전달해준다. 목록 리스트이니..
		for(int i=0; i<normallist.size();i++) {
			String report_content = normallist.get(i).getM2_report_content();
			report_content = report_content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			
			if(report_content.length()>300) {
				report_content = report_content.substring(0, 300);
			}
			normallist.get(i).setM2_report_content(report_content);
		}
		model.addAttribute("normalList", normallist);
		
		return "me_report_list";
	}

	@RequestMapping("/me_article_list")
	public String me_article_list(Model model, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is me_article_list");
		List<reportDTO> articleList = medao.report_select_articlelist(paramMap);
		
		//텍스트만 뽑아서 전달해준다. 목록 리스트이니..
		for(int i=0; i<articleList.size();i++) {
			String report_content = articleList.get(i).getM2_report_content();
			report_content = report_content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			if(report_content.length()>300) {
				report_content = report_content.substring(0, 300);
			}
			articleList.get(i).setM2_report_content(report_content);
		}
		model.addAttribute("articleList", articleList);

		return "me_article_list";
	}

	@RequestMapping("/freetalkboard")
	public String freetalkboard(Model model) {
		System.out.println("this is freetalkboard");

		return "freetalkboard";
	}

	@RequestMapping("/report_detail")
	public String report_detail(@RequestParam Map<String, Object> paramMap, Model model) {
		System.out.println("this is report_detail");
		List<reportDTO> reportDetail = medao.report_detail(paramMap);
		model.addAttribute("reportDetail", reportDetail);
		// detail_report 정보를 rcdno 를 통해 얻어온 후에

		// 리포트에 있는 댓글을 모두 모아 준다.
		model.addAttribute("replyList", medao.selectBoardReplyList_report(paramMap));

		return "report_detail";
	}

	// AJAX ȣ�� (��� ���)
	@RequestMapping(value = "/boardReply_save_report", method = RequestMethod.POST)
	@ResponseBody
	public Object boardReply_save_report(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		paramMap.put("reply_password", password);

		// �����Է�
		int result = medao.insertBoardReply_report(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
			retVal.put("message", "성공적으로 댓글이 달렸습니다.");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "댓글등록에 실패했습니다");
		}

		return retVal;

	}

	// AJAX ȣ�� (��� ����)
	@RequestMapping(value = "/boardReply_del_report", method = RequestMethod.POST)
	@ResponseBody
	public Object boardReply_del_report(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		paramMap.put("reply_password", password);

		// �����Է�
		int result = medao.deleteBoardReply_report(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "댓글 삭제에 실패하였습니다. 비밀번호를 확인해주세요.");
		}

		return retVal;

	}

	// �Խñ� ����Ʈ ��ȸ
	@RequestMapping(value = "/boardList")
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
		int totalCnt = boardDao.getContentCnt(paramMap);

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
		model.addAttribute("boardList", boardDao.getContentList(paramMap));// �˻�

		return "boardList";

	}

	// �Խñ� �� ����
	@RequestMapping(value = "/boardView")
	public String boardView(@RequestParam Map<String, Object> paramMap, Model model) {

		model.addAttribute("replyList", boardDao.getReplyList(paramMap));
		model.addAttribute("boardView", boardDao.getContentView(paramMap));

		return "boardView";

	}

	// �Խñ� ��� �� ����
	@RequestMapping(value = "/boardEdit")
	public String boardEdit(HttpServletRequest request, @RequestParam Map<String, Object> paramMap,
			Model model) {

		// Referer �˻�
		String Referer = request.getHeader("referer");

		if (Referer != null) {// URL�� ���� ���� �Ұ�
			if (paramMap.get("id") != null) { // �Խñ� ����
				if (Referer.indexOf("/boardView") > -1) {

					// ������ �����´�.
					model.addAttribute("boardView", boardDao.getContentView(paramMap));
					return "boardEdit";
				} else {
					return "redirect:/boardList";
				}
			} else { // �Խñ� ���
				if (Referer.indexOf("/boardList") > -1) {
					return "boardEdit";
				} else {
					return "redirect:/boardList";
				}
			}
		} else {
			return "redirect:/boardList";
		}

	}

	// AJAX ȣ�� (�Խñ� ���)
	@RequestMapping(value = "/boardSave", method = RequestMethod.POST)
	@ResponseBody
	public Object boardSave(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("password").toString(), null);
		paramMap.put("password", password);

		// �����Է�
		int result = boardDao.regContent(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
			retVal.put("message", "성공적으로 등록되엇습니다.");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "등록에 실패했습니다. 다시 한번 시도해주세요");
		}

		return retVal;

	}

	// AJAX ȣ�� (�Խñ� ����)
	@RequestMapping(value = "/boardDel", method = RequestMethod.POST)
	@ResponseBody
	public Object boardDel(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("password").toString(), null);
		paramMap.put("password", password);

		System.out.println("this is password:" + password);
		// �����Է�
		int result = boardDao.delBoard(paramMap);
		if (result > 0) {
			System.out.println("this is success result");
			retVal.put("code", "OK");
		} else {
			System.out.println("this is fail result");
			retVal.put("code", "FAIL");
			retVal.put("message", "비밀번호를 확인해주세요");
		}
		// ���ϰ�

		return retVal;

	}

	// AJAX ȣ�� (�Խñ� �н����� Ȯ��)
	@RequestMapping(value = "/boardCheck", method = RequestMethod.POST)
	@ResponseBody
	public Object boardCheck(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("password").toString(), null);
		paramMap.put("password", password);

		System.out.println("this is password:" + password);
		// �����Է�
		int result = boardDao.getBoardCheck(paramMap);
		System.out.println("this is getBoardCheck:" + result);
		System.out.println("this is getBoardCheck password:" + password);
		String id = (String) paramMap.get("id");
		System.out.println("this is getBoardCheck id:" + id);

		if (result > 0) {
			System.out.println("this is success result");
			retVal.put("code", "OK");
		} else {
			System.out.println("this is fail result");
			retVal.put("code", "FAIL");
			retVal.put("message", "비밀번호를 확인해주세요");
		}

		return retVal;

	}

	// AJAX ȣ�� (��� ���)
	@RequestMapping(value = "/boardReply_save", method = RequestMethod.POST)
	@ResponseBody
	public Object boardReplySave(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		paramMap.put("reply_password", password);

		// �����Է�
		int result = boardDao.regReply(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
			retVal.put("message", "성공적으로 댓글이 달렸습니다.");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "댓글등록에 실패했습니다");
		}

		return retVal;

	}

	// AJAX ȣ�� (��� ����)
	@RequestMapping(value = "/boardReply_del", method = RequestMethod.POST)
	@ResponseBody
	public Object boardReplyDel(@RequestParam Map<String, Object> paramMap) {

		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		// �н����� ��ȣȭ
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		paramMap.put("reply_password", password);

		// �����Է�
		int result = boardDao.delReply(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "댓글 삭제에 실패하였습니다. 비밀번호를 확인해주세요.");
		}

		return retVal;

	}

	@RequestMapping(value = "/boardImageUpload", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, @RequestParam MultipartFile upload) {

		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
		String randId = UUID.randomUUID().toString();
		MultipartFile multipartFile = upload;
		String originalFilename = multipartFile.getOriginalFilename(); // 파일명
		// 만약 파일이 없으면, DB에 넣지 않아도 된다.
		if (originalFilename.equals("")) {

		} else {
			System.out.println("this is originalFileName is not empty");
			Integer originalFileBytes = new Integer((int) multipartFile.getSize());
			String storedFileName = randId + "." + getExtension(originalFilename);
			System.out.println("this is storedFileName:" + storedFileName);
			String uploadResourcesPath = session.getServletContext().getRealPath("/resources/upload_imagefile/");
			// 로켈에서 돌아가는 경로
			//String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
			// 서버에서 돌아가는 경로
			String uploadFullPath = uploadResourcesPath + storedFileName;
			String imageUrl = "resources/upload_imagefile/" + storedFileName;
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
				System.out.println("this is call Back:" + callback);
				printWriter = response.getWriter();
				String fileUrl = imageUrl;// url경로
				System.out.println("this is fileUrl :" + fileUrl);
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
