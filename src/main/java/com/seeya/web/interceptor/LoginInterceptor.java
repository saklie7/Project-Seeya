package com.seeya.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.seeya.member.model.Member;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
			throws Exception {
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("member");
		
		if(member == null) {
			String url = session.getServletContext().getContextPath()+"/login";
			res.sendRedirect(url);
			return false;
		}
		return true;
	}
	
}
