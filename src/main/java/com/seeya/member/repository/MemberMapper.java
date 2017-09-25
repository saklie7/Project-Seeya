package com.seeya.member.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.seeya.member.model.Member;

@Mapper
public interface MemberMapper {

	@Insert("insert into member values (#{memberid}, #{password}, #{membername})")
	public int insert(Member member);

	@Update("update member set password=#{password}, membername=#{membername} where memberid=#{memberid}")
	public int update(Member member);

	@Delete("delete from member where memberid=#{memberid}")
	public int delete(String memberid);

	@Select("select count(*) from member")
	public int count();

	@Select("select * from member order by memberid asc")
	@ResultType(Member.class)
	public List<Member> selectAll();

	@Select("select * from member where memberid=#{memberid}")
	@Results(id="memberResultMap", value= {
			@Result(property="memberid", column="memberid"),
			@Result(property="password", column="password") })
	public Member selectByMemberId(String memberid);

}
