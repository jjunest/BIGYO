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
	BCryptPasswordEncoder passwordEncoder;
	private static final Logger logger = LoggerFactory.getLogger(TopicReplyController.class);
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
		int totalCnt = spdao.getContentCnt(paramMap);

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
		model.addAttribute("boardList", spdao.getContentList(paramMap));// �˻�

		return "boardList";

	}

	// �Խñ� �� ����
	@RequestMapping(value = "/boardView")
	public String boardView(@RequestParam Map<String, Object> paramMap, Model model) {

		model.addAttribute("replyList", spdao.getReplyList(paramMap));
		model.addAttribute("boardView", spdao.getContentView(paramMap));

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
					model.addAttribute("boardView", spdao.getContentView(paramMap));
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
		int result = spdao.regContent(paramMap);

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
		int result = spdao.delBoard(paramMap);

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
		int result = spdao.getBoardCheck(paramMap);

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
		int result = spdao.regReply(paramMap);

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
		int result = spdao.delReply(paramMap);

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
			System.out.println("this is imageUrl2:"+imageUrl);
			try {

/*				// Serv_DTO 객체 만들기
				Serv_DTO serv_dto = new Serv_DTO(chk_rcdno, imageUrl, originalFilename,
						storedFileName, originalFileBytes, new Integer(999999),
						"serv_target_age column : not used anymore", "storedid", "N", created_date);
*/
				// 파일 서버에 저장
				multipartFile.transferTo(new File(uploadFullPath)); // 파일저장 실제로는 service에서 처리
				/*// Serv_DTO 객체를 service_info DataBase에 INSERT 해준다.
				int insert_result_serv_table = medicaldao.insert_serv_DTO_ByObj(serv_dto);
*/
				
				String callback = request.getParameter("CKEditorFuncNum");
				System.out.println("this is call Back:"+callback);
				printWriter = response.getWriter();
				String fileUrl = imageUrl;// url경로
				System.out.println("this is fileUrl :"+fileUrl);
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
