package com.seeya.board.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.seeya.board.model.Board;

@Mapper
public interface BoardMapper {

	@Select("SELECT * FROM board ORDER BY bno DESC")
	public List<Board> getBoardListAll();
	
	@Insert("INSERT INTO BOARD(WRITER,TITLE,CONTENT) VALUES(#{writer}, #{title}, #{content})")
	public int insertBoard(Board board);
	
	@Select("select * from board where bno=#{bno}")
	public Board selectByBno(long bno);
	
	@Update("update board set title=#{title}, content=#{content}, reg_date=sysdate where bno=#{bno}")
	public int updateBoard(Board board);
	
	@Update("UPDATE board SET hit_cnt=hit_cnt+1 WHERE bno=#{bno}")
	public int incrementCnt(long bno);
	
}
