package com.seeya.web.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seeya.member.model.Member;
import com.seeya.member.repository.MemberMapper;


@Controller
public class MemberController {
	
	@Autowired
	MemberMapper memberMapper;

	@ModelAttribute("active")
	public String Active() {
		return "member";
	}
	
	@GetMapping("/member")
	public String getProfileView(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			return "redirect:login";
		}
		
		return "member_view";
	}
	
	@GetMapping("/delete")
	public String deleteMember(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		memberMapper.delete(member.getMemberid());
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public String join() {
		return "member_join";
	}
	
	@GetMapping("/edit")
	public String memberEdit(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			return "redirect:/";
		}
		return "member_edit";
	}
	
	@PostMapping("/edit")
	public ModelAndView postMemberEdit(Member member) {
		System.out.println(member);
		ModelAndView mav = new ModelAndView("member_view");
		memberMapper.update(member);
		return mav;
	}
}
