package com.smhrd.bello.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.bello.model.SpringMember;

@Mapper
public interface MemberMapper {
	// 인터페이스이기때문에 바디가 없는 추상메서드로 정의함
	//회원가입
	public int join(SpringMember m) ;
	//로그인
	public SpringMember login(SpringMember m);
	//회원정보수정
	public int update(SpringMember m); // 스프링멤버타입의 객체가 넘어온다
	//전체회원정보
	public List<SpringMember> memberList();
	//회원삭제
	@Delete("delete from springmember where user_id=#{user_id}")
	public int delete(String user_id); // 마이바티스에 sql문 같이적는방법
	
	@Select("SELECT * FROM user_info WHERE user_id=#{user_id}")//회원가입 중복체크
	public SpringMember idChk(String user_id);
	
	@Select("SELECT * FROM product_info WHERE product_num=#{product_num}")
	public SpringMember skChk(String product_num);
}
