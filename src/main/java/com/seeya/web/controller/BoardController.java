package com.seeya.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seeya.board.model.Board;
import com.seeya.board.repository.BoardMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping("/boards")
	private String getBoardListView() {
		return "board_list";
	}
	
	@RequestMapping("/boards/list")
	private List<Board> getBoardList() {
		List<Board> boards = boardMapper.getBoardListAll();
		return boards;
	}
}
