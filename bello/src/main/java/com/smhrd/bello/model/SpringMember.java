package com.smhrd.bello.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor 
@AllArgsConstructor
@Setter 
@Getter 
public class SpringMember {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String doorbell_num;
	private String sessionDoorbellnum;
	
	
	public SpringMember(String user_id, String user_pw, String user_name, String doorbell_num) {
		this.user_id=user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.doorbell_num=doorbell_num;
	}
	public SpringMember(String user_id) {
		this.user_id=user_id;
		
	}

	public SpringMember(String user_id, String user_pw, String sessionDoorbellnum) {
		this.user_id=user_id;
		this.user_pw = user_pw;
		this.sessionDoorbellnum=sessionDoorbellnum;
	}
	}

