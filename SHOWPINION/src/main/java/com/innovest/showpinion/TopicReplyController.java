package com.innovest.showpinion;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.innovest.dao.SPDao;
import com.innovest.dao.Reply_Dao;
import com.innovest.dto.opinion_DTO;
import com.innovest.dto.tvTopic_DTO;
import com.innovest.dto.userDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TopicReplyController {
	@Autowired
	SPDao spdao;
	@Autowired
	Reply_Dao topic_reply_dao;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	private static final Logger logger = LoggerFactory.getLogger(TopicReplyController.class);

	// AJAX 토론주제_댓글 저장하기
	@RequestMapping(value = "/topic_reply_save", method = RequestMethod.POST)
	@ResponseBody
	public Object topic_reply_save(@RequestParam Map<String, Object> paramMap) {
		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();
		// �����Է�
		int result = topic_reply_dao.topic_reply_save(paramMap);
		if (result > 0) {
			retVal.put("code", "OK");
			retVal.put("message", "정상적으로 글이 등록되었습니다.");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "글 등록에 실패하였습니다.");
		}
		return retVal;
	}

	// AJAX 토론주제_추천 및 신고
	@RequestMapping(value = "/topic_reply_recommend_process", method = RequestMethod.POST)
	@ResponseBody
	public Object topic_reply_recommend_process(@RequestParam Map<String, Object> paramMap) {
		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();
		// �����Է�

		String recom_type = (String) paramMap.get("recom_type");
		Integer reply_rcdno = Integer.parseInt(((String)paramMap.get("sp_topic_reply_rcdno")));
		// 추천 및 신고를 누르면 recommend에 기록을 남겨주고
		int result = topic_reply_dao.topic_reply_recommend_process(paramMap);
		// 그 후에 replyDTO에 업데이트를 해준다. 몇 개의 추천이 현재 들어가 있는지, 이때 replyRCD를 통해서 그 부분만 업데이트
		// 해준다.
		// 1. 현재 replyrcdno에 있는 추천과 신고 개수를 받는다.
		int thumbup_total = topic_reply_dao.counting_thumbup_topicReply(reply_rcdno);
		System.out.println("this is thumbup_total:"+thumbup_total);
		int warning_total = topic_reply_dao.counting_warning_topicReply(reply_rcdno);
		System.out.println("this is warning_total:"+warning_total);
		// 2. 그 후 replyRCDno에 있는 thumbupTotal과 warningTotal을 업데이트 해준다.

		Map<String, Object> update_param = new HashMap<String, Object>();
		System.out.println("this is reply_rcdno:"+reply_rcdno);

		update_param.put("thumbup_total",thumbup_total);
		update_param.put("warning_total",warning_total);
		update_param.put("reply_rcdno",reply_rcdno);
		int update_result = topic_reply_dao.update_topicReply_recommend(update_param);

		if (update_result > 0) {
			retVal.put("code", "OK");
			if (recom_type.equals("thumbup")) {
				retVal.put("message", "정상적으로 추천되었습니다 ");
			} else if (recom_type.equals("warning")) {
				retVal.put("message", "정상적으로 신고되었습니다 ");
			}

		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "글 등록에 실패하였습니다.");
		}
		return retVal;
	}

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
		int totalCnt = topic_reply_dao.getContentCnt(paramMap);

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
		model.addAttribute("boardList", topic_reply_dao.getContentList(paramMap));// �˻�

		return "boardList";

	}

	// �Խñ� �� ����
	@RequestMapping(value = "/boardView")
	public String boardView(@RequestParam Map<String, Object> paramMap, Model model) {

		model.addAttribute("replyList", topic_reply_dao.getReplyList(paramMap));
		model.addAttribute("boardView", topic_reply_dao.getContentView(paramMap));

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
					model.addAttribute("boardView", topic_reply_dao.getContentView(paramMap));
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

		// �����Է�
		int result = topic_reply_dao.delBoard(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "�н����带 Ȯ�����ּ���.");
		}

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

		// �����Է�
		int result = topic_reply_dao.getBoardCheck(paramMap);

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
		int result = topic_reply_dao.regReply(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
			retVal.put("message", "��Ͽ� ���� �Ͽ����ϴ�.");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "��Ͽ� ���� �Ͽ����ϴ�.");
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
		int result = topic_reply_dao.delReply(paramMap);

		if (result > 0) {
			retVal.put("code", "OK");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "������ �����߽��ϴ�. �н����带 Ȯ�����ּ���.");
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
			System.out.println("this is originalfile name2:" + originalFilename);
			Integer originalFileBytes = new Integer((int) multipartFile.getSize());
			String storedFileName = randId + "." + getExtension(originalFilename);
			String uploadResourcesPath = session.getServletContext()
					.getRealPath("/resources/upload_imagefile/");
			// 로컬에서 돌아가는 업로드 경로
			String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
			// 서버에서 돌아가는 업로드 경로
			// String uploadFullPath = uploadResourcesPath + storedFileName;

			String imageUrl = "resources/upload_imagefile/" + storedFileName;
			System.out.println("this is imageUrl2:" + imageUrl);
			try {
				// 파일 서버에 저장
				multipartFile.transferTo(new File(uploadFullPath)); // 파일저장 실제로는 service에서 처리

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
