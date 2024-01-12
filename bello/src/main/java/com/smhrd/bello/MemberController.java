package com.smhrd.bello;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.smhrd.bello.mapper.MemberMapper;
import com.smhrd.bello.model.SpringMember;

@Controller
public class MemberController {

	@Autowired //의존성 주입
	private MemberMapper mapper;
	
	//localhost:8083/myapp/member/join.do
	@RequestMapping(value="/member/join.do", method=RequestMethod.POST)
	public String join(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw, @RequestParam("user_name") String user_name, @RequestParam("doorbell_num") String doorbell_num) {   // 리퀘스트파람 이메일을 받은걸 스트링 이메일 변수에 넣을꺼야
		//System.out.println(email+","+pw+","+tel+","+address);
	
	SpringMember existingMember = mapper.idChk(user_id);
	SpringMember existingSkey = mapper.skChk(doorbell_num);
System.out.println(existingSkey);


    if (existingMember != null || existingSkey == null) {
        // 이미 존재하는 ID입력하거나, 유효하지 않은 씨리얼키 사용 시, 가입 실패
        return "redirect:/?joinResult=fail1";
    } else {

    SpringMember member = new SpringMember(user_id, user_pw, user_name, doorbell_num);
	
	//1. controller : 요청 파라미터 받기
	//2. : mybatis 사용방법
	//		1) DAO(DataAccessObject) + mapper.xml(SQL문 만 작성)
	//		2) mapper interface + mapper.xml
	//		3) mapper interface + Annotation ex) @Select
	
	int res = mapper.join(member);
	
	//인코딩: 한글 ->  UTF-8
	//디코딩: UTF-8 -> 한글
	String encodedEmail = null;
	try {
		encodedEmail= URLEncoder.encode(user_id, "UTF-8");
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	
	if(res>0) {//회원가입 성공
		//조인석세스로 
		//localhost:8083/myapp/success?email=사용자가 입력한 이메일로 클라이언트가 재요청(redirecting) , ?은 키값입력하려고
		//return "redirect:/success?email="+encodedEmail;
		int resU = mapper.updateUsingYn(member);
        return "redirect:/?joinResult=success";

	}else {//회원가입 실패
		return "redirect:/?joinResult=fail";
	}
    }
	}
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public String login(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw,
			HttpSession session) { //로그인되는 순간 세션객체 생성
		System.out.println(user_id+","+user_pw);
		String doorbell_num = null;
		String sessionDoorbellnum = mapper.sessionDoorbellNum(user_id);
		System.out.println(sessionDoorbellnum);
		SpringMember member = new SpringMember(user_id, user_pw, sessionDoorbellnum);
		SpringMember result= mapper.login(member);

		if(result==null) {//로그인 실패
			System.out.println("로그인 실패");
			return "redirect:/";
		}else {//로그인 성공
			session.setAttribute("member", result);
			session.setAttribute("user_id",user_id);
			return "redirect:/main";
	}
	}

	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
		
	}

	
	@RequestMapping(value="member/delete.do/{user_id}", method=RequestMethod.GET)//계속 실어져서 오는 데이터가 중가로 안에 실리고 실리는 데이터 키값 넣어주면됨 
	   public String delete(@PathVariable("user_id") String user_id) { //a태그는 무조건 겟방식으로 넘어온다고 생각하면 됨 // 경로에 실리는 경우 pathvariable 사용
	      System.out.println(user_id);
	   
	      int res = mapper.delete(user_id);
	      return "redirect:/select";
	}
		
	 @RequestMapping(value="member/checkDuplicateId", method=RequestMethod.GET)
	    public @ResponseBody String checkDuplicateId(@RequestParam("user_id") String user_id) {
	        SpringMember existingMember = mapper.idChk(user_id);
	        System.out.println("zz");
	        if (existingMember != null) {
	            // 중복된 ID가 이미 존재함
	            return "duplicate";
	        } else {
	            // 중복된 ID가 존재하지 않음
	            return "available";
	        }
	    }
		
	 @RequestMapping(value="member/checkDuplicateSkey", method=RequestMethod.GET)
	    public @ResponseBody String checkDuplicateSkey(@RequestParam("doorbell_num") String doorbell_num) {
	        SpringMember existingSkey = mapper.skChk(doorbell_num);
	        System.out.println(doorbell_num);
	        if (existingSkey != null) {
	            // 시리얼키 사용 가능
	            return "available";
	        } else {
	            // 등록되지 않거나 유효하지 않은 시리얼키
	            return "serialkeyerror";
	        }
	    }

}

