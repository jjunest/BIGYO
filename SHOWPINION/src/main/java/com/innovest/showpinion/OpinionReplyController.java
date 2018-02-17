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
public class OpinionReplyController {
	@Autowired
	SPDao spdao;
	@Autowired
	Reply_Dao reply_dao;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	private static final Logger logger = LoggerFactory.getLogger(OpinionReplyController.class);

	// AJAX 토론주제_댓글 저장하기
	@RequestMapping(value = "/opinion_reply_save", method = RequestMethod.POST)
	@ResponseBody
	public Object opinion_reply_save(@RequestParam Map<String, Object> paramMap) {
		// ���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();
		// �����Է�
		int result = reply_dao.opinion_reply_save(paramMap);
		if (result > 0) {
			retVal.put("code", "OK");
			retVal.put("message", "정상적으로 글이 등록되었습니다.");
		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "글 등록에 실패하였습니다.");
		}
		return retVal;
	}
	
	
	// 의견에 대한 추천 및 신고 프로세스
		@RequestMapping(value = "/opinion_reply_recommend_process", method = RequestMethod.POST)
		@ResponseBody
		public Object opinion_reply_recommend_process(@RequestParam Map<String, Object> paramMap) {
			// ���ϰ�
			Map<String, Object> retVal = new HashMap<String, Object>();
			// �����Է�

			String recom_type = (String) paramMap.get("recom_type");
			Integer reply_rcdno = Integer.parseInt(((String)paramMap.get("opinion_reply_rcdno")));
			// 추천 및 신고를 누르면 recommend에 기록을 남겨주고
			int opinion_recommend_process_result = reply_dao.opinion_reply_recommend_process(paramMap);
			System.out.println("this is opinion_recommend_process_result:"+opinion_recommend_process_result);
			// 그 후에 replyDTO에 업데이트를 해준다. 몇 개의 추천이 현재 들어가 있는지, 이때 replyRCD를 통해서 그 부분만 업데이트
			// 해준다.
			// 1. 현재 replyrcdno에 있는 추천과 신고 개수를 받는다.
			int thumbup_total = reply_dao.counting_thumbup_opinionReply(reply_rcdno);
			System.out.println("this is thumbup_total:"+thumbup_total);
			int warning_total = reply_dao.counting_thumbup_opinionReply(reply_rcdno);
			System.out.println("this is warning_total:"+warning_total);
			// 2. 그 후 replyRCDno에 있는 thumbupTotal과 warningTotal을 업데이트 해준다.

			Map<String, Object> update_param = new HashMap<String, Object>();
			System.out.println("this is reply_rcdno:"+reply_rcdno);

			update_param.put("thumbup_total",thumbup_total);
			update_param.put("warning_total",warning_total);
			update_param.put("reply_rcdno",reply_rcdno);
			int update_result = reply_dao.update_opinionReply_recommend(update_param);

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

}
