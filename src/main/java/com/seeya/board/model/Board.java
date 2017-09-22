package com.seeya.board.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {
	
	private long bno;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	private long hitCnt;
}
