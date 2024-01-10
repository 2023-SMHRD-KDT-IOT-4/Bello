package com.smhrd.bello.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor //기본생성자생성
@AllArgsConstructor // 아규먼트 다들어간(필드 다 들어간 필드초기화하는) 생성자 생성
@Setter //세터생성
@Getter //게터생성
public class SpringMember {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String doorbell_num;
	
	
	public SpringMember(String user_id, String user_pw, String doorbell_num) {
		this.user_id=user_id;
		this.user_pw = user_pw;
		this.doorbell_num=doorbell_num;
	}
	public SpringMember(String user_id) {
		this.user_id=user_id;
		
	}
//	public SpringMember(String user_id, String user_pw, String doorbell_num) {
//		this.user_id=user_id;
//		this.user_pw=user_pw;
//		this.doorbell_num=doorbell_num;
//		
//	}
}
