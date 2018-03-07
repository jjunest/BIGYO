package com.innovest.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.innovest.dao.SPDao;
import com.innovest.dto.userDTO;

@Component
public class AuthenticationSuccessHandlerImpl implements AuthenticationSuccessHandler {

	SPDao spdao;
	
	public SPDao getSpdao() {
		return spdao;
	}

	public void setSpdao(SPDao spdao) {
		this.spdao = spdao;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub

		String user_email_id= ((User)authentication.getPrincipal()).getUsername();
		// 로그인 성공시에 해야 할 일들.. Database에서 name을 비교해서 LoginUserInfo 정보를 session에 저장해 준다.
		System.out.println("this is login success process and user_email_id:"+user_email_id);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("user_email_id",user_email_id);
		userDTO loginUserInfo = spdao.get_userDTO(param);

		request.getSession().setAttribute("loginUserInfo", loginUserInfo);
		// 로그인 성공 시에, 이전 페이지로 돌아가는 코드이다.
		HttpSession session = request.getSession();
		if (session != null) {
			String redirectUrl = (String) session.getAttribute("prevPage");
			if (redirectUrl != null) {
				session.removeAttribute("prevPage");
				response.sendRedirect(redirectUrl);
			} else {
				response.sendRedirect("main");
			}
		} else {
			response.sendRedirect("main");
		}

	}

}
