package com.innovest.showpinion;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joda.time.DateTimeConstants;
import org.joda.time.LocalDate;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.innovest.dao.Reply_Dao;
import com.innovest.dto.opinion_DTO;
import com.innovest.dto.opinion_withReply_DTO;
import com.innovest.dto.tvTopicReply_DTO;
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
	Reply_Dao topic_reply_dao;

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
	
	@RequestMapping("/introduce")
	public String introduce(Model model) {
		System.out.println("this is introduce");

		return "introduce";
	}
	

	@RequestMapping("/login_custom")
	public String login_custom(Model model, HttpServletRequest request) {
		System.out.println("this is login_custom");

		// 로그인 성공 후 이전페이지로 이동하기 위한 설정..
		String referrer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referrer);

		return "login_custom";
	}

	@RequestMapping("/thisWeekTopics")
	public String thisWeekTopics(Model model, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is thisWeekTopics");
		// JODA 캘린더 라이브러리로 구함. 이번주 월요일 및 일요일 날짜를 구하고, 일주일 치 TV토론 주제를 구한다. 
		LocalDate now = new LocalDate();
		LocalDate thisweekMonday_joda = now.withDayOfWeek(DateTimeConstants.MONDAY);
		Date thisweekMonday_date = thisweekMonday_joda.toDateTimeAtStartOfDay().toDate();
		LocalDate thisweekSunday_joda = now.withDayOfWeek(DateTimeConstants.SUNDAY);
		Date thisweekSunday_date = thisweekSunday_joda.toDateTimeAtStartOfDay().toDate();
		LocalDate thisweekSunday_joda_forTimestamp = thisweekSunday_joda.plusDays(1);
		Date thisweekSunday_date_forTimeStamp = thisweekSunday_joda_forTimestamp.toDateTimeAtStartOfDay().toDate();
		
		// 쇼피니언 지수를 구하기 위해서 주제를 뽑고, 찬성 반대 지수 수치를 넘겨준다.
		HashMap<String, Object> topicMap = new HashMap<String, Object>();
		topicMap.put("topic_type", "tvshow");
		topicMap.put("thisweekMonday",thisweekMonday_date);
		System.out.println("this is topicMap:"+topicMap.get("thisweekMonday"));
		topicMap.put("thisweekSunday",thisweekSunday_date);
		List<tvTopic_DTO> result_tvshow_list = spdao.tvshowtopic_select_thisweek(topicMap);
		model.addAttribute("result_list_thisweek_tvtopics", result_tvshow_list);
		
		
		// 이번주 월요일 및 일요일 날짜를 구하고, 일주일 치 쇼피니언 주제를 구한다.
		topicMap.put("topic_type", "normal");
		
		//일반 주제일때는 작성일자 type 이 TimeStamp이니, +1일을 해서 맞춰준다. 
		topicMap.put("thisweekSunday",thisweekSunday_date_forTimeStamp);
		List<tvTopic_DTO> result_normal_list = spdao.normaltopic_select_thisweek(topicMap);
		model.addAttribute("result_list_thisweek_normaltopics", result_normal_list);
		
		return "thisWeekTopics";
	}

	@RequestMapping("/all_TVshow_Topics")
	public String all_TVshow_Topics(Model model) {
		System.out.println("this is all_TVshow_Topics");
		// 모든 TV토론 쇼 주제르 구한다. 
		HashMap<String, Object> topicMap = new HashMap<String, Object>();
		topicMap.put("topic_type", "tvshow");
		List<tvTopic_DTO> result_list = spdao.selectAll_TVshow_TopicDTO(topicMap);
		model.addAttribute("result_list_tvtopics", result_list);

/*		// 쇼피니언 지수를 구하기 위해서 주제를 뽑고, 찬성 반대 지수 수치를 넘겨준다.
		HashMap<String, Object> sqlParameterHashMap = new HashMap<String, Object>();
		// 쇼피니언 의견 모두 LIST로 뽑기
		sqlParameterHashMap.put("opinion_type", "show");
		List<opinion_withReply_DTO> opinions_list_show = spdao
				.selectAll_opinion_show(sqlParameterHashMap);
		model.addAttribute("opinions_list_show", opinions_list_show);
		// 쇼피니언 지수 구하기 위한 찬성, 반대 개수 구하기
		int showpinion_graph_pro_total = 0;
		int showpinion_graph_con_total = 0;
		for (int i = 0; i < opinions_list_show.size(); i++) {
			if (opinions_list_show.get(i).getSp_opinion_side().equals("pro")) {
				showpinion_graph_pro_total++;
			} else if (opinions_list_show.get(i).getSp_opinion_side().equals("con")) {
				showpinion_graph_con_total++;
			}
		}
		model.addAttribute("showpinion_graph_pro_total", showpinion_graph_pro_total);
		model.addAttribute("showpinion_graph_con_total", showpinion_graph_con_total);*/

		return "all_TVshow_Topics";
	}

	@RequestMapping("/all_Showpinion_Topics")
	public String all_Showpinion_Topics(Model model) {
		System.out.println("this is all_Showpinion_Topics");
		HashMap<String, Object> topicMap = new HashMap<String, Object>();
		topicMap.put("topic_type", "normal");
		List<tvTopic_DTO> result_list = spdao.selectAll_TVshow_TopicDTO(topicMap);
		model.addAttribute("result_list_normaltopics", result_list);

/*		// 쇼피니언 지수를 구하기 위해서 주제를 뽑고, 찬성 반대 지수 수치를 넘겨준다.
		HashMap<String, Object> sqlParameterHashMap = new HashMap<String, Object>();
		// 쇼피니언 의견 모두 LIST로 뽑기
		sqlParameterHashMap.put("opinion_type", "show");
		List<opinion_withReply_DTO> opinions_list_show = spdao
				.selectAll_opinion_show(sqlParameterHashMap);
		model.addAttribute("opinions_list_show", opinions_list_show);
		// 쇼피니언 지수 구하기 위한 찬성, 반대 개수 구하기
		int showpinion_graph_pro_total = 0;
		int showpinion_graph_con_total = 0;
		for (int i = 0; i < opinions_list_show.size(); i++) {
			if (opinions_list_show.get(i).getSp_opinion_side().equals("pro")) {
				showpinion_graph_pro_total++;
			} else if (opinions_list_show.get(i).getSp_opinion_side().equals("con")) {
				showpinion_graph_con_total++;
			}
		}
		model.addAttribute("showpinion_graph_pro_total", showpinion_graph_pro_total);
		model.addAttribute("showpinion_graph_con_total", showpinion_graph_con_total);*/

		return "all_Showpinion_Topics";
	}

	@RequestMapping("/masonryportfolio3")
	public String masonryportfolio3(Model model) {
		System.out.println("this is masonry-portfolio-3");

		return "masonry-portfolio-3";
	}
	@RequestMapping("/topicpage_isDeleted")
	public String topicpage_isDeleted(Model model) {
		System.out.println("this is topicpage_isDeleted");

		return "topicpage_isDeleted";
	}
	

	@RequestMapping("/detail_TVshow_Topics")
	public String detail_TVshow_Topics(HttpServletRequest httpServletRequest, Model model,
			HttpSession session) {
		// 토론주제 rcdno르 get파라미터에서 구하자. 
		String topic_rcdno = httpServletRequest.getParameter("topic_rcdno");
		HashMap<String, Object> sqlParameterHashMap = new HashMap<String, Object>();
		sqlParameterHashMap.put("topic_rcdno", topic_rcdno);
		
		//detail_TVShow_Topics를 접근할 때, 이 Topic주제가 삭제 된 것이면 다른 곳으로 이동하게 하자. 
		String ifdeleted = spdao.topic_checkifdeleted(sqlParameterHashMap);
		if(ifdeleted.equals("delete")){
			return "redirect:topicpage_isDeleted";
		}

		// order순서 정하기. sp_order, normal_order, reply_order
		String opinion_order = httpServletRequest.getParameter("opinion_order");
		// 디폴트는 최신순이다.
		if (opinion_order == null || opinion_order.equals("")) {
			opinion_order = "recent";
		}
		if (opinion_order.equals("thumbup")) {
			opinion_order = "sp_opinion_thumbup";
		} else if (opinion_order.equals("recent")) {
			opinion_order = "sp_opinion_datetime";
		}

		System.out.println("this is detail_TVshow_Topics");

		// 조회수 +1 해주기.
		int result = spdao.update_DetailViewNumber(sqlParameterHashMap);
		// tv토픽 주제 DTO를 구하기
		tvTopic_DTO detail_tvTopic = spdao.selectOne_TvTopic(sqlParameterHashMap);
		model.addAttribute("detail_tvTopic", detail_tvTopic);

		// 내가 남긴 의견 모두 리스트로 구하기
		// 만약에 user_rcdno로 넘어온 파라미터값과, session에 존재하고 있는 로그인 rcdno의 값이 다르면, 잘못된 접근페이지로
		// 돌아가야 한다.
		userDTO loginUserInfo = ((userDTO) session.getAttribute("loginUserInfo"));
		if (loginUserInfo == null) {
			model.addAttribute("my_opinions_list", null);
		} else {
			sqlParameterHashMap.put("user_rcdno", loginUserInfo.getRcdno());
			List<opinion_withReply_DTO> my_opinions_list = spdao
					.selectAll_my_opinion(sqlParameterHashMap);
			model.addAttribute("my_opinions_list", my_opinions_list);
		}

		// 쇼피니언 의견 모두 LIST로 뽑기
		sqlParameterHashMap.put("opinion_type", "show");
		sqlParameterHashMap.put("list_order", opinion_order);
		List<opinion_withReply_DTO> opinions_list_show = spdao
				.selectAll_opinion_show(sqlParameterHashMap);
		System.out.println("this is shownumber:"+opinions_list_show.size());
		model.addAttribute("opinions_list_show", opinions_list_show);
		// 쇼피니언 의견 차트 지수 구하기 위한 찬성, 반대 개수 구하기
		int showpinion_graph_pro_total = 0;
		int showpinion_graph_con_total = 0;
		for (int i = 0; i < opinions_list_show.size(); i++) {
			if (opinions_list_show.get(i).getSp_opinion_side().equals("pro")) {
				showpinion_graph_pro_total++;
			} else if (opinions_list_show.get(i).getSp_opinion_side().equals("con")) {
				showpinion_graph_con_total++;
			}
		}
		model.addAttribute("showpinion_graph_pro_total", showpinion_graph_pro_total);
		model.addAttribute("showpinion_graph_con_total", showpinion_graph_con_total);

		// 일반 의견 모두 LIST로 뽑기
		sqlParameterHashMap.put("opinion_type", "normal");
		List<opinion_withReply_DTO> opinions_list_normal = spdao
				.selectAll_opinion_show(sqlParameterHashMap);
		model.addAttribute("opinions_list_normal", opinions_list_normal);

		// 일반 의견 차트 지수 구하기 위한 찬성, 반대 개수 구하기
		int normal_graph_pro_total = 0;
		int normal_graph_con_total = 0;
		for (int i = 0; i < opinions_list_normal.size(); i++) {
			if (opinions_list_normal.get(i).getSp_opinion_side().equals("pro")) {
				normal_graph_pro_total++;
			} else if (opinions_list_normal.get(i).getSp_opinion_side().equals("con")) {
				normal_graph_con_total++;
			}
		}
		model.addAttribute("normal_graph_pro_total", normal_graph_pro_total);
		model.addAttribute("normal_graph_con_total", normal_graph_con_total);

		// 주제_댓글 모두 LIST로 뽑기
		List<tvTopicReply_DTO> topic_reply_list = topic_reply_dao
				.get_All_topic_reply(sqlParameterHashMap);
		model.addAttribute("topic_reply_list", topic_reply_list);

		// 주제_댓글 중 부모인 갯수 구하기
		int topic_reply_total = 0;
		for (int i = 0; i < topic_reply_list.size(); i++) {
			if (topic_reply_list.get(i).getSp_topic_reply_depth() == 0) {
				topic_reply_total++;
			}
			;
		}

		model.addAttribute("topic_reply_total", topic_reply_total);

		return "detail_TVshow_Topics";
	}

	@RequestMapping("/detail_opinion")
	public String detail_opinion(Model model, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is detail_opinion");
		// 글 쓴 날짜는 default로 현재시각으로 저장이 된다.
		opinion_withReply_DTO opinion_withReply_DTO = spdao.selectOpinionDetail(paramMap);
		List<opinion_withReply_DTO> opinion_DTO_list = new ArrayList<opinion_withReply_DTO>();
		opinion_DTO_list.add(opinion_withReply_DTO);
		model.addAttribute("opinion_DTO_list", opinion_DTO_list);
		return "detail_opinion";
	}

	@RequestMapping("/rankings")
	public String rankings(Model model, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is rankings");
		String user_order = "";
		String group_order = "";
		//
		if (paramMap.get("user_order") == null || paramMap.get("user_order").equals("")) {
			user_order = "ranking_thumbup_total";
			paramMap.put("user_order", user_order);
		}
		if (paramMap.get("group_order") == null || paramMap.get("user_order").equals("")) {
			group_order = "ranking_thumbup_total";
			paramMap.put("group_order", group_order);
		}
		// 유저 랭킹 구하기
		List<userDTO> user_ranking_list = spdao.user_ranking_list(paramMap);
		model.addAttribute("user_ranking_list", user_ranking_list);
		// 그룹 랭킹 구하기
		List<userDTO> group_ranking_list = spdao.group_ranking_list(paramMap);
		model.addAttribute("group_ranking_list", group_ranking_list);

		return "rankings";
	}

	@RequestMapping("/errorPage")
	public String errorPage(Model model) {
		System.out.println("this is errorPage");
		return "errorPage";
	}

	@RequestMapping("/edit_userInfo")
	public String edit_userInfo(Model model, @RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		System.out.println("this is edit_userInfo");
		// 만약에 user_rcdno로 넘어온 파라미터값과, session에 존재하고 있는 로그인 rcdno의 값이 다르면, 잘못된 접근페이지로
		// 돌아가야 한다.
		String user_rcdno = (String) paramMap.get("user_rcdno");
		userDTO loginUserInfo = ((userDTO) session.getAttribute("loginUserInfo"));
		if (loginUserInfo == null || !user_rcdno.equals(String.valueOf(loginUserInfo.getRcdno()))) {
			return "redirect:errorPage";
		}

		// session에 있는 userInfo rcdno를 바탕으로 구하자.
		userDTO userInfomation = spdao.get_userDTO_byRcdno(paramMap);
		// userInfo 객체를 받아야 한다..
		model.addAttribute("userInfomation", userInfomation);

		return "edit_userInfo";
	}

	@RequestMapping("/userInfo")
	public String userInfo(Model model, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is userInfo");
		// session에 있는 userInfo rcdno를 바탕으로 구하자.
		userDTO userInfomation = spdao.get_userDTO_byRcdno(paramMap);
		// userInfo 객체를 받아야 한다..
		model.addAttribute("userInfomation", userInfomation);

		// 내가 남긴 의견 모두 리스트로 구하기
		List<opinion_withReply_DTO> opinion_top_five_list = spdao.opinion_top_five(paramMap);
		model.addAttribute("opinion_top_five_list", opinion_top_five_list);

		// 내가 남긴 모든 의견들
		List<opinion_withReply_DTO> my_opinions_list = spdao.selectAll_my_opinion_history(paramMap);
		model.addAttribute("my_opinions_list", my_opinions_list);

		System.out.println("this is userInfomation" + userInfomation.getSns_open());
		return "userInfo";
	}

	// 쇼피니언 의견을 쓰는 페이지
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

	// 쇼피니언 의견 등록 과정
	@RequestMapping(value = "/opinion_insert_process", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject opinion_insert_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		System.out.println("this is opinion_insert_process");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String options_myside = httpServletRequest.getParameter("options_myside");
		String sp_tvtopics_rcdno = httpServletRequest.getParameter("sp_tvtopics_rcdno");
		String sp_tvtopics_title = httpServletRequest.getParameter("sp_tvtopics_title");
		String sp_tvtopics_writer = httpServletRequest.getParameter("sp_tvtopics_writer");
		String type = httpServletRequest.getParameter("type");
		// 이유가 직접입력이면, 직접입력값을
		for (int i = 1; i < 4; i++) {
			String myside_reason = httpServletRequest.getParameter("myside_reason" + i);
			if (myside_reason.equals("1")) {
				String myside_reason_self = httpServletRequest
						.getParameter("myside_reason" + i + "_self");
				paramMap.put("myside_reason" + i, myside_reason_self);
			}
			String opside_reason = httpServletRequest.getParameter("opside_reason" + i);
			if (opside_reason.equals("1")) {
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
		// 데이터 베이스에 입력 후 값을 파라미터를 통해 가져올 수 있다.
		Long sp_opinion_rcdno = (Long) paramMap.get("sp_opinion_rcdno");
		// DBinsert 결과 확인하기
		JSONObject company_jsonlist = new JSONObject();
		if (result == 1) {
			aJaxResult = "success";
			// 명확한 jsonObject로 만들어서 결과값을 보내준다.
			company_jsonlist.put("sp_opinion_rcdno", sp_opinion_rcdno);
		}
		company_jsonlist.put("aJaxResult", aJaxResult);

		// 의견을 입력했으면, user의 쇼피니언 지수에 +1을 해준다.
		int ranking_opinion_update = spdao.ranking_opinion_update(paramMap);

		return company_jsonlist;
	}

	// 쇼피니언 의견 수정 페이지
	@RequestMapping("/opinion_update")
	public String opinion_update(HttpServletRequest httpServletRequest, Model model,
			@RequestParam Map<String, Object> paramMap, HttpSession session) {
		System.out.println("this is opinion_update");

		// 만약에 user_rcdno로 넘어온 파라미터값과, session에 존재하고 있는 로그인 rcdno의 값이 다르면, 잘못된 접근페이지로
		// 돌아가야 한다.
		String user_rcdno = (String) paramMap.get("user_rcdno");
		userDTO loginUserInfo = ((userDTO) session.getAttribute("loginUserInfo"));
		if (loginUserInfo == null || !user_rcdno.equals(String.valueOf(loginUserInfo.getRcdno()))) {
			return "redirect:errorPage";
		}

		opinion_withReply_DTO opinion_DTO = spdao.selectOpinionDetail(paramMap);
		model.addAttribute("opinion_DTO", opinion_DTO);

		// 이유 근거 선택을 위해서 topic rcdno를 활용해서 topic정보도 같이 불러온다.
		Integer topic_rcdno = opinion_DTO.getSp_opinion_topicrcdno();
		paramMap.put("topic_rcdno", topic_rcdno);

		tvTopic_DTO detail_tvTopic = spdao.selectOne_TvTopic(paramMap);
		model.addAttribute("detail_tvTopic", detail_tvTopic);

		return "opinion_update";
	}

	// 쇼피니언 의견 수정 과정
	@RequestMapping("/opinion_update_process")
	@ResponseBody
	public String opinion_update_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		System.out.println("this is opinion_update_process");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String options_myside = httpServletRequest.getParameter("options_myside");
		// 이유가 직접입력이면, 직접입력값을
		for (int i = 1; i < 4; i++) {
			String myside_reason = httpServletRequest.getParameter("myside_reason" + i);
			if (myside_reason.equals("1")) {
				String myside_reason_self = httpServletRequest
						.getParameter("myside_reason" + i + "_self");
				paramMap.put("myside_reason" + i, myside_reason_self);
			}
			String opside_reason = httpServletRequest.getParameter("opside_reason" + i);
			if (opside_reason.equals("1")) {
				String opside_reason_self = httpServletRequest
						.getParameter("opside_reason" + i + "_self");
				paramMap.put("opside_reason" + i, opside_reason_self);
			}

		}

		// 추가적으로 paramMap에서 알아야할 정보들, writer아이디,이미지 이름, 이미지 url,

		int result = spdao.opinion_update(paramMap);
		System.out.println("this is result" + paramMap.get("opinion_rcdno"));
		if (result == 0) {
			// 새로운 user database 삽입 실패시
			return "fail";
		} else if (result == 1) {
			return "success";
		}
		return "fail";
	}

	// 쇼피니언 의견 삭제 과정
	@RequestMapping("/opinion_delete_process")
	@ResponseBody
	public String opinion_delete_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		System.out.println("this is opinion_delete_process");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 추가적으로 paramMap에서 알아야할 정보들, writer아이디,이미지 이름, 이미지 url,

		int result = spdao.opinion_delete(paramMap);
		if (result == 0) {
			// 새로운 user database 삽입 실패시
			return "fail";
		} else if (result == 1) {
			return "success";
		}
		return "fail";
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
		paramMap.put("realname", httpServletRequest.getParameter("signup_realname"));
		paramMap.put("nickname", httpServletRequest.getParameter("signup_nickname"));
		paramMap.put("openname", httpServletRequest.getParameter("open_name"));
		paramMap.put("groupname", httpServletRequest.getParameter("signup_group"));
		if (httpServletRequest.getParameter("signup_group_open") == null) {
			paramMap.put("groupname_open", "off");
		} else {
			paramMap.put("groupname_open", httpServletRequest.getParameter("signup_group_open"));
		}
		paramMap.put("sns", httpServletRequest.getParameter("signup_sns"));
		if (httpServletRequest.getParameter("sns_open") == null) {
			paramMap.put("sns_open", "off");
		} else {
			paramMap.put("sns_open", httpServletRequest.getParameter("off"));
		}

		int insert_result = spdao.insert_user_ByMap(paramMap);
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

	@RequestMapping("/edit_userInfo_process")
	@ResponseBody
	public String edit_userInfo_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap,
			@RequestParam(required = false) MultipartFile user_img, HttpSession session) {
		System.out.println("this is edit_process");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String password = (String) paramMap.get("edit_password");
		// 비밀번호 인코딩해서 저장하기
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password.trim());
		paramMap.put("edit_password", hashedPassword);

		// profile_img사진 서버에 저장하고, 필요한 정보, originalname, url, byte 정보들 paramMap에 입력하기.
		String originalFilename = (String) paramMap.get("picOriname");
		Integer originalFileBytes = Integer.parseInt((String) paramMap.get("picByte"));
		String storedFileName = (String) paramMap.get("picOriname");
		String imageUrl = (String) paramMap.get("picUrl");
		if (user_img == null) {
			// 만약에 tv쇼 이미지 파일이 없다면 이미지 저장하기 작업을 안해도 된다.

		} else {
			// 1. TVSHOW 프로그램 포스터 이미지 저장하기 작업
			MultipartFile multipartFile = user_img;
			// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
			String randId = UUID.randomUUID().toString();
			originalFilename = multipartFile.getOriginalFilename(); // 파일명
			// 만약 파일이 없으면, DB에 넣지 않아도 된다.
			if (originalFilename.equals("")) {

			} else {
				originalFileBytes = new Integer((int) multipartFile.getSize());
				storedFileName = randId + "." + getExtension(originalFilename);
				String uploadResourcesPath = session.getServletContext()
						.getRealPath("/resources/img_userProfile/");
				// 로컬에서 돌아가는 업로드 경로
				String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
				// 서버에서 돌아가는 업로드 경로
				// String uploadFullPath = uploadResourcesPath + storedFileName;
				imageUrl = "resources/img_userProfile/" + storedFileName;
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
		// 추가적으로 paramMap에서 알아야할 정보들, writer아이디,이미지 이름, 이미지 url,
		paramMap.put("originFileName", originalFilename);
		paramMap.put("originalFileBytes", originalFileBytes);
		paramMap.put("imageUrl", imageUrl);

		int result = spdao.update_userProfile_byMap(paramMap);
		if (result == 0) {
			// 새로운 user database 삽입 실패시
			return "fail";
		} else if (result == 1) {
			return "success";
		}
		return "fail";
	}

	@RequestMapping("/admin")
	public String admin(Model model) {
		System.out.println("this is admin");
		return "redirect:admin_insert_TVTopic";
	}

	@RequestMapping("/admin_insert_TVTopic")
	public String admin_insert_TVTopic(Model model, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is admin_insert_TVTopic");
		return "admin_insert_TVTopic";
	}
	
	@RequestMapping("/admin_insert_normalTopic")
	public String admin_insert_normalTopic(Model model, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is admin_insert_normalTopic");
		return "admin_insert_normalTopic";
	}

	
	

	@RequestMapping("/admin_edit_TVTopic")
	public String admin_edit_TVTopic(Model model, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is admin_edit_TVTopic");

		// tv토픽 주제 DTO를 구하기
		tvTopic_DTO detail_tvTopic = spdao.selectOne_TvTopic(paramMap);
		model.addAttribute("detail_tvTopic", detail_tvTopic);

		return "admin_edit_TVTopic";
	}

	@RequestMapping("/tvshowtopic_edit_process")
	@ResponseBody
	public String tvshowtopic_edit_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap,
			@RequestParam(required = false) MultipartFile tvtopic_tvshow_img, HttpSession session) {
		System.out.println("this is tvshowtopic_edit_process");
		String aJaxResult = "fail";
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// img사진 서버에 저장하고, 필요한 정보, originalname, url, byte 정보들 paramMap에 입력하기.
		String originalFilename = (String) paramMap.get("picOriname");
		Integer originalFileBytes = Integer.parseInt((String) paramMap.get("picByte"));
		String storedFileName = (String) paramMap.get("picOriname");
		String imageUrl = (String) paramMap.get("picUrl");
		if (tvtopic_tvshow_img == null) {
			// 만약에 tv쇼 이미지 파일이 없다면 이미지 저장하기 작업을 안해도 된다.

		} else {
			// 1. TVSHOW 프로그램 포스터 이미지 저장하기 작업
			MultipartFile multipartFile = tvtopic_tvshow_img;
			// 파일 이름 유일하게 만들기 및 저장 전에 필요한 정보들 얻어오기
			String randId = UUID.randomUUID().toString();
			originalFilename = multipartFile.getOriginalFilename(); // 파일명
			// 만약 파일이 없으면, DB에 넣지 않아도 된다.
			if (originalFilename.equals("")) {

			} else {
				originalFileBytes = new Integer((int) multipartFile.getSize());
				storedFileName = randId + "." + getExtension(originalFilename);
				String uploadResourcesPath = session.getServletContext()
						.getRealPath("/resources/img_userProfile/");
				// 로컬에서 돌아가는 업로드 경로
				String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
				// 서버에서 돌아가는 업로드 경로
				// String uploadFullPath = uploadResourcesPath + storedFileName;
				imageUrl = "resources/img_userProfile/" + storedFileName;
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
		// 추가적으로 paramMap에서 알아야할 정보들, writer아이디,이미지 이름, 이미지 url,
		paramMap.put("originFileName", originalFilename);
		paramMap.put("originalFileBytes", originalFileBytes);
		paramMap.put("imageUrl", imageUrl);

		int result = spdao.update_tvtopicInfo_byMap(paramMap);
		if (result == 0) {
			// 새로운 user database 삽입 실패시
			return "fail";
		} else if (result == 1) {
			return "success";
		}
		return "fail";
	}

	@RequestMapping(value = "/tvtopic_delete_process", method = RequestMethod.POST)
	@ResponseBody
	public String tvtopic_delete_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap) {
		System.out.println("this is tvtopic_delete_process");
		String aJaxResult = "fail";

		// 글 쓴 날짜는 default로 현재시각으로 저장이 된다.
		int result = spdao.deleteTVShowTopic(paramMap);

		// DBinsert 결과 확인하기
		if (result == 1) {
			aJaxResult = "success";
		}
		return aJaxResult;
	}

	@RequestMapping(value = "/tvshowtopic_insert_process", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject tvshowtopic_insert_process(Locale locale, Model model,
			HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> paramMap,
			@RequestParam(required = false) MultipartFile tvtopic_tvshow_img, HttpSession session) {
		System.out.println("this is tvshowtopic_insert_process");
		String aJaxResult = "fail";
		String originalFilename = "";
		Integer originalFileBytes = 0;
		String storedFileName = "";
		String imageUrl = "";
		System.out.println("this is content:"+ paramMap.get("tvtopic_desc_content"));
		try {
			httpServletRequest.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 스탭 1. TV 프로그램 이미지 파일 삽입.
		if (tvtopic_tvshow_img == null) {
			// 만약에 tv쇼 이미지 파일이 없다면, default 값을 저장하자.

			imageUrl = "resources/img/default_imgs/default_tvshow_img.png";
			originalFilename = "default_tvshow_img.png";
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
				String uploadFullPath = uploadResourcesPath + "\\" + storedFileName;
				// 서버에서 돌아가는 업로드 경로
				// String uploadFullPath = uploadResourcesPath + storedFileName;
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

		String date = httpServletRequest.getParameter("tvtopic_tvshow_date");
		if (httpServletRequest.getParameter("tvtopic_tvshow_date") == null
				|| httpServletRequest.getParameter("tvtopic_tvshow_date").equals("")) {
			String tvtopic_tvshow_date = "0000-01-01";
			paramMap.put("tvtopic_tvshow_date", tvtopic_tvshow_date);
		}
		// 추가적으로 paramMap에서 알아야할 정보들, writer아이디,이미지 이름, 이미지 url,
		paramMap.put("originFileName", originalFilename);
		paramMap.put("originalFileBytes", originalFileBytes);
		paramMap.put("imageUrl", imageUrl);

		// 글 쓴 날짜는 default로 현재시각으로 저장이 된다.
		int result = spdao.insertTVShowTopic(paramMap);
		// 데이터 베이스에 입력 후 값을 파라미터를 통해 가져올 수 있다.
		Long sp_tvtopics_rcdno = (Long) paramMap.get("sp_tvtopics_rcdno");
		JSONObject company_jsonlist = new JSONObject();
		if (result == 1) {
			aJaxResult = "success";
			// 명확한 jsonObject로 만들어서 결과값을 보내준다.
			company_jsonlist.put("sp_tvtopics_rcdno", sp_tvtopics_rcdno);
		}
		company_jsonlist.put("aJaxResult", aJaxResult);

		return company_jsonlist;
	}

	// 의견에 대한 추천 및 신고 프로세스
	@RequestMapping(value = "/opinion_recommend_process", method = RequestMethod.POST)
	@ResponseBody
	public Object opinion_recommend_process(@RequestParam Map<String, Object> paramMap) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		String recom_type = (String) paramMap.get("recom_type");
		Integer opinion_rcdno = Integer.parseInt(((String) paramMap.get("opinion_rcdno")));
		// 기존에 사용자가 해당 의견에 추천을 했는지 체크해준다.
		int already_recom = spdao.opinion_recommend_already(paramMap);
		if (already_recom != 0) {
			// 만약 이미 등록이 되어 있다면...
			retVal.put("code", "FAIL");
			retVal.put("message", "중복 추천이나 중복 신고입니다.");
			return retVal;
		}

		// 추천 및 신고를 누르면 recommend에 기록을 남겨주고
		int recom_result = spdao.opinion_recommend_process(paramMap);
		System.out.println("this is opinion_recommend_process:" + recom_result);
		// 그 후에 replyDTO에 업데이트를 해준다. 몇 개의 추천이 현재 들어가 있는지, 이때 replyRCD를 통해서 그 부분만 업데이트
		// 해준다.
		// 1. 현재 replyrcdno에 있는 추천과 신고 개수를 받는다.
		int thumbup_total = spdao.counting_thumbup_opinion(opinion_rcdno);
		System.out.println("this is thumbup_total:" + thumbup_total);
		int warning_total = spdao.counting_warning_opinion(opinion_rcdno);
		System.out.println("this is warning_total:" + warning_total);
		// 2. 그 후 replyRCDno에 있는 thumbupTotal과 warningTotal을 업데이트 해준다.
		paramMap.put("thumbup_total", thumbup_total);
		paramMap.put("warning_total", warning_total);
		paramMap.put("opinion_rcdno", opinion_rcdno);
		int update_result = spdao.update_opinion_recommend(paramMap);

		if (update_result > 0) {
			retVal.put("code", "OK");
			if (recom_type.equals("thumbup")) {
				retVal.put("message", "정상적으로 추천되었습니다 ");
			} else if (recom_type.equals("warning")) {
				retVal.put("message", "정상적으로 신고되었습니다 ");
			}

		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "실패하였습니다.");
		}
		if (recom_type.equals("thumbup")) {
			// 추천을 했으면, 추천받은 사람이 누구인지 구하자
			int opinion_writer = spdao.opinion_select_writer(paramMap);
			paramMap.put("opinion_writer", opinion_writer);
			// 의견 추천 했으면, 받은 의견을 가진 사람에게, user의 쇼피니언 지수에 +1을 해준다.
			int ranking_update = spdao.ranking_thumbup_update(paramMap);
		}

		return retVal;
	}

	// 의견에 대한 추천 및 신고 프로세스
	@RequestMapping(value = "/ranking_popular_process", method = RequestMethod.POST)
	@ResponseBody
	public Object ranking_popular_process(@RequestParam Map<String, Object> paramMap) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		// 기존에 사용자가 해당 의견에 추천을 했는지 체크해준다.
		int already_recom = spdao.ranking_popular_already(paramMap);
		if (already_recom != 0) {
			// 만약 이미 등록이 되어 있다면...
			retVal.put("code", "FAIL");
			retVal.put("message", "이미 인기지수로 추천하셨습니다");
			return retVal;
		}

		// 추천 및 신고를 누르면 recommend에 기록을 남겨준다.
		int recom_result = spdao.ranking_popular_process(paramMap);
		System.out.println("this is opinion_recommend_process:" + recom_result);
		// 그 후에 user 테이블에가서 total popular 를 업데이트해준다.
		int update_result = spdao.ranking_popular_update_userInfo(paramMap);

		if (update_result > 0) {
			retVal.put("code", "OK");
			retVal.put("message", "정상적으로 인기 추천되었습니다 ");

		} else {
			retVal.put("code", "FAIL");
			retVal.put("message", "인기추천에 실패하였습니다.");
		}

		return retVal;
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
