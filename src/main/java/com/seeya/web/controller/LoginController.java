package com.seeya.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seeya.login.model.Login;
import com.seeya.login.service.LoginService;
import com.seeya.member.model.Member;
import com.seeya.member.repository.MemberMapper;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping("/login")
	public String getLoginView() {
		return "login";
	}

	@PostMapping("/login")
	public String getMemberLogin(Login login, Model model, HttpSession session) {
		System.out.println(login);
		loginService.checkMemeberLogin(login);
		
		if(login.getError() != null) {
			model.addAttribute("error", login.getError());
			model.addAttribute("login", login);
			return "redirect:/boards";
		} else {
			Member member = memberMapper.selectByMemberId(login.getMemberid());
			session.setAttribute("member", member);
			return "redirect:/boards";
		}
	}
	
	@GetMapping("/logout")
	public String getMemberLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
}
