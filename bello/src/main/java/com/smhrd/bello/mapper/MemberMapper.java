package com.smhrd.bello.mapper;



import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.bello.model.SpringMember;

@Mapper
public interface MemberMapper {

	public int join(SpringMember m) ;
	
	public SpringMember login(SpringMember m);

	@Select("SELECT * FROM user_info WHERE user_id=#{user_id}") 
	public SpringMember idChk(String user_id);
	
	@Select("SELECT * FROM product_info WHERE doorbell_num=#{doorbell_num}")
	public SpringMember skChk(String doorbell_num);
	
	@Update("update product_info set using_yn='Y' where doorbell_num=#{doorbell_num}")
	public int updateUsingYn(SpringMember m);
	
	@Select("SELECT doorbell_num from user_info WHERE user_id=#{user_id}")
	public String sessionDoorbellNum(String doorbell_num);
}
