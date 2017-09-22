package com.seeya.board.repository;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.seeya.board.model.Board;

@Mapper
public interface BoardMapper {

	@Select("SELECT * FROM board ORDER BY bno DESC")
	public List<Board> getBoardListAll();
}
