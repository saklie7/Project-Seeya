package com.seeya.web.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seeya.board.model.Board;
import com.seeya.board.repository.BoardMapper;
import com.seeya.member.model.Member;

@Controller("/boards")
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;
	
	@ModelAttribute("active")
	public String active(){
		return "board";
	}
	
	@GetMapping()
	public ModelAndView getBoardList() {
		ModelAndView mav = new ModelAndView("board_list");
		mav.addObject("boards", boardMapper.getBoardListAll());
		return mav;
	}
	
	@GetMapping("/write")
	public String getBoardWrite(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			return "redirect:/login";
		}
		model.addAttribute("member", member);
		return "board_write";
	}
	
	@PostMapping("/write")
	public String postBoardWrite(Board board, HttpSession session) {
		System.out.println(board);
		Member member = (Member) session.getAttribute("member");
		
		if(member != null && board != null) {
			if(member.getMemberid().equals(board.getWriter())) {
				boardMapper.insertBoard(board);
			}
		}
		return "redirect:/boards";
	}
	
	@GetMapping("/view")
	public String getBoardView() {
		return "board_view";
	}
}
